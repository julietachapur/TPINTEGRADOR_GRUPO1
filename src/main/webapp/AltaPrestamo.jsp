<%@page import="java.util.ArrayList"%>
<%@page import="entidad.PrestamoxAutorizar" %>
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
<title>Administrar Prestamos - Admin</title>
</head>
<body>
<div class="logged">loggeado</div>
<a href="inicioAdmin.jsp"> <span class="fa fa-home"></span> Volver</a>


<% 
	ArrayList<PrestamoxAutorizar> listaPrestamos= null;
	String resString=null;
	Boolean resBoolean=false;
	if(request.getAttribute("Prestamos")!=null)
	{
		listaPrestamos = (ArrayList<PrestamoxAutorizar>) request.getAttribute("Prestamos");
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
 
<div class="menu">
<h2>Autorización Prestamos</h2>
<%
		if(!resBoolean && resString!= null){%>
	<br>
	 <h2 style="color:red;"><%=resString%></h2>
	<%}
	else
	{ 
		if(resString!= null)
		{
			if( !resString.equals("go")){
	%>
		
		<br>
	 <h2 style="color:green;"><%=resString%></h2>
		
	<%}}
		}

	%>
<script>
		<%
		 	if(resString!= null && resBoolean){	
		 		if(!resString.equals("go"))
		 		{
		 			%>
					function resultado(){alert("<%=resString%>");}
				<%}}
		 	%>
	</script>
<%if(listaPrestamos!=null && resBoolean){ %>
 <form method="get" action="ServletPrestamoxAutorizar">
 <table >
		<thead>
		<tr>
			<td colspan="8">Prestamos disponibles para aprobacion</td>
		</tr>
		   	</thead>
		<tr>
			<th>Codigo de prestamo pendiente</th>
		    <th>Numero de cuenta</th>
		    <th>importe pedido</th>
		    <th>Cantidad de cuotas</th>
		    <th>Fecha Creación</th>
		    <th>estado</th>
		    <th colspan="2"></th>
		</tr>
<%

		for(PrestamoxAutorizar p:listaPrestamos)
		{%>
		<tr>
			<td><%=p.getCodPrestamoPendiente() %></td>
			<td><%=p.getNroCuenta() %></td>
			<td><%=p.getImporte() %></td>
			<td><%=p.getCantidad_cuotas()%></td>
			<td><%=p.getFecha_creacion() %></td>
			<%
			switch(p.getEstado())
			{
			case 0:%>
				<td>Desaprobado</td>
				<%break;
			case 1:%>
				<td>Pendiente de aprobacion</td>
			<%break;
			 default: %>
				<td>Error</td>
			<%break;
			}%>
			<td><%=p.getEstado() %></td>
			<td><input type="submit" value="Autorizar" name="btnAutorizar"></td>
		<td>	<input type="submit" value="Rechazar" name="btnRechazar"></td>
			
			
		</tr>
		<%}%>
		 </table>
</form>
<%}
		else
		{%>
			<br>
			 <h3 style="color:red;"> <No disponible></h3>
		<%}%>

		 </div>	

</body>
</html>