<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Usuario" %>
<%@page import="entidad.TipoUsuario" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<title>Alta Usuario - Admin</title>
</head>
<body>

<% 
	ArrayList<TipoUsuario> listaTipos = null;
	String dni = null;
	String mensaje = "";
	
	if(request.getAttribute("tiposUsuarios") != null)
	{
		listaTipos = (ArrayList<TipoUsuario>) request.getAttribute("tiposUsuarios");
		dni = (String) request.getAttribute("dni");

	}

	Usuario us = null;
	boolean agregado = false;
	if( request.getAttribute("agregado") != null) {
		agregado = (boolean)request.getAttribute("agregado");
		mensaje = (String)request.getAttribute("mensaje");
		us = (Usuario)request.getAttribute("usuario");
	}
	
	
	
 %>
 
 
<a href="adminClientes.jsp"> <span class="fa fa-home"></span> Volver</a>
<div style="display:flex; justify-content: space-around; align-items: center; flex-direction: column">
<h1>Alta nuevo Usuario</h1>
  <%  if( agregado == false)	{ %>
<span>Por favor complete todos los datos </span>
<div class="ABM">

<form class="form " method="get" action="ServletUsuario">
    <fieldset>
      <legend>Nuevo usuario</legend>
<% 	if(us == null) { %> 
	<p class="inputForm">
        <label for="dni">DNI</label>
        <input id="dni" type="text" value=<%= dni %> disabled > <input type="hidden" name="txtDNI" value=<%= dni %> >
      </p>
      <p class="inputForm">
        <label for="tipo">Tipo Usuario</label>
        <select id="tipo" name="tipo" required>
         <%
		 	if(listaTipos!=null)
				for(TipoUsuario t:listaTipos){
			%>
				<option value="<%= t.getCodTipo() %>" > <%= t.getTipoUsuario() %></option>
			<%	} %>
        </select>
      </p>
      <p class="inputForm">
        <label for="usuario">Usuario</label>
        <input id="usuario" type="text"required name="txtUsuario">
      </p>
      <% } else if(us != null && agregado == false) { %>
      <p class="inputForm">
        <label for="dni">DNI</label>
        <input id="dni" type="text" value=<%= dni %> disabled > <input type="hidden" name="txtDNI" value=<%= dni %> >
      </p>
      <p class="inputForm">
        <label for="tipo">Tipo Usuario</label>
        <select id="tipo" name="tipo" required>
         <%
		 	if(listaTipos!=null)
				for(TipoUsuario t:listaTipos){
					if(t.getCodTipo() != us.getTipoUsuario().getCodTipo()) {
			%>
				<option value="<%= t.getCodTipo() %>" > <%= t.getTipoUsuario() %></option>
			<%	} else { %>
				<option value="<%= t.getCodTipo() %>" selected> <%= t.getTipoUsuario() %></option>
			<%	} }%>
        </select>
      </p>
      <p class="inputForm">
        <label for="usuario">Usuario</label>
        <input id="usuario" type="text"required name="txtUsuario" value=<%= us.getUsuario() %>>
      </p>
      <% }  %>
      <p class="inputForm">
        <label for="contrasenia">contrase�a</label>
        <input id="contrasenia" type="password" required name="txtContrasenia">
      </p>
	  <p class="inputForm">
        <label for="contrasenia2">Repita contrase�a</label>
        <input id="contrasenia2" type="password" required name="txtContrasenia2">
      </p>
      <p class="button">
        <input id="btnRegistrar" type="submit" value="Registrar" name="btnAltaUs">
      </p>
    </fieldset>

</form>		

</div>
  <%	}%>
<div style="display:flex; flex-direction: column; align-items: center;">
<% if( us != null ) { %>
	<div>
	<% if(request.getAttribute("mensaje") != null) {%>
		<p style="font-size: 1.5rem;"> <%=mensaje%> </p>
	<%}%>
	</div>
<%-- 	<form method="get" action="ServletCuenta">
	  <p class="button">
        <input id="btnRegistrar" type="submit" value="Agregar Cuenta" name="btnAltaCuenta">
        <input type="hidden" name="getDni" value=<%= dni %> >
      </p>
	</form> --%>
<%} %>
</div>

</div>
</body>
</html>