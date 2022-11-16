<%@page import="java.util.ArrayList"%>
<%@page import="java.awt.List"%>
<%@page import="daoImpl.CuentaDaoImpl"%>
<%@page import="negocioImpl.UsuarioNegocioImpl"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Cuenta" %>
<%@page import="entidad.Cliente" %>
<%@page import="entidad.Usuario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
	<style type="text/css">
		<jsp:include page="css/style.css"></jsp:include>
	</style>
	<title>Informacion personal </title>
</head>
<body>
<%

	Usuario usuario = null;
	if(request.getSession().getAttribute("Usuario") != null) {
		usuario = (Usuario) request.getSession().getAttribute("Usuario");
	}
	Cliente cliente = usuario.getcliente();
//	String nacionalidad = cliente.getNacionalidad().getPais();
	
%>

	<a href="inicioClientes.jsp"> <span class="fa fa-home">Volver</span></a>
	<div class="inforPer">
	<h1><%=	cliente.getApellido()%> <%=cliente.getNombre() %> </h1>
	<span>Datos:</span>
			<table class="tablaDatos">
				<tr>
					<th>DNI</th>
					<th><%=cliente.getDni() %></th>
				</tr>
				
				<tr>
			  		<th>CUIL</th>					
					<td><%=cliente.getCuil()%></td>
				</tr>
				
				<tr>
					<td>Sexo</td>
					<td><%=cliente.getSexo() %></td>
				</tr>
				
				<!-- <tr>
					<td>Nacionalidad</td>
					<td></td>
				</tr>
				 -->
				<tr>
					<td>Dirección</td>
					<td><%=cliente.getDireccion() %></td>
				</tr>
			
				<tr>
					<td>Fecha de nacimiento</td>
					<td><%=cliente.getFecha_nac() %></td>
				</tr>
			
				<tr>
					<td>Correo</td>
					<td><%= (String) cliente.getCorreo_electronico() %></td>
				</tr>
			
			</table>
			
		<br>
		
	</div>
	

</body>
</html>