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
	
	$(document).ready(function(){
		
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
		     
		    <a href="/index/index" class="ui-btn ui-btn-a ui-corner-all ui-btn-inline ui-mini ui-btn-left ui-btn-icon-left ui-icon-carat-l" data-rel="back">Voltar</a>
		  
		    <a href="#"  onclick="$('form#form_agenda').trigger('submit')"  class="ui-btn ui-btn-a ui-corner-all ui-btn-inline ui-mini ui-btn-right ui-btn-icon-right ui-icon-check">Salvar</a>
		</div>
		
		<!-- CRIANDO O CONTEXTO ONDE VAMOS ADICIONAR OS NOSSOS COMPONENTES HTML -->
		<div class="ui-content" role="main">
			
			<form id="form_agenda" action="<c:url value="/agenda/AlterarRegistro"/>"  method="post" data-ajax="false">	
			
			<!-- CRIANDO O AGRUPADOR -->
			<div class="ui-corner-all custom-corners">	
	  			<div class="ui-bar ui-bar-a">
	    			<h3>Editar Registro</h3>
	  			</div>
	  		<div class="ui-body ui-body-a">    		
					
					
					<label for="text-codigo">Código:</label>
					<input name="contatoEntity.codigo" id="text-codigo" type="text" readonly="readonly" value="${contatoEntity.codigo}">
					
					
	 				<label for="text-nome">Nome:</label>
					<input name="contatoEntity.nome" id="text-nome" type="text" maxlength="60" value="${contatoEntity.nome}">
		
					<fieldset data-role="controlgroup">
					    
					    <input name="contatoEntity.temWhatsApp" 
					    	   id="checkbox-tem-whatsapp" 
					    	   type="checkbox" 
					    	   value="S"
					    	   <c:if test="${contatoEntity.temWhatsApp == 'S'}">checked="checked"</c:if>
					    	  />
					    <label for="checkbox-tem-whatsapp">Tem WhatsApp</label>
					</fieldset>
		
					<fieldset data-role="controlgroup">
					    <legend>Tipo Telefone:</legend>
					        <input name="contatoEntity.tipoTelefone" id="radio-celular" value="C" type="radio" <c:if test="${contatoEntity.tipoTelefone == 'C'}">checked="checked"</c:if>>
					        <label for="radio-celular">Celular</label>
					        <input name="contatoEntity.tipoTelefone" id="radio-celular-comercial" value="L" type="radio" <c:if test="${contatoEntity.tipoTelefone == 'L'}">checked="checked"</c:if> />
					        <label for="radio-celular-comercial">Celular Comercial</label>
					</fieldset>
	    			
	    			<label for="text-numero-telefone">N.Tel:</label>
					<input name="contatoEntity.numeroTelefone" id="text-numero-telefone" type="text" value="${contatoEntity.numeroTelefone}">
					
					<label for="text-email">Email:</label>
					<input name="contatoEntity.email" id="text-email" type="text" value="${contatoEntity.email}">
				
				    <label for="select-custom-1">Tipo Contato</label>
				    <select name="contatoEntity.tipoContato" id="select-custom-1" data-native-menu="false">
						<!-- CARREGANDO TIPOS DE CONTATO -->
						<c:forEach items="${tiposContato}" var="tipoContato">
						    <option value="${tipoContato.codigo}" <c:if test="${contatoEntity.tipoContato == tipoContato.codigo}">selected="selected"</c:if> >${tipoContato.descricao}</option>
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
