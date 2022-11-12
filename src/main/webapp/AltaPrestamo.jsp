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
<div class="logged">loggeado</div>
<a href="inicioAdmin.jsp"> <span class="fa fa-home"></span> Volver</a>
<h1>Autorización Prestamos</h1>
<table border="1">
<tr>	
<th>Cliente</th>
<th>Fecha</th>
<th>Importe a pagar cliente con interés</th>
<th>importe pedido por cliente</th>
<th>plazo de pago</th>
<th>monto a pagar</th>
<th>meses</th>
<th>cuotas</th>
<th colspan="2">Autorización</th>
</tr>
<tr>
<td>001</td>
<td>5/11/2022</td>
<td>$125000</td>
<td>$100000</td>
<td>12 meses</td>
<td>1000000</td>
<td>12</td>
<td>12</td>
<td><input type="button" value="Alta"></td>
<td><input type="button" value="Denegar"></td>
</tr>
</table>
</body>
</html>