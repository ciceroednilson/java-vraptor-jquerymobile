package br.com.ciceroednilson.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.ciceroednilson.entity.ContatoEntity;
import br.com.ciceroednilson.entity.TipoContatoEntity;
import br.com.ciceroednilson.repository.AgendaRepository;

/*@Controller DEFINE QUE A CLASSE É UM CONTROLADOR
 *@Path CAMINHO PARA ACESSAR A CLASSE */
@Controller
@Path("/agenda")
public class AgendaController {

	/*CDI - @Inject: INJETANDO O OBJETO Result */
	@Inject
    private Result result;
	
	/*Validator: OBJETO DO VRAPTOR QUE VAMOS USAR PARA MOSTRAR 
	 *AS MENSAGENS DE VALIDAÇÃO DOS CAMPOS*/
	@Inject
	private Validator validator;
	
	@Inject
	private AgendaRepository agendaRepository;

	/*@Path CAMINHO/NOME PARA ACESSAR O MÉTODO.
	 * 
	 * QUANDO CHAMARMOS NA URL A NOSSA APLICAÇÃO NO 
	 * CAMINHO HTTP://LOCALHOST:PORTA/AgendaVraptor/novoRegistro.html É EXECUTADO O MÉTODO novoRegistro 
	 * QUE VAI CHAMAR A NOSSA PÁGINA JSP QUE FICA EM WEB-INF/jsp/agenda/novoRegistro.jsp.
	 * 
	 * A PASTA ONDE VAI FICAR A NOSSA PÁGINA DEVE TER O MESMO NOME DA CLASSE SEM O NOME Controller,
	 * E A PÁGINA TAMBÉM DEVE TER O MESMO NOME DO MÉTODO.
	 */
	@Path("/novoRegistro.html")
	public void novoRegistro(){
		
		/*CARREGA OS TIPOS DE CONTATOS PARA MOSTRAR NA TELA*/		
		result.include("tiposContato", this.GetTiposContato());
	}
	/*MONTA LISTA COM OS TIPOS DE CONTATO*/
	private List<TipoContatoEntity> GetTiposContato(){
		
		List<TipoContatoEntity> tiposContato = new ArrayList<TipoContatoEntity>();
		
		tiposContato.add(new TipoContatoEntity("A", "Amigo"));
		tiposContato.add(new TipoContatoEntity("C", "Colega de Trabalho"));
		tiposContato.add(new TipoContatoEntity("F", "Família"));
		
		return tiposContato;
	}
	
	/*SALVA UM NOVO REGISTRO*/
	@Post
	public void SalvarRegistro(ContatoEntity contatoEntity){
		
		/*VALIDANDO OS CAMPOS SE ESTÃO VAZIOS*/
		if(contatoEntity.getNome() == null || contatoEntity.getNome().trim().equals(""))
			validator.add(new SimpleMessage("contatoEntity.nome", "O nome é de preenchimento obrigatório!"));
		
		if(contatoEntity.getEmail() == null || contatoEntity.getEmail().trim().equals(""))
			validator.add(new SimpleMessage("contatoEntity.email", "O Email é de preenchimento obrigatório!"));
		
		if(contatoEntity.getNumeroTelefone() == null)
			validator.add(new SimpleMessage("contatoEntity.numeroTelefone", "O Número de Telefone é de preenchimento obrigatório!"));
		
		
		if(validator.getErrors().size() >0){
			
			validator.onErrorRedirectTo(AgendaController.class).novoRegistro();
		}
		else{
			
			if(contatoEntity.getTemWhatsApp() == null)
				contatoEntity.setTemWhatsApp("N");
			
			/*SALVANDO UM NOVO REGISTRO*/
			agendaRepository.Salvar(contatoEntity);
			
			/*MENSAGEM DE SUCESSO APÓS SALVARMOS O REGISTRO*/
			result.include("mensagem_sucesso", "Registro salvo com sucesso!");
			
			/*REDIRECIONA PARA CADASTRAR UM NOVO REGISTRO*/
			result.redirectTo(AgendaController.class).novoRegistro();
			
		}
			
		
	} 

	/*CONSULTA OS REGISTROS CADASTRADOS*/	
	@Path("/consultarRegistros.html")
	public void consultarRegistros(){
	
		result.include("listacontatos", agendaRepository.TodosContatos());
	}
	
	/*BUSCA REGISTRO PARA ALTERAÇÃO*/
	@Get
	@Path("/editarRegistro.html/{codigo}")
	public void editarRegistro(Integer codigo){
		
		result.include("tiposContato",  this.GetTiposContato());
		result.include("contatoEntity", agendaRepository.GetContato(codigo));
		
	}
	
	/*ALTERA O REGISTRO APÓS EDITADO*/
	@Post
	public void AlterarRegistro(ContatoEntity contatoEntity){
		
		if(contatoEntity.getNome() == null || contatoEntity.getNome().trim().equals(""))
			validator.add(new SimpleMessage("contatoEntity.nome", "O nome é de preenchimento obrigatório!"));
		
		if(contatoEntity.getEmail() == null || contatoEntity.getEmail().trim().equals(""))
			validator.add(new SimpleMessage("contatoEntity.email", "O Email é de preenchimento obrigatório!"));
		
		if(contatoEntity.getNumeroTelefone() == null)
			validator.add(new SimpleMessage("contatoEntity.numeroTelefone", "O Número de Telefone é de preenchimento obrigatório!"));
		
		
		if(validator.getErrors().size() >0){
			
			validator.onErrorRedirectTo(AgendaController.class).editarRegistro(contatoEntity.getCodigo());
		}
		else{
			
			if(contatoEntity.getTemWhatsApp() == null)
				contatoEntity.setTemWhatsApp("N");
			
			agendaRepository.Alterar(contatoEntity);
						
			result.redirectTo(AgendaController.class).consultarRegistros();
			
		}
			
		
	}

	/*CHAMA A PÁGINA PARA EXCLUIR O REGISTRO*/
	@Path("/excluirRegistro.html")
	public void excluirRegistro(){
				
		result.include("listacontatos", agendaRepository.TodosContatos());
		
	}
	
	/*EXCLUI O CONTATO*/
	@Post
	@Path("/deletar")
	public void deletar(ContatoEntity contatoEntity){
		
		this.agendaRepository.Excluir(contatoEntity.getCodigo());
		
		/*RECARREGA Á PÁGINA APÓS EXCLUIR O REGISTRO*/
		result.redirectTo(AgendaController.class).excluirRegistro();
	}
}
