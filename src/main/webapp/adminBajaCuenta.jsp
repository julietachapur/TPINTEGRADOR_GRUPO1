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
<title>Baja Cuenta - Admin</title>
</head>
<body>
<div class="logged">loggeado</div>
<a href="inicioAdmin.jsp"> <span class="fa fa-home"></span> Volver</a>
<div class="menu">
	<h2>Baja de Cuenta</h2>
	 <form>
		 <label for="labeldni">Buscar DNI:</label><br>
		 <input type="text" name="txtdni" required>
		 <input type="submit" value="Buscar" name="btnBuscar">
	 </form>
	 
	 <table border="1">
<tr>	
<th>Nro Cuenta</th>
<th>CBU</th>
<th>DNI</th>
<th>fecha de creacion</th>
<th>tipo de Cuenta</th>
<th>Saldo</th>
<th>Estado</th>
</tr>
<tr>
<td>001</td>
<td>11111111</td>
<td>56809576</td>
<td>5/11/2022</td>
<td>1</td>
<td>1000000</td>
<td>Activo</td>
<td><input type="button" value="Baja"></td>
</tr>
</table>
</body>
</html>