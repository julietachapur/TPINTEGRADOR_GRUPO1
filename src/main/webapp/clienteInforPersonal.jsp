<%@page import="entidad.Pais" %>
<%@page import="entidad.Localidad" %>
<%@page import="entidad.Usuario" %>
<%@page import="entidad.Cliente" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<title>Modificar Cliente - Admin</title>
</head>
<body>

<% 

	
	Usuario usuario = new Usuario();
 	if(session.getAttribute("Usuario")!=null){	
 		usuario = (Usuario)session.getAttribute("Usuario");
 		
 	}
	Cliente cliente = usuario.getcliente();	

	
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
<div style="display:flex; justify-content: space-around; align-items: center; flex-direction: column">
<a href="inicioClientes.jsp" class="volver"> <span class="volverIcon fa fa-home"></span>Volver</a>

	<div class="inforPer">
	<h1><%=	cliente.getApellido()%> <%=cliente.getNombre() %> </h1>
	<span>Información personal:</span>
	<div> 
	
			<table class="tablaDatos">
				<tr>
					<th>DNI</th>
					<td><%=cliente.getDni() %></td>
				</tr>
				<tr>
			  		<th>Apellido y nombre</th>					
					<td><%=cliente.getApellido()%>, <%=cliente.getNombre()%></td>
				</tr>
				<tr>
			  		<th>CUIL</th>					
					<td><%=cliente.getCuil()%></td>
				</tr>
				
				<tr>
					<th>Sexo</th>
					<td><%=cliente.getSexo() %></td>
				</tr>
				<tr>
					<th>Nacionalidad</th>
					<td><%=cliente.getNacionalidad().getPais() %></td>
				</tr>
				<tr>
					<th>Domicilio</th>
					<td><%=cliente.getDireccion() %></td>
				</tr>
				<tr>
					<th>Localidad</th>
					<td><%= cliente.getLocalidad().getLocalidad()%>,
					<%= cliente.getProvincia().getProvincia()%>,
					<%= cliente.getPais().getPais()%>
					</td>
				</tr>
			
				<tr>
					<th>Fecha de nacimiento</th>
					<td><%=cliente.getFecha_nac() %></td>
				</tr>
			
				<tr>
					<th>Correo</th>
					<td><%= cliente.getCorreo_electronico() %></td>
				</tr>			
			</table>		
	</div>
</div>

</body>
</html>
