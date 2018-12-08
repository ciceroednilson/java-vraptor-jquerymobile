<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="resources/css/jquery.mobile-1.4.5.min.css">
<script src="resources/javascript/jquery.min.js"></script>
<script src="resources/javascript/jquery.mobile-1.4.5.min.js"></script>

</head>
<body>

<!-- CRIANDO O ELEMENTO PAGE DO JQUERY MOBILE -->
<div data-role="page" >
	
	<!-- CRIANDO O HEAD DA PÁGINA -->	
	<div data-role="header" data-position="fixed" data-theme="b">
	    <h1>Agenda</h1>
	</div>
	
	<!-- CRIANDO O CONTEXTO ONDE VAMOS ADICIONAR OS NOSSOS COMPONENTES HTML -->
	<div class="ui-content" role="main">

		<!-- CRIANDO O AGRUPADOR -->
		<div class="ui-corner-all custom-corners">	
  			<div class="ui-bar ui-bar-a">
    			<h3>OPÇÕES</h3>
  			</div>
  		<div class="ui-body ui-body-a">    		
  		
    		<!-- CRIANDO A LISTA COM AS OPÇÕES -->
			<ul data-role="listview" data-inset="true">
			    <li><a href="${linkTo[AgendaController].novoRegistro()}">Cadastrar</a></li>
			    <li><a href="${linkTo[AgendaController].consultarRegistros()}">Consultar</a></li>
			    <li><a href="${linkTo[AgendaController].excluirRegistro()}">Excluir</a></li>
			</ul>
    		
    		
  		</div>
  		
	</div>
	
	

	</div>
		
	<div data-role="footer" data-position="fixed" data-theme="b">
	    <h2>www.ciceroednilson.com.br</h2>
	</div>

</div>

</body>
</html>
