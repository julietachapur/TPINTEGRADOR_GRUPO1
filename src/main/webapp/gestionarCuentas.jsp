<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Cuenta" %>
<%@page import="entidad.Usuario" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestionar cuentas</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
</head>
<body>

<% 
	Usuario usuario = null;
	if(request.getSession().getAttribute("Usuario") != null) {
		usuario = (Usuario) request.getSession().getAttribute("Usuario");
	}
	
	ArrayList<Cuenta> listaCuentas = null;
	int currentCuenta = 0;
	if(request.getSession().getAttribute("cuentas") != null)
	{
		listaCuentas = (ArrayList<Cuenta>) request.getSession().getAttribute("cuentas");
		currentCuenta = listaCuentas.get(0).getNroCuenta();
	}
	
	if(request.getSession().getAttribute("cuentaSeleccionada") != null) 
	{
		currentCuenta = (int) request.getSession().getAttribute("cuentaSeleccionada");
	}
		
 %> 
 
<a href="inicioClientes.jsp"> <span class="fa fa-home"></span> Volver</a>
<h1 style="margin:auto; margin-bottom:20px; text-align:center;">Gestionar Cuentas</h1>
<div class= "selectorCuentas">
 	<label for="cuentaSeleccionada">Cuenta <%=currentCuenta%> </label><br>
	<span>Cambiar cuenta:  </span>
	
<form method="get" action="ServletCuenta" >
	 <select name="cuentaSeleccionada">   
	  <%
	 	if(listaCuentas!=null)
	 		for(Cuenta cta : listaCuentas) { 
	 			if(cta.isEstado()) {
	 				if(cta.getNroCuenta() != currentCuenta){
		%>
				<option value="<%=cta.getNroCuenta()%>" > Cuenta  <%=cta.getNroCuenta()%> </option>
		<%	} else { %>
				<option value="<%=cta.getNroCuenta()%>" selected > Cuenta  <%=cta.getNroCuenta()%> </option>
		<%	} } }%>
	  
	</select>
	    <input id="btnSeleccionar" type="submit" value="Seleccionar" name="btnSeleccionar">
</form>
</div>
<div class="menu">
	<div class="opcionesMenu">
			<a href="/TPINTEGRADOR_GRUPO1/ServletMovimientos?getCuenta="><input type="hidden" name="cta" value="<%=currentCuenta%>">Movimientos</a> 
			<a href="/TPINTEGRADOR_GRUPO1/transferencias.jsp?getCuenta=<%=currentCuenta%>" >Transferencias</a>
			<a href="/TPINTEGRADOR_GRUPO1/solicitarPrestamo.jsp?getCuenta="><input type="hidden" name="cta" value="<%=currentCuenta%>">Solicitar prestamo</a>
		  	<a href="/TPINTEGRADOR_GRUPO1/ServletPrestamos?pagoPrestamos=<%=currentCuenta%>">Pagar prestamos</a>
		</div>
</div>
</body>
</html>