<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Movimiento" %>
<%@page import="entidad.TipoMovimiento" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<title>Reportes</title>
</head>
<body>

<% 
	
	ArrayList<TipoMovimiento> listaTipoMovimientos = null;
	if(request.getAttribute("tipoMovimiento") != null)
	{
		listaTipoMovimientos = (ArrayList<TipoMovimiento>) request.getAttribute("tipoMovimiento");
	}
	
 %>

<a href="inicioAdmin.jsp"> <span class="fa fa-home"></span> Volver</a>
<h1> Reportes </h1>
<form method = "post" action="SelvetMovimientos"> 
    <fieldset>
	<p class="inputForm">
		 <label for="tipoMovimiento">Movimiento:</label>
		 <select id="tipoMovimiento" name="movimiento">
			<%
			if(listaTipoMovimientos!=null)
				for(TipoMovimiento t:listaTipoMovimientos)
				{
				%>
				<option value="<%=t.getCodTipo()%>" > <%=t.getTipoMovimiento()%></option>
				<%	}%>
		 </select>
	 </p>
	 <label for="labelDni">DNI:</label>
	 <input type="text" name="txtDni" >
	 <label for="labelFechaInicio">Fecha de inicio:</label>
	 <input type="text" name="txtFechaInicio" >
	 <label for="labelFechaInicio">Fecha de fin:</label>
	 <input type="text" name="txtFechaFin" ><br><br>
	 <input type="submit" value="Filtrar" name="btnFiltrar" style="width: 156px; ">
    </fieldset>
</form>
<table border="1">
<tr> <th>N Cuenta</th>    <th>Saldo</th>   <th>Monto</th> </tr>
<tr> <th>valor1</th>    <th>valor2</th>   <th>valor3</th> </tr>
</table>

<form method = "get" action=""> 
 <br><br>
 <label for="labelTransacciones">Cantidad de transacciones: </label><br><br>
 <input type="hidden" name="txtTransacciones" value= "transacciones">
 <label for="labelMontosTotales">Cantidad de cuentas: </label>
 <input type="hidden" name="txtCantidadCuentas" >
</form>
</body>
</html>