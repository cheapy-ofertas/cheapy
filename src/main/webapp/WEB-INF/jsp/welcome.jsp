<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cheapy" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet'>

 

<cheapy:layout pageName="home"> 
    <h2 class="titulo" style="font-family: 'Lobster'; font-size: 300%;  padding:30px"><fmt:message key="welcome"/></h2>
    <div class="row">
        <div class="col-md-12">
            <div class="img-home">
                <spring:url value="/resources/images/Logo Cheapy.png" htmlEscape="true" var="cheapyImage"/>
                <img class="img-responsive" src="${fn:escapeXml(cheapyImage)}"/>
            </div>
            <div class="btn-home-max">
	            <div class="btn-home">
	                <button  class="btn-block" type="button" role="link" onclick="window.location='/offers'" style="font-family: 'Lobster'; font-size: 20px;margin:5px;" >
	                <fmt:message key="listOffers"/> </button>
	            </div>
	            
	           <sec:authorize access="!isAuthenticated()">
              <div class="btn-home">
                      <button class="btn-block" type="button" role="link" onclick="window.location='/login'" style="font-family: 'Lobster'; font-size: 20px;margin:5px;" class="btn-block">
                      Iniciar sesión </button>
                  </div>
                <div class="btn-home">
                      <button class="btn-block" type="button" role="link" onclick="window.location='/sign-up-user/new'" style="font-family: 'Lobster'; font-size: 20px;margin:5px;" >
                      Registrar Usuario </button>
                  </div>
                  <div class="btn-home">
                      <button class="btn-block" type="button" role="link" onclick="window.location='/sign-up-client/new'" style="font-family: 'Lobster'; font-size: 20px;margin:5px;" >
                      Registrarse Cliente </button>
                  </div>
                    
              </sec:authorize>
              
              <sec:authorize access="hasAnyAuthority('usuario')">
              <div class="btn-home">
                      <button class="btn-block" type="button" role="link" onclick="window.location='/usuarios/favoritos/0'" style="font-family: 'Lobster'; font-size: 20px;margin:5px;" class="btn-block">
                      Mis Favoritos </button>
                  </div>
                    
              </sec:authorize>
	            
              <sec:authorize access="hasAnyAuthority('client')">
              <div class="btn-home">
                      <button class="btn-block" type="button" role="link" onclick="window.location='/myOffers'" style="font-family: 'Lobster'; font-size: 20px;margin:5px;" class="btn-block">
                      <fmt:message key="myOffers"/> </button>
                  </div>
                <div class="btn-home">
                      <button class="btn-block" type="button" role="link" onclick="window.location='/offersCreate'" style="font-family: 'Lobster'; font-size: 20px;margin:5px;" >
                      <fmt:message key="createOffers"/> </button>
                  </div>
                   <div class="btn-home">
                      <button class="btn-block" type="button" role="link" onclick="window.location='/myClientReviews'" style="font-family: 'Lobster'; font-size: 20px;margin:5px;" >
                      Mis Reseñas </button>
                  </div>
                    
              </sec:authorize>
              
              <sec:authorize access="hasAnyAuthority('notsubscribed', 'client')">
              	  <div class="btn-home">
                      <button class="btn-block" type="button" role="link" onclick="window.location='/pay/month'" style="font-family: 'Lobster'; font-size: 20px;margin:5px;" class="btn-block">
                      Renovar suscripción mensual</button>
                  </div>
                  <div class="btn-home">
                      <button class="btn-block" type="button" role="link" onclick="window.location='/pay/year'" style="font-family: 'Lobster'; font-size: 20px;margin:5px;" class="btn-block">
                      Renovar suscripción anual</button>
                  </div>
                    
              </sec:authorize>
              
            </div>
	        

        </div>
    </div>
</cheapy:layout>		        	 	        