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
	ArrayList<Movimiento> listaMovimientos = null;
	if(request.getAttribute("listaMovimientos") != null)
	{
		listaMovimientos = (ArrayList<Movimiento>) request.getAttribute("listaMovimientos");
	}
 %>

<a href="inicioAdmin.jsp"> <span class="fa fa-home"></span> Volver</a>
<h1> Reportes </h1>
<form method = "get" action="SelvetMovimientos"> 
    <fieldset>
	<p class="inputForm">
		 <label for="tipoMovimiento">Movimiento:</label>
		 <select id="movimiento" name="movimiento">
		 <option></option>
			<%
			if(listaTipoMovimientos!=null)
				for(TipoMovimiento t:listaTipoMovimientos)
				{
				%>
				<option value="<%=t.getCodTipo()%>"> <%=t.getTipoMovimiento()%></option>
			<%}%>
		 </select>
	 </p>
	 <label for="labelDni">DNI:</label>
	 <input type="text" name="txtDni" >
	 <label for="labelFechaInicio">Fecha de inicio:</label>
	 <input type="date" name="txtFechaInicio" >
	 <label for="labelFechaInicio">Fecha de fin:</label>
	 <input type="date" name="txtFechaFin" ><br><br>
	 <input type="submit" value="Filtrar" name="btnFiltrar" style="width: 156px; ">
</fieldset>
	 <table border="1">
	 <tr> <th>Detalle</th>    <th>Fecha</th>   <th>Importe</th>   <th>Numero de cuenta</th> <th>Saldo</th></tr>
	 <% 
		if(listaMovimientos != null)
		for(Movimiento mov:listaMovimientos)
		{
		%>
		<tr> <th><%=mov.getDetalle()%></th>    <th><%=mov.getFecha()%></th>   <th><%=mov.getImporte()%></th>  <th><%=mov.getNroCuenta().getNroCuenta()%></th> <th><%=mov.getSaldo()%></th>
		 </tr>
		<%} %>
	 </table>
</form>

<form method = "get" action="SelvetMovimientos"> 
 <br><br>
 <label for="labelTransacciones">Cantidad de transacciones: </label><br><br>
 <input type="hidden" name="txtTransacciones" value= "transacciones">
 <label for="labelMontosTotales">Cantidad de cuentas: </label>
 <input type="hidden" name="txtCantidadCuentas" >
</form>
</body>
</html>