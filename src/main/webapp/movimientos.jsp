<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Cuenta" %>
<%@page import="entidad.Usuario" %>
<%@page import="entidad.Movimiento" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.math.BigDecimal"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movimientos</title>
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
</head>
<body>

<% 

	BigDecimal currentSaldo = new BigDecimal(0);
	ArrayList<Movimiento> listaMovimientos = null;
	int currentCuenta = 0;
	Cuenta cta = null;
	int tipoCta = 0;
	String nombreCta = null;
	
	if(request.getSession().getAttribute("cuentas") != null)
	{
		currentCuenta = (int) request.getSession().getAttribute("cuentaSeleccionada");
		cta = (Cuenta) request.getAttribute("cuenta");
		tipoCta = cta.getTipoCuenta().getCodTipo();
		nombreCta = cta.getTipoCuenta().getTipoCuenta();
	}
	
	if( request.getAttribute("saldo") != null) 
	{
		currentSaldo = (BigDecimal) request.getAttribute("saldo");
		listaMovimientos = (ArrayList<Movimiento>) request.getAttribute("movimientos");
	}
		
	Usuario usuario = new Usuario();
 	if(session.getAttribute("Usuario")!=null){	
 		usuario = (Usuario)session.getAttribute("Usuario");
 	}
	
	%>
 
  
 <header class="header"> 
	<div>
		<a href="inicioClientes.jsp">
			<img style = "float: left; margin: 2px 20px 10px 0; ; " src="img/logo.jpg"  alt="logo" width="50" height="50"  />
		</a>
	</div>
	<div class="logged">
		<span><%=usuario.getUsuario()%></span>
		<span>LOGGUEADO</span>
	</div>
</header> 
 
 
<a class="volver" href="gestionarCuentas.jsp"> <span class="volverIcon fa fa-home"></span> Volver</a>
	<h1 style="margin:auto; margin-bottom:20px;text-align:center;">Movimientos</h1>
	
	<section class="Cuenta">
		<div class="Cuenta-Tipo">
		<%  if(tipoCta == 1) {	%>
			<label id="lblCuentaTipo">CA$</label>
		<%	} else { %>
				<label id="lblCuentaTipo">CC$</label>
		<%	} %>
		</div>
		<div class="Cuenta-Detalle">
			<label id="lblDisponibleCuenta">$<%= listaMovimientos.get(listaMovimientos.size()-1).getSaldo() %></label>
			<label id="lblDetalleCuenta"><%= nombreCta %> - Cuenta Nro: <%= currentCuenta %></label>
		</div>
	</section>
	<section class="tabla-movimientos">
	<table >
		<thead>
		<tr>
			<th>Fecha</th>
			<th>Importe</th>
			<th>Tipo de movimiento</th>
			<th>Saldo</th>
			<th>Detalle</th>
		</tr>
		</thead>
    	<tbody>
		
		<%  if(listaMovimientos != null)
			for(Movimiento mov : listaMovimientos) 
		{	%>
		<tr>
			<td><%= mov.getFecha() %> </td>
			<td><%= mov.getImporte() %></td>
			<td><%= mov.getTipoMovimiento().getTipoMovimiento() %></td>
			<td><%= mov.getSaldo() %></td>
		 <%  if( mov.getDetalle() == null) { %>
		 			<td> --- </td>
		 <%	} else { %>
			<td><%= mov.getDetalle()%></td>
		<%	}  %>
		</tr>
	<% }  %>
		</tbody>
	</table>
	<div class="botones">
		<button>Anterior</button>
		<button>Siguiente</button>
	</div>
	</section>
</body>
</html>