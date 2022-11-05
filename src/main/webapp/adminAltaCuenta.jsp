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
<title>Alta Cuenta - Admin</title>
</head>
<body>
<div class="logged">loggeado</div>
<a href="inicioAdmin.jsp"> <span class="fa fa-home"></span> Volver</a>
<div class="menu">
	<h2>Alta de Cuenta</h2>
	 <form>
		 <label for="labeldni">Buscar DNI:</label><br>
		 <input type="text" name="txtdni" required>
		 <input type="submit" value="Buscar" name="btnBuscar">
	 </form>
	 <dl>
<dt>Cuenta 0001</dt>
<dd>estado 1</dd>
<dt>Cuenta 0002</dt>
<dd>estado 2</dd>
</dl>
	 	
	<label for="TC">Elige un tipo de cuenta:</label>

<select name="TC">
  <option value="CA">Caja de Ahorro</option>
  <option value="CC">Cuenta Corriente</option>
</select>
<input type="submit" value="Agregar" name="btnAgregar">
		 </div>
</body>
</html>