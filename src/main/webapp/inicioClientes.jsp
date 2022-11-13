<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Usuario" %>
<%@page import="entidad.Cliente" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
	<style type="text/css">
		<jsp:include page="css/style.css"></jsp:include>
	</style>
	<title>Inicio - Cliente</title>
</head>
<body onLoad="bienvenida();"> 
	<a href="index.jsp"> <span class="fas fa-times-circle"></span>Salir</a>
	<div class="menu">
	<h1>Panel Cliente</h1>
	<span>Seleccione la opción deseada: </span>
			<div class="opcionesMenu">
				<a href="gestionarCuentas.jsp"> Cuentas </a>  
				<a href="clienteInforPersonal.jsp"> Información personal </a>
			  	<a href="informes.jsp"> Informes </a>
			</div>
	</div>
	
	<script>
		<%
		 	if(session.getAttribute("Usuario")!=null){	
		 		Usuario usuario = new Usuario();
		 		usuario = (Usuario)session.getAttribute("Usuario");
		%>
	
			function bienvenida(){alert("Bienvenido <%=usuario.getcliente().getNombre()%> <%=usuario.getcliente().getApellido()%>");}
		<%
			}
		 	else {
		 %>
		 //alert("INICIE SESION PARA CONTINUAR.");
		 <%
		 	response.sendRedirect("/Index.jsp");
		 	}
		%>
	</script>
</body>
</html>
