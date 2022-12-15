<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<title>Inicio - Banco LABIV</title>
</head>

<body>

<% 
	boolean pedirDni = false;
	boolean isCliente = true;

	if(request.getAttribute("isCliente") != null)
	{
		isCliente = (Boolean) request.getAttribute("isCliente");

	}

	if(request.getAttribute("pedirDni") != null)
	{
		pedirDni = (Boolean) request.getAttribute("pedirDni");

	}
	
 %>
 
 
<div class="menuIndex">
<img style = "float: left; margin: 2px 20px 10px 0; ; " src="img/logo.jpg"  alt="logo" width="50" height="50"  />
	<h1>Online Banking Banco LABIV </h1>
	
<% if( pedirDni == false && isCliente == true ) { %>
	<h2>Acceso</h2>
	
 	<form class="form" action="ServletUsuario" method="post">
 	    <fieldset>
		<p class="inputIndex">
		 <input value="400" type="text" name="txtDNI" required> 
		 <!-- placeholder="Tu DNI" -->		 
		 </p>
		<p class="inputIndex">
		 <input value="Julian" type="text" name="txtUsuario" required  >
		 <!-- placeholder="Tu clave" -->
		 </p>
		<p class="inputIndex">
		 <input value="clave" type="password" name="txtClave" required >
		 <!-- placeholder="Tu clave" -->
		 </p>
      <p class="btnIniciarSesion">		
		 <input type="submit" value="Iniciar" name="btnIniciarSesion" ID="btnIniciarSesion">
		 		 </p>
		</fieldset>
		 		 
	 </form>
	
	 <div class="opcionesIndex">
	 		<a href="/TPINTEGRADOR_GRUPO1/ServletUsuario?btnIndex">Recuperar clave - Crear Usuario</a>
	  </div>
	 <%} else {%>	  
	  	 <form class="form" action="ServletUsuario" method="post">
		<p class="inputIndex">
		 <input placeholder="Tu DNI" type="text" name="txtDNI" required >
		 </p>
      <p class="btnIniciarSesion">		
		 <input type="submit" value="Siguiente" name="btnSiguiente" ID="btnIniciarSesion">
	  </p>	      		 
	 </form>
	  	 <%} %>	  

	    
	  
	  <div style="display:flex; flex-direction: column; align-items: center;">
<% if( isCliente == false) { %>	
		<p style="font-size: 1.5rem;">Cliente no encontrado. Por favor acerquese a alguna sucursal para realizar el alta. <p>
	</div>
<%} %>

	    	    </div>
	    <%
	    if (request.getAttribute("SesionFallida") != null){
	    	%>
	    	<script>
	    	alert("Usuario o clave no valida, intente nuevamente.");
	    	</script>
	    	<%
	    }
	    %>
	    
	    
</body>
</html>