<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="<c:url value="/resources/css/jquery.mobile-1.4.5.min.css"/>">
<script src="<c:url value="/resources/javascript/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/javascript/jquery.mobile-1.4.5.min.js"/>"></script>

<script type="text/javascript">
	
	/*JQUERY- CARREGA NA INICIALIZAÇÃO DA PÁGINA*/
	$(document).ready(function(){
		
		/*JQUERY - LIMPA AS MENSAGENS QUANDO DE FOCU EM QUALQUER IMPUT*/
		$("input").focus(function() {
			
			$("span[style='color:red;']").text("");
			$("span[style='color:blue;']").text("");
		});
	});
	
</script>

</head>

<body>



	<!-- CRIANDO O ELEMENTO PAGE DO JQUERY MOBILE -->
	<div data-role="page" >
		
		<!-- CRIANDO O HEAD DA PÁGINA -->	
		<div data-role="header" data-position="fixed" data-theme="b">
		    <h1>Agenda</h1>
		     
		    <a href="<c:url value="/"/>" class="ui-btn ui-btn-a ui-corner-all ui-btn-inline ui-mini ui-btn-left ui-btn-icon-left ui-icon-carat-l">Voltar</a>
		  
		    <a href="#"  onclick="$('form#form_agenda').trigger('submit')"  class="ui-btn ui-btn-a ui-corner-all ui-btn-inline ui-mini ui-btn-right ui-btn-icon-right ui-icon-check">Salvar</a>
		</div>
		
		<!-- CRIANDO O CONTEXTO ONDE VAMOS ADICIONAR OS NOSSOS COMPONENTES HTML -->
		<div class="ui-content" role="main">
			
			<form id="form_agenda" action="<c:url value="/agenda/SalvarRegistro"/>"  method="post" data-ajax="false">	
			
			<!-- CRIANDO O AGRUPADOR -->
			<div class="ui-corner-all custom-corners">	
	  			<div class="ui-bar ui-bar-a">
	    			<h3>Novo Registro</h3>
	  			</div>
	  		<div class="ui-body ui-body-a">    		
					
					<span style="color:blue;" id="id_span_mensagem_sucesso">${mensagem_sucesso}</span>
					
	 				<label for="text-nome">Nome:</label>
					<input name="contatoEntity.nome" id="text-nome" type="text" maxlength="60" value="${contatoEntity.nome}">
					
					<!-- MOSTRA MENSAGEM DE ERRO REFERENTE AO CAMPO NOME -->
					<span style="color:red;">${errors.from('contatoEntity.nome')}</span>
		
					<fieldset data-role="controlgroup">
					    
					    <input name="contatoEntity.temWhatsApp" id="checkbox-tem-whatsapp" type="checkbox" value="S"/>
					    <label for="checkbox-tem-whatsapp">Tem WhatsApp</label>
					</fieldset>
		
					<fieldset data-role="controlgroup">
					    <legend>Tipo Telefone:</legend>
					        <input name="contatoEntity.tipoTelefone" id="radio-celular" value="C" checked="checked" type="radio"/>
					        <label for="radio-celular">Celular</label>
					        <input name="contatoEntity.tipoTelefone" id="radio-celular-comercial" value="L" type="radio"/>
					        <label for="radio-celular-comercial">Celular Comercial</label>
					</fieldset>
	    			
	    			<label for="text-numero-telefone">N.Tel:</label>
					<input name="contatoEntity.numeroTelefone" id="text-numero-telefone" type="text" value="${contatoEntity.numeroTelefone}"/>
					<span style="color:red;">${errors.from('contatoEntity.numeroTelefone')}</span>
					
					
					<label for="text-email">Email:</label>
					<input name="contatoEntity.email" id="text-email" type="text"  value="${contatoEntity.email}"/>
					<span style="color:red;">${errors.from('contatoEntity.email')}</span>
					
				    <label for="select-custom-1">Tipo Contato</label>
				    <select name="contatoEntity.tipoContato" id="select-custom-1" data-native-menu="false">
						<!-- CARREGANDO TIPOS DE CONTATO -->
						<c:forEach items="${tiposContato}" var="tipoContato">
						    <option value="${tipoContato.codigo}">${tipoContato.descricao}</option>
						</c:forEach>
					</select>
					
		
	 		</div>
	  		
	  		
			</div>
			
			</form>
		
		
		</div>
		
	
		<div data-role="footer" data-position="fixed" data-theme="b">
		<h2>www.ciceroednilson.com.br</h2>	    
		</div>
		
	
	</div>


    		
</body>
</html>
