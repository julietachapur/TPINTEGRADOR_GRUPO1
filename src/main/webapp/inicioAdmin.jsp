<%@page import="entidad.Usuario" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<title>Inicio - Admin</title>
</head>
<body>
<script>
		<%
 			Usuario usuario = new Usuario();
		 	if(session.getAttribute("Usuario")!=null){	
		 		usuario = (Usuario)session.getAttribute("Usuario");
			}
		 	else {
		 	response.sendRedirect("/TPINTEGRADOR_GRUPO1/index.jsp");
		 	}
		
		%>
</script>

<header class="header"> 
<div>
	<a href="#">
		<img style = "float: left; margin: 2px 20px 10px 0; ; " src="img/logo.jpg"  alt="logo" width="50" height="50"  />
	</a>
</div>
<div class="logged">
	<span><%=usuario.getUsuario()%></span>
	<span>LOGGUEADO</span>
</div>
</header>

<div class="menu">
<a href="index.jsp" class="volver"> <span class="volverIcon fas fa-times-circle"></span>Salir</a>
<h1>Panel Administrador</h1>
<span>Seleccione la opción deseada: </span>

		<div class="opcionesMenu">
			<a href=adminClientes.jsp> Administrar Clientes </a>
			<a href=adminCuentas.jsp > Administrar Cuentas </a>
		  	<a href=/TPINTEGRADOR_GRUPO1/ServletPrestamosxAutorizar?getPrestamos>Administrar Préstamos </a>
		    <a href=/TPINTEGRADOR_GRUPO1/ServletMovimientos?getMovimientos> Informes </a>
		</div>
</div>
</body>
</html>