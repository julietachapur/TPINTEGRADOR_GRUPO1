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
<h1 style="margin:auto;text-align:center;margin-bottom:30px;">Transferencias</h1>
<form class="form">
    <fieldset>
      <legend>Nueva transferencia</legend>
      <p class="inputForm">
        <label for="txtCbu">CBU</label>
        <input id="txtCbu" type="text"required name="txtCbu" placeholder="CBU..">
      </p>
      <p class="inputForm">
        <label for="txtDNI">DNI</label>
        <input id="txtDNI" type="text"required name="txtDNI" placeholder="DNI..">
      </p>
      <p class="inputForm">
        <label for="nombres">Monto</label>
        <input id="nombres" type="text"required name="txtNombre" placeholder="$..">
      </p>
      <p class="button">
        <input id="btnRealizarTransferencia" type="submit" value="Transferir" required name="btnRealizarTransferencia">
      </p>
    </fieldset>

</form>		
</body>
</html>