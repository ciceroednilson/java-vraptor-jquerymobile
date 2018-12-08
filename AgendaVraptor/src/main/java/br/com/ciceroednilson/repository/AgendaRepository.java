package br.com.ciceroednilson.repository;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.ciceroednilson.entity.ContatoEntity;

public class AgendaRepository {
    /*     
     * 
     * O plugin VRaptor JPA cuida da criação e injeção de depedência da EntityManager e EntityManagerFactory. 
     * Além disso, o plugin aplica o padrão Open EntityManager In View, isto é, ele abre uma transação com o 
     * banco de dados no ínicio da requisição e executa o commit da transação no fim da requisição.
     * 
     * Fonte:http://www.vraptor.org/pt/docs/plugins/
     * 
     * Isso só é possível por que no nosso arquivo pom.xml adicionamos a dependência
     * <dependency>
     *   <groupId>br.com.caelum.vraptor</groupId>
     *   <artifactId>vraptor-jpa</artifactId>
     *   <version>4.0.4</version>
     * </dependency> 
     * 
     * CDI: @Inject está injetando o objeto EntityManager na nossa classe.
     * */
	@Inject
	private EntityManager em;
	
	public AgendaRepository(){
		
	}	
	public void Salvar(ContatoEntity contatoEntity){
		
		em.persist(contatoEntity);
	}
	@SuppressWarnings("unchecked")
	public List<ContatoEntity> TodosContatos(){
	
		return em.createQuery("SELECT c FROM ContatoEntity c ORDER BY c.nome ").getResultList();
	}	
	public ContatoEntity GetContato(int codigo){
		
		return em.find(ContatoEntity.class, codigo);
	}	
	public void Alterar(ContatoEntity contatoEntity){
		
		em.merge(contatoEntity);
	}
	public void Excluir(Integer codigo){
		
		ContatoEntity contatoEntity =  this.GetContato(codigo);
		
		em.remove(contatoEntity);		
		
	}
}
