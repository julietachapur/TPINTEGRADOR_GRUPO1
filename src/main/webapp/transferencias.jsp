<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transferencias</title>
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
</head>
<body>
<a href="gestionarCuentas.jsp"> <span class="fa fa-home"></span> Volver</a>

<form class="form">
    <fieldset>
      <legend>Nuevo cliente</legend>
      <p class="inputForm">
        <label for="dni">DNI</label>
        <input id="dni" type="text"required name="txtDNI">
      </p>
      <p class="inputForm">
        <label for="nombres">Nombre</label>
        <input id="nombres" type="text"required name="txtNombre">
      </p>
      <p class="inputForm">
        <label for="apellidos">Apellido</label>
        <input id="apellidos" type="text" required name="txtApellido">
      </p>
      <p class="inputForm">
        <label for="sexo">Sexo</label>
        <select id="sexo" name="sexo" required>
        	<option value="F">F<option>
        	<option value="M">M<option>
        	<option value="X">X<option>
        </select>
      </p>
      <p class="inputForm">
        <label for="nacionalidad">Nacionalidad</label>
        <select id="nacionalidad" name="nacionalidad" required>
        	<option>Datos tabla Países de la BD<option>
        </select>
      </p>
      <p class="inputForm">
        <label for="direccion">Dirección</label>
        <input id="direccion" type="text" required name="txtDireccion">
      </p>
      <p class="inputForm">
        <label for="localidad">Localidad</label>
        <select id="localidad" name="localidad" required>
        	<option>Datos tabla Localidades de la BD<option>
        </select>
      </p>
      <p class="inputForm">
        <label for="email">E-mail</label>
        <input id="email" type="email" required name="txtEmail">
      </p>
      <p class="button">
        <input id="btnRegistrar" type="submit" value="Registrar" required name="btnAltaCliente">
      </p>
    </fieldset>

</form>		
</body>
</html>