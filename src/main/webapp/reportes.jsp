<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Movimiento" %>
<%@page import="entidad.Usuario" %>
<%@page import="entidad.TipoMovimiento" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
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

	Usuario usuario = new Usuario();
 	if(session.getAttribute("Usuario")!=null){	
 		usuario = (Usuario)session.getAttribute("Usuario");
 	}
	
%>

<header class="header"> 
	<div>
		<a href="inicioAdmin.jsp">
			<img style = "float: left; margin: 2px 20px 10px 0; ; " src="img/logo.jpg"  alt="logo" width="50" height="50"  />
		</a>
	</div>
	<div class="logged">
		<span><%=usuario.getUsuario()%></span>
		<span>LOGGUEADO</span>
	</div>
</header>


<a style="margin-top: 0.5rem;" 	 class="volver" href="inicioAdmin.jsp"> <span class="volverIcon fa fa-home"></span> Volver</a>
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