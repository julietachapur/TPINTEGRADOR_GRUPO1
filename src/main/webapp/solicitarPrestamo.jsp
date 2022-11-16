<%@page import="java.util.ArrayList"%>
<%@page import="entidad.Cuenta" %>

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

<% 
	ArrayList<Cuenta> listaCuentas= null;
	String resString=null;
	Boolean resBoolean=false;
	if(request.getAttribute("getCuenta")!=null)
	{
		listaCuentas = (ArrayList<Cuenta>) request.getAttribute("listaCuentas");
	}
	
	if(request.getAttribute("resString")!=null)
	{
		resString =  request.getAttribute("resString").toString();
	}
	if(request.getAttribute("resBoolean")!=null)
	{
		resBoolean =  Boolean.parseBoolean( request.getAttribute("resBoolean").toString());
	}
 %>
 







<a href="gestionarCuentas.jsp"> <span class="fa fa-home"></span> Volver</a>
<h1 style="margin:auto;text-align:center;margin-bottom:30px;">Solicitar nuevo prestamo</h1>

<%
		if(resString!= null && !resString.equals("go"))
		{
		if(!resBoolean){%>
	<br>
	 <h2 style="color:red;"><%=resString%></h2>
	<%}
		else
		{%>
			<br>
	 	<h2 style="color:green;"><%=resString%></h2>
		<%}
		}
	%>
	
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
      </p>
      <p class="buton">
        <input id="btnRealizarSolicitudPrestamo" type="submit" value="Solicitar Prestamo" required name="btnRealizarSolicitudPrestamo">
      </p>
    </fieldset>
</form>		
</body>
</html>