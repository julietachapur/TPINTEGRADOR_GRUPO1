<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestionar cuentas</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
</head>
<body>
<a href="login.jsp"> <span class="fas fa-times-circle"></span>Salir</a>
<h1 style="margin:auto; margin-bottom:20px; text-align:center;">Gestionar Cuentas</h1>
<div class="menu">
	<div class="opcionesMenu">
			<a href=movimientos.jsp>Movimientos</a>
			<a href=transferencias.jsp >Transferencias</a>
		  	<a href=administrarPrestamos.jsp>Administrar Préstamos</a>
		</div>
</div>
</body>
</html>