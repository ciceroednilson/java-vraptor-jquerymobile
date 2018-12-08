<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="<c:url value="/resources/css/jquery.mobile-1.4.5.min.css"/>">
<script src="<c:url value="/resources/javascript/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/javascript/jquery.mobile-1.4.5.min.js"/>"></script>


</head>
<body>



	<!-- CRIANDO O ELEMENTO PAGE DO JQUERY MOBILE -->
	<div data-role="page" >
		
		<!-- CRIANDO O HEAD DA PÁGINA -->	
		<div data-role="header" data-position="fixed" data-theme="b">
		    <h1>Agenda</h1>
		    <a href="<c:url value="/"/>" class="ui-btn ui-btn-a ui-corner-all ui-btn-inline ui-mini ui-btn-left ui-btn-icon-left ui-icon-carat-l">Voltar</a>
		  
		</div>
		
		<!-- CRIANDO O CONTEXTO ONDE VAMOS ADICIONAR OS NOSSOS COMPONENTES HTML -->
		<div class="ui-content" role="main">
		
			<ul data-role="listview" data-filter="true" data-filter-placeholder="Contatos..." data-inset="true">


			    <li data-role="list-divider">Contatos<span class="ui-li-count">${fn:length(listacontatos)}</span></li>
			    
			    <c:forEach var="contato" items="${listacontatos}">
				    <li>

				    	<a href="<c:url value="/agenda/editarRegistro.html/${contato.codigo}"/>">
							<c:choose>
							  <c:when test="${contato.tipoContato == 'A'}">
							    	<h2>${contato.nome} - Amigo</h2>
							  </c:when>
							  <c:when test="${contato.tipoContato == 'C'}">
									<h2>${contato.nome} - Colega de Trabalho</h2>
							  </c:when>
							  <c:otherwise>
							    	<h2>${contato.nome} - Família</h2>
							  </c:otherwise>
							</c:choose>
				    				    		
				    		<p><strong>${contato.email}</strong></p>

							<c:choose>
							  <c:when test="${contato.tipoTelefone == 'C'}">
							    	<p>Celular - ${contato.numeroTelefone}</p>
							  </c:when>				    		
							  <c:otherwise>
							    	<p>Celular Comercial - ${contato.numeroTelefone}</p>
							  </c:otherwise>
							</c:choose>				    		
				    						    		
							<c:choose>
							  <c:when test="${contato.temWhatsApp == 'S'}">
							    	<p>Tem WhatsApp</p>
							  </c:when>				    		
							  <c:otherwise>
							    	<p>Não tem WhatsApp</p>
							  </c:otherwise>
							</c:choose>
				    		
				    		
				        	<p class="ui-li-aside"><strong>Cód.</strong>${contato.codigo}</p>
				    	</a>
				    </li>
			    </c:forEach>
    
			</ul>
			
		</div>
		
	
		<div data-role="footer" data-position="fixed" data-theme="b">
		<h2>www.ciceroednilson.com.br</h2>	    
		</div>
		
	
	</div>


    		
</body>
</html>