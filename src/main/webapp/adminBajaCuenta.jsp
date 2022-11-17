<%@page import="java.util.ArrayList"%>
<%@page import="entidad.Cuenta" %>
<%@page import="entidad.Usuario" %>
<%@page import="entidad.TipoCuenta" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<title>Baja Cuenta - Admin</title>
</head>
<body >

<% 
	ArrayList<Cuenta> listaCuentas= null;
	ArrayList<TipoCuenta> listaTC= null;
	String dni=null;
	String resString=null;
	Boolean resBoolean=false;
	if(request.getAttribute("Cuentas")!=null)
	{
		listaCuentas = (ArrayList<Cuenta>) request.getAttribute("Cuentas");
	}
	if(request.getAttribute("listaTC")!=null)
	{
		listaTC = (ArrayList<TipoCuenta>) request.getAttribute("listaTC");
	}
	if(request.getAttribute("dni")!=null)
	{
		dni =  request.getAttribute("dni").toString();
	}
	if(request.getAttribute("resString")!=null)
	{
		resString =  request.getAttribute("resString").toString();
	}
	if(request.getAttribute("resBoolean")!=null)
	{
		resBoolean =  Boolean.parseBoolean( request.getAttribute("resBoolean").toString());
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




<div class="menu">
<a class="volver" href="inicioAdmin.jsp"> <span class="volverIcon fa fa-home"></span> Volver</a>
	<h2>Baja de Cuenta</h2>
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
		 
	 <form method="get" action="ServletCuenta">
		 <label for="labeldni">Buscar DNI:</label><br>
		 <input type="text" name="txtdni" required>
		 <input type="submit" value="Buscar" name="btnBuscarBaja">
	 </form>
	 
	 	<script>
		<%
		 	if(resString!= null && resBoolean!= null){	
		 		if(!resString.equals("go"))
		 		{
		 			%>
					function resultado(){alert("<%=resString%>");}
				<%}}
		 	%>
		
			
			</script>
			

	 <%	
	if(listaCuentas != null && resBoolean!= null && resBoolean )
		
	{%>
	
		<table >
		<thead>
		<tr>
			<td colspan="8">Cuentas disponibles para el DNI <%=dni%></td>
		</tr>
		   	</thead>
		<tr>
		    <th>Numero de cuenta</th>
		    <th>CBU</th>
		    <th>Fecha Creación</th>
		    <th>Tipo de cuenta</th>
		     <th>Saldo</th>
		     <th colspan="2"></th>
		</tr>
		<%
		for(Cuenta c:listaCuentas)
		{
			
		if(c.isEstado())
		{
		
		%>
		<form method="get" action="ServletCuenta">
		<tr>
			<td><%=c.getNroCuenta() %></td>
			<td><%=c.getCbu() %></td>
			<td><%=c.getFecha_creacion() %></td>
			<td><%=c.getTipoCuenta().getTipoCuenta() %></td>
			<td>$<%=c.getSaldo() %></td>
			<input type="hidden" name="cuenta" value="<%=c.getNroCuenta() %>">
			<td> <input type="submit" value="Baja" name="btnBaja"></td>
			
			
		</tr>
		<%}%></form><%}%>
		
		 <%}%>
		</table>

	 </div>
</body>
</html>