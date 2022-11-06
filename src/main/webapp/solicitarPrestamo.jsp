<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Solicitar prestamo</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
</head>
<body>
<a href="gestionarCuentas.jsp"> <span class="fa fa-home"></span> Volver</a>
<h1 style="margin:auto;text-align:center;margin-bottom:30px;">Solicitar nuevo prestamo</h1>
<form class="form">
    <fieldset>
      <legend>Solicitud de prestamo</legend>
      <p class="inputForm">
        <label for="txtMonto">Monto solicitado</label>
        <input id="txtMonto" type="text"required name="txtMonto" placeholder="$..">
      </p>
      <p class="inputForm">
        <label for="txtCuotas">Cant. De cuotas</label>
        <input id="txtCuotas" type="text"required name="txtCuotas" placeholder="">
      </p>
      <p class="inputForm">
        <label for="txtDate">Fecha de depósito</label>
        <input id="txtDate" type="date"required name="txtDate" placeholder="">
      </p>
      <p class="buton">
        <input id="btnRealizarTransferencia" type="submit" value="Solicitar" required name="btnRealizarTransferencia">
      </p>
    </fieldset>
</form>		
</body>
</html>