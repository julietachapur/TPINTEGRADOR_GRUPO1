<%@page import="java.util.ArrayList"%>
<%@page import="entidad.Cuenta" %>
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
<title>Alta Cuenta - Admin</title>
</head>
<body>
<div class="logged">loggeado</div>
<a href="inicioAdmin.jsp"> <span class="fa fa-home"></span> Volver</a>

<% 
	ArrayList<Cuenta> listaCuentas= null;
	String dni=null;
	if(request.getAttribute("Cuentas")!=null)
	{
		listaCuentas = (ArrayList<Cuenta>) request.getAttribute("Cuentas");
	}
	if(request.getAttribute("dni")!=null)
	{
		dni =  request.getAttribute("dni").toString();
	}

 %>
<div class="menu">
	<h2>Alta de Cuenta</h2>
	 <form method="get" action="ServletCuenta">
		 <label for="labeldni">Buscar DNI:</label><br>
		 <input type="text" name="txtdni" required>
		 <input type="submit" value="Buscar" name="btnBuscar">
	 </form>

<%
	if(!listaCuentas.isEmpty())
	{%>
		<table >
		<thead>
		<tr>
			<td colspan="2">Tipo de cuenta</td>
		</tr>
		   	</thead>
		<tr>
		    <th>Numero de cuenta</th>
		    <th>Tipo de cuenta</th>
		</tr>
		<%
		for(Cuenta c:listaCuentas)
		{%>
		<tr>
			<td><%=c.getNroCuenta() %></td>
			<td><%=c.getTipoCuenta().getTipoCuenta() %></td>
		</tr>
		<%}%>
		</table>
			<label for="TC">Elige un tipo de cuenta:</label>
 
 <form method="get" action="registrarCuenta">
<select name="TC">
  <option value="1">Caja de Ahorro</option>
  <option value="2">Cuenta Corriente</option>
</select>
 <input type="hidden" name="dni" value="<%=dni%>">
<input type="submit" value="submit" name="btnAgregar">
</form>
		<%  	
	}
	else{

		}%>

		 </div>
</body>
</html>