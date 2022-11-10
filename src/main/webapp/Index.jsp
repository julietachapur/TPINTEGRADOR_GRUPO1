<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOME</title>
</head>
<body>
<h1>Banco X</h1>
<a href="Index.jsp"> Inicio </a>
<a href="Index.jsp"> Hacete Cliente </a>
<a href="Index.jsp"> Clientes </a>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<title>Bienvenido</title>
</head>
<body>
<div class="menu">
<img style = "float: left; margin: 2px 20px 10px 0; ; " src="img/logo.jpg"  alt="logo" width="50" height="50"  />
<h2>Bienvenido a el Banco LABIV</h2>
 <form action="inicioClientes.jsp" method="post">
		 <label for="labelUsuario">Usuario:</label><br>
		 <input type="text" name="txtUsuario" required><br><br>
		 <label for="labeldni">DNI:</label><br>
		 <input type="text" name="txtDNI" required><br><br>
		 <label for="lblContraseña">Contraseña:</label><br>
		 <input type="text" name="txtContraseña" required><br><br>
		 <input type="submit" value="Iniciar sesion" name="btnIniciarSesion">
	 </form>
	
	 <div class="opcionesMenu">
	 			<a href=CrearCuenta.jsp>No sos Usuario aun?,Crea uno!</a>
	  </div>
	    </div>
</body>
</html>