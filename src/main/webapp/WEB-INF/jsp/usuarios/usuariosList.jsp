<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cheapy" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet'>

<cheapy:layout pageName="usuarios">
    <h2 style="font-family: 'Lobster'; text-align:center; font-size:200%;  color: rgb(0, 64, 128); padding:10px"><fmt:message key="users"/></h2>
    
	<c:if test="${empty usuarioLs }">
		<p id="vacio" >No hay ningún usuario.</p>
	</c:if>
	<c:if test="${not empty usuarioLs }">
	<div class="table-responsive">
	    <table id="usuarioTable" class="table table-striped">
	        <thead>
	        <tr>
	        	<th><fmt:message key="nameUser"/></th>
	        	<th><fmt:message key="surname"/></th>
	        	<th><fmt:message key="user"/></th>
	        	<th><fmt:message key="enabled"/></th>   
	            <th> </th>
	        </tr>
	        </thead>
	        <tbody>
	        <c:forEach items="${usuarioLs}" var="usuario">
	            <tr>
	            	<td>
	                    <c:out value="${usuario.nombre}"/>
	                </td>
	                <td>
	                    <c:out value="${usuario.apellidos}"/>
	                </td>
	                <td>
	                    <c:out value="${usuario.usuar.username}"/>
	                </td>
	                <td>
	                	<c:if test="${usuario.usuar.enabled == 'true'}">
			            	<c:out value="Si"/>
			            </c:if>	
			            <c:if test="${usuario.usuar.enabled == 'false'}">
			                 <c:out value="No"/>
			             </c:if>
	                </td>
	                <td>
		                <spring:url value="/administrators/usuarios/{username}" var="usuarioUrl">
		                        <spring:param name="username" value="${usuario.usuar.username}"/>
		                </spring:url>
		                <div class="btn-detalles">
	                		<button type="button" role="link" onclick="window.location='${fn:escapeXml(usuarioUrl)}'" style="font-family: 'Lobster'; font-size: 20px;">
	                		<span class="glyphicon glyphicon-info-sign" aria-hidden="true" style="padding: 5px"> </span>
		                	<fmt:message key="details"/></button>
	            		</div>
	                </td>     
	            </tr>
	        </c:forEach>
	        </tbody>
	    </table>
    </div>
    <div class="text-center">
    	<c:out value='Página ${page}'></c:out>
    </div>
    <div>
    <c:if test='${page!=0}'>
   	<div class="text-left">
    	<spring:url value="/administrators/usuarios{page}" var="usuarioListUrl">
    		<spring:param name="page" value="${page-1}"/>
    	</spring:url>
    	<button type="button" class="btn-pag" role="link" onclick="window.location='${fn:escapeXml(usuarioListUrl)}'" style="font-family: 'Lobster'; font-size: 20px;">
		<span class="glyphicon 	glyphicon glyphicon-arrow-left" aria-hidden="true" style="padding: 5px"> </span>
		Pág. anterior</button>
	</div>	
    </c:if>
    
    <c:if test="${fn:length(usuarioLs) == 3 && nextPage > 0}">
    <div class="text-right">
    	
    	<spring:url value="/administrators/usuarios{page}" var="usuarioListUrl">
    		<spring:param name="page" value="${page+1}"/>
    	</spring:url>
    	<button type="button" class="btn-pag"  role="link" onclick="window.location='${fn:escapeXml(usuarioListUrl)}'" style="font-family: 'Lobster'; font-size: 20px;">
		<span class="glyphicon 	glyphicon glyphicon-arrow-right" aria-hidden="true" style="padding: 5px"> </span>
		Pág. siguiente</button>
	</div>	
	</c:if>
	</div>
    </c:if>
</cheapy:layout>
