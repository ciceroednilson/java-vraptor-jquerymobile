package br.com.ciceroednilson.entity;

import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/***
 * 
 * @author cicero
 *CLASSE QUE VAI SER PERSISTIDA NO BANCO DE DADOS. 
 */

/*ANOTAÇÕES JPA*/
@Table(name="tb_agenda")
@Entity
public class ContatoEntity {

	/*ANOTAÇÕES JPA*/
	@Id
	@GeneratedValue(strategy=  GenerationType.IDENTITY)
	@Column(name="id_agenda")
	private Integer codigo;
	
	/*ANOTAÇÕES JPA*/
	@Column(name="ds_nome")
	private String  nome;
	
	
	@Column(name="fl_whatsapp")
	private String temWhatsApp;
	
	@Column(name="fl_tipoTelefone")
	private String  tipoTelefone;
	
	@Column(name="nr_telefone")
	private BigInteger numeroTelefone;
	
	@Column(name="ds_email")
	private String  email;
	
	@Column(name="fl_tipoContato")
	private String  tipoContato;
	
	public Integer getCodigo() {
		return codigo;
	}
	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getTemWhatsApp() {
		return temWhatsApp;
	}
	public void setTemWhatsApp(String temWhatsApp) {
		this.temWhatsApp = temWhatsApp;
	}
	public String getTipoTelefone() {
		return tipoTelefone;
	}
	public void setTipoTelefone(String tipoTelefone) {
		this.tipoTelefone = tipoTelefone;
	}
	public BigInteger getNumeroTelefone() {
		return numeroTelefone;
	}
	public void setNumeroTelefone(BigInteger numeroTelefone) {
		this.numeroTelefone = numeroTelefone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTipoContato() {
		return tipoContato;
	}
	public void setTipoContato(String tipoContato) {
		this.tipoContato = tipoContato;
	}
}
