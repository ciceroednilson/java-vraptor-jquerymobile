package br.com.ciceroednilson.entity;

/***
 * 
 * @author cicero
 * 
 *ESSA CLASSE VAI REPRESENTAR OS TIPOS DE CONTATO(Amigo,Colega de Trabalho ou Família)
 */
public class TipoContatoEntity {
	

	private String codigo;
	private String descricao;
	
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public TipoContatoEntity(String codigo, String descricao) {
		super();
		this.codigo = codigo;
		this.descricao = descricao;
	}
	
}
