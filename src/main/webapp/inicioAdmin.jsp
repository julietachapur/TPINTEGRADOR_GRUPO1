<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<a href="login.jsp"> <span class="fas fa-times-circle"></span>Salir</a>
<div class="menu">
<h1>Panel Administrador</h1>
<span>Seleccione la opción deseada: </span>
		<div class="opcionesMenu">
			<a href=adminClientes.jsp> Administrar Clientes </a>
			<a href=adminCuentas.jsp > Administrar Cuentas </a>
		  	<a href=adminPrestamos.jsp> Préstamos </a>
		    <a href=reportes.jsp> Informes </a>
		</div>
</div>

</body>
</html>