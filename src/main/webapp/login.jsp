<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login - Banco LaboIV</title>
</head>
<body>
	 <h1> Login </h1>
	 <br><br>
	 <form action="inicioClientes.jsp">
		 <label for="labelUsuario">Usuario:</label><br>
		 <input type="text" name="txtUsuario" ><br><br>
		 <label for="labelContraseña">Contraseña:</label><br>
		 <input type="text" name="txtContraseña" ><br><br>
		 <input type="submit" value="Agregar" name="btnAgregar">
	 </form>
	 <br><br>
	 <br><br>
	 <a href=inicioAdmin.jsp>PANEL ADMIN</a>
	 
</body>
</html>