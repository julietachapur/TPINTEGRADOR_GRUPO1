<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Movimiento" %>
<%@page import="entidad.TipoMovimiento" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.math.BigDecimal"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<title>Reportes</title>
</head>
<body>

<% 
	String resString=null;
	if(request.getAttribute("resString")!=null)
	{
		resString =  request.getAttribute("resString").toString();
	}
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
<header class="header"> 
	<div>
		<a href="#">
			<img style = "float: left; margin: 2px 20px 10px 0; ; " src="img/logo.jpg"  alt="logo" width="50" height="50"  />
		</a>
	</div>
	<div class="logged">
		<span>ADMIN</span>
		<span>LOGGUEADO</span>
	</div>
</header>
<a href="inicioAdmin.jsp"> <span class="fa fa-home"></span> Volver</a>
<div style="display:flex; justify-content: space-around; align-items: center; flex-direction: column">
<h1> Reportes </h1>
<form class= "form " method = "get" action="ServletMovimientos"> 
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
	 <input type="text"  maxlength=10 id= "dni" name="txtDni">
	 <label for="labelFechaInicio">Fecha de inicio:</label>
	 <input type="date" name="txtFechaInicio">
	 <label for="labelFechaInicio">Fecha de fin:</label>
	 <input type="date" name="txtFechaFin"><br><br>
     <input id="btnFiltrar" type="submit" value="Filtrar" name="btnFiltrarMovimiento" style="width: 156px;">
	 <table border="1"  style="width:100%;height:50%;">
	 <tr> <th>Numero de cuenta</th>  <th>Detalle</th>    <th>Fecha</th>   <th>Importe</th>    <th>Saldo</th></tr>
	 <% 
		if(listaMovimientos != null)
		for(Movimiento mov:listaMovimientos)
		{			
		%>
		<tr> <th><%=mov.getNroCuenta().getNroCuenta()%></th>   <th><%=mov.getDetalle()%></th>    <th><%=mov.getFecha()%></th>   <th><%=mov.getImporte()%></th>  <th><%=mov.getSaldo()%></th>
		 </tr>
		<%} %>
	</table>
 	<br><br>
	<%
		int numLista = (int)request.getAttribute("numLista");
		int numCuenta = (int)request.getAttribute("numCuentas");
		BigDecimal saldos = (BigDecimal)request.getAttribute("saldos");
		
	%>
	<table border="1"  style="width:52%;">
		<tr> <th>Cantidad de transacciones</th>  <th><%=numLista%></th> </tr>
		<tr> <th>Cantidad de cuentas</th>   <th><%=numCuenta%></th> </tr>
		<tr> <th>Sumatoria de saldos</th>   <th><%=saldos%></th> </tr>
	</table>
	</fieldset>
</form>
</div>
</body>
</html>