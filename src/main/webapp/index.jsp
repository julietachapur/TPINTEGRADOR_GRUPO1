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
 <form action="ServletUsuario" method="post">
		 <label for="txtUsuario" >Usuario:</label><br>
		 <input type="text" name="txtUsuario" required value="Nahuel"><br><br>
		 <label for="txtDNI" >DNI:</label><br>
		 <input type="text" name="txtDNI" required value="22232425"><br><br>
		 <label for="txtClave">Contrase�a:</label><br>
		 <input type="text" name="txtClave" required value="clave"><br><br>
		 <input type="submit" value="Iniciar" name="btnIniciarSesion">
	 </form>
	
	 <div class="opcionesMenu">
	 			<a href=CrearCuenta.jsp>No sos Usuario aun?,Crea uno!</a>
	  </div>
	    </div>
	    
	    <%
	    if (request.getAttribute("SesionFallida") != null){
	    	%>
	    	<script>
	    	alert("Usuario o clave no valida, intente nuevamente.");
	    	</script>
	    	<%
	    }
	    %>
</body>
</html>