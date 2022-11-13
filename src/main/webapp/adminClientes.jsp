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
<title>Administrar Cuentas - Admin</title>
</head>
<body>
<a href="inicioAdmin.jsp"> <span class="fa fa-home"></span> Volver</a>
<div class="menu">
<h1>Administrar Cuentas</h1>
<span>Seleccione la opción deseada: </span>
		<div class="opcionesMenu">
			<a href="/TPINTEGRADOR_GRUPO1/ServletCliente?getTxtDni"> Alta nuevo Cliente </a> 
			<a href="/TPINTEGRADOR_GRUPO1/ServletCliente?getId" > Modificar - Eliminar Cliente </a>
		</div>
</div>


</body>
</html>