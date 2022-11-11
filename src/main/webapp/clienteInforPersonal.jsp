<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
	<style type="text/css">
		<jsp:include page="css/style.css"></jsp:include>
	</style>
	<title>Informacion personal </title>
</head>
<body>
	<a href="inicioClientes.jsp"> <span class="fa fa-home">Volver</span></a>
	<div class="inforPer">
	<h1>#Nombre Personal</h1>
	<span>Datos:</span>
			<table class="tablaDatos">
				<tr>
			    	<th>DNI</th>
				    <th>Nombre</th>
			    	<th>Apellido</th>
			    	<th>CUIL</th>
			  	</tr>
				<tr>
					<td>Ejemplo cliente</td>
					<td>Ejemplo cliente</td>
					<td>Ejemplo cliente</td>
					<td>Ejemplo cliente</td>
				</tr>
		</table>
		<br>
		<span>Cuentas:</span>
			<table class="tablaCuentas">
				<tr>
					<td>Nro.</td>
					<td>CBU</td>
					<td>Tipo</td>
					<td>Saldo</td>
				</tr>	
				<tr>
					<td>Ejemplo Cuenta 1</td>
					<td>Ejemplo Cuenta 1</td>
					<td>Ejemplo Cuenta 1</td>
					<td>Ejemplo Cuenta 1</td>
				</tr>
				<tr>
					<td>Ejemplo Cuenta 2</td>
					<td>Ejemplo Cuenta 2</td>
					<td>Ejemplo Cuenta 2</td>
					<td>Ejemplo Cuenta 2</td>
				</tr>
				<tr>
					<td>Ejemplo Cuenta 3</td>
					<td>Ejemplo Cuenta 3</td>
					<td>Ejemplo Cuenta 3</td>
					<td>Ejemplo Cuenta 3</td>
				</tr>
			</table>
		
	</div>
	

</body>
</html>