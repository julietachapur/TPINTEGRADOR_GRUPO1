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
<title>Administrar Clientes - Admin</title>
</head>
<body>
<a href="inicioAdmin.jsp"> <span class="fa fa-home"></span> Volver</a>
<div class="menu">
<h1>Administrar Clientes</h1>
<span>Seleccione la opci�n deseada: </span>
		<div class="opcionesMenu">
			<a href="altaCliente.jsp"> Alta nuevo Cliente </a>
			<a href="modifCliente.jsp" > Modificar/Eliminar Cliente </a>
		</div>
</div>


</body>
</html>