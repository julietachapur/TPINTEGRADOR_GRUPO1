<%@page import="entidad.Usuario" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page session="true"%>
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

<%
	if(session.getAttribute("Usuario")!=null){	
		Usuario usuario = new Usuario();
		usuario = (Usuario)session.getAttribute("Usuario");	
	}
	else {
	%>
	<script>
		alert("Permiso denegado. Inicie sesion para continuar")
	</script>
	<%
 	response.sendRedirect("/TPINTEGRADOR_GRUPO1/Index.jsp");
	}
%>


<form class="form" method="post" action="ServletTransferencia">
    <fieldset>
      <legend>Nueva transferencia</legend>
      <p class="inputForm">
      	<label >Cuenta origen</label>
      
      </p>      
      <p class="inputForm">
        <label for="txtCbu">CBU destino</label>
        <input id="txtCbu" type="text"required name="txtCbu" placeholder="CBU..">
        <select>
        	
        	<option></option>
        </select>
      </p>
      <p class="inputForm">
        <label for="txtDNI">DNI destino</label>
        <input id="txtDNI" type="text"required name="txtDNI" placeholder="DNI..">
      </p>
      <p class="inputForm">
        <label for="txtMonto">Monto a transferir</label>
        <input id="txtMontoi" type="text"required name="txtMonto" placeholder="$00,00">
      </p>
      <p class="button">
        <input id="btnRealizarTransferencia" type="submit" value="Transferir" required name="btnRealizarTransferencia">
      </p>
    </fieldset>

</form>		
</body>
</html>