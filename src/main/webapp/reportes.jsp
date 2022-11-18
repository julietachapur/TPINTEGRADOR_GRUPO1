<%@page import="entidad.Usuario" %>
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
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
</head>
<body>
<% 
	boolean isCliente = true;
	if(request.getAttribute("isCliente") != null)
	{
		isCliente = (Boolean) request.getAttribute("isCliente");
	
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
<div style="display:flex; justify-content: space-around; align-items: center; flex-direction: column">
<a style="margin-top: 0.5rem;" class="volver" href="/TPINTEGRADOR_GRUPO1/inicioAdmin.jsp"> <span class="volverIcon fa fa-home"></span> Volver</a>
<% if(isCliente == true ) { %>
<h1> Reportes </h1>
<div class= "ABM">
<form class= "form " method = "get" action="ServletMovimientos"> 
    <fieldset>
	<p class="inputForm">
		 <label for="tipoMovimiento">Movimiento:</label>
		 <select id="movimiento" name="movimiento">
		 <option value = ""></option>
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
	 <div style="display:flex; justify-content: space-evenly;">
	      <input id="btnFiltrar" type="submit" value="Filtrar" name="btnFiltrarMovimiento" style="width: 200px;">
	 </div>
	 <table class = "tablaReportes"  style="width:100%;height:50%;">
	 <thead><tr> <th>Numero de cuenta</th>  <th>Detalle</th>    <th>Fecha</th>   <th>Importe</th>    <th>Saldo</th></tr></thead>
	 <% 
		if(listaMovimientos != null)
		for(Movimiento mov:listaMovimientos)
		{			
		%>
		<tbody>
		<tr> <td><%=mov.getNroCuenta().getNroCuenta()%></td>   
		
		        <%  if( mov.getDetalle() == null) { %>
                <td> --- </td>    
        	<%	} else { %>
        	<td><%=mov.getDetalle()%></td>    
        <%	}  %>
        
        
		
		
		<td><%=mov.getFecha()%></td>   <td><%=mov.getImporte()%></td>  <td><%=mov.getSaldo()%></td></tr>
		</tbody>
		<%} %>
	</table>
 	<br><br>
	<%
		int numLista = (int)request.getAttribute("numLista");
		int numCuenta = (int)request.getAttribute("numCuentas");
		BigDecimal saldos = (BigDecimal)request.getAttribute("saldos");
		
	%>
	<table border = "3" style="width:52%;">
		<tr> <th>Cantidad de transacciones</th> <td><%=numLista%></td></tr>
		<tr> <th>Cantidad de cuentas</th> <td><%=numCuenta%></td></tr>
		<tr> <th>Sumatoria de saldos</th> <td><%=saldos%></td></tr>
	</table>
	</fieldset>
</form>
	 <%} else {%>	  
	 <form class="form" action="ServletMovimientos" method="post">
		 <h2>Cliente no encontrado. Por favor ingrese un dni válido</h2>
		 <div style="display:flex; justify-content: space-evenly;">
	     	<input id="btnAtras" type="submit" value="Atras" name="btnAtras" style="width: 200px;">
		 </div>      		
	 </form>
	  	 <%} %>	  
</div>
</div>
</body>
</html>