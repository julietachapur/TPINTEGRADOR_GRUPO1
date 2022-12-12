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
			try{
				listaCuentas = (ArrayList<Cuenta>) request.getSession().getAttribute("cuentas");
				currentCuenta = listaCuentas.get(0).getNroCuenta();
			}
			catch(IndexOutOfBoundsException ex){
				ex.printStackTrace();
				
			}
			
		}
		
		if(request.getSession().getAttribute("cuentaSeleccionada") != null) 
		{
			try{
				currentCuenta = (int) request.getSession().getAttribute("cuentaSeleccionada");		
			}
			catch(IndexOutOfBoundsException ex){
				ex.printStackTrace();
			}
		}
		
		if (request.getAttribute("CuotaPaga")!=null){
			%><script><%
			boolean exito = (boolean) request.getAttribute("CuotaPaga");
			if (exito){
				%>alert("Cuota pagada con exitó!")<%
			}
			else{
				%>alert("Ocurrio un error durante el pago de la cuota.")<%
			}
			%></script><%
		}
		
		if (request.getAttribute("Transferencia")!=null){
			%><script><%
			boolean sucess = (boolean) request.getAttribute("Transferencia");
			if (sucess){
				%>alert("Transferencia realizada con exitó!")<%
			}
			else{
				%>alert("Ocurrio un error durante la transferencia.")<%
			}
			%></script><%
			
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
	 
	<div class= "selectorCuentas">
	
		<a style="margin-top: 0.5rem;" 	class="volver" href="inicioClientes.jsp"> <span class="volverIcon fa fa-home"></span> Volver</a>
		<h1 style="margin:auto; margin-bottom:20px; text-align:center;">Gestionar Cuentas</h1>
		
		
		<%if(currentCuenta != 0){
			%>			
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
				<a href="/TPINTEGRADOR_GRUPO1/solicitarPrestamo.jsp?getCuenta="><input type="hidden" name="Usuario" value="<%=usuario%>">Solicitar prestamo</a>
			  	<a href="/TPINTEGRADOR_GRUPO1/ServletPrestamos?pagoPrestamos=<%=currentCuenta%>">Pagar prestamos</a>
			</div>
	</div>
	
		<%}
		else{			
		%>
		 	<label for="cuentaSeleccionada">Usted no posee cuentas asignadas aún.</label><br>
		
		<%}%>

</body>
</html>