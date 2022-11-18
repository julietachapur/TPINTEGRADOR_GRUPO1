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
<title>Modificar Usuario - Admin</title>
</head>
<body>

<% 
	ArrayList<TipoUsuario> listaTipos = null;
	String dni = null;
	String mensaje = "";
	Usuario us = null;
	boolean modificado = false;
	boolean isCliente = false;

	if(request.getAttribute("isCliente") != null)
	{
		isCliente = (Boolean) request.getAttribute("isCliente");

	}
	
	if(request.getAttribute("tiposUsuarios") != null)
	{
		listaTipos = (ArrayList<TipoUsuario>) request.getAttribute("tiposUsuarios");
	}
	

	if(request.getAttribute("dni") != null) {
		dni = (String) request.getAttribute("dni");
		us = (Usuario)request.getAttribute("usuario");
	}

	if( request.getAttribute("modificado") != null) {
		modificado = (boolean)request.getAttribute("modificado");
		mensaje = (String)request.getAttribute("mensaje");
		us = (Usuario)request.getAttribute("usuario");
	}
	
	Usuario usuario = new Usuario();
 	if(session.getAttribute("Usuario")!=null){	
 		usuario = (Usuario)session.getAttribute("Usuario");
 	}
	
 %>
 
 <header class="header"> 
	<div>
		<a href="index.jsp">
			<img style = "float: left; margin: 2px 20px 10px 0; ; " src="img/logo.jpg"  alt="logo" width="50" height="50"  />
		</a>
	</div>
	<div class="logged">
		<span><%=usuario.getUsuario()%></span>
		<span>LOGGUEADO</span>
	</div>
</header>
 
 
 <% 	if(isCliente == false) { %>  
<a href="#"> <span class="fa fa-home"></span> Volver</a>
	 <%} else {%>	  
<a href="index.jsp"> <span class="fas fa-times-circle"></span>Salir</a>
<%	} %>

<div style="display:flex; justify-content: space-around; align-items: center; flex-direction: column">
<h1>Modificar Usuario</h1>

<% 	if(modificado == false) { %> 

<div class="ABM">
<form class="form " method="get" action="ServletUsuario">
    <fieldset>
      <legend>Modificar usuario</legend>
	  <p class="inputForm">
        <label for="dni">DNI</label>
        <input id="dni" type="text" value="<%= dni %>" disabled > <input type="hidden" name="txtDNI" value="<%= dni %>" >
      </p>
      <p class="inputForm">
        <label for="tipo">Tipo Usuario</label>
        <select id="tipo" name="tipo" required>
         <%
		 	if(listaTipos!=null)
		 		
				 if(isCliente == true) { %>  
				<option value="<%= us.getTipoUsuario().getCodTipo() %>" selected> <%= us.getTipoUsuario().getTipoUsuario() %></option>
				<%	} else {	
		 		
				for(TipoUsuario t:listaTipos){
					if(t.getCodTipo() != us.getTipoUsuario().getCodTipo()) {
			%>
				<option value="<%= t.getCodTipo() %>" > <%= t.getTipoUsuario() %></option>
			<%	} else { %>
				<option value="<%= t.getCodTipo() %>" selected> <%= t.getTipoUsuario() %></option>
			<%	} } }%>
        </select>
      </p>
      <p class="inputForm">
        <label for="usuario">Usuario</label>
        <input disabled type="text" name="txtUsuario" value="<%= us.getUsuario() %>"> <input id="usuario" type="hidden" name="txtUsuario" value="<%= us.getUsuario() %>">
        
      </p>
      <p class="inputForm">
        <label for="contrasenia">contraseña</label>
        <input id="contrasenia" type="password" required name="txtContrasenia" maxlength=10>
      </p>
	  <p class="inputForm">
        <label for="contrasenia2">Repita contraseña</label>
        <input id="contrasenia2" type="password" required name="txtContrasenia2" maxlength=10>
      </p>
      <p class="button">
        <input id="btnRegistrar" type="submit" value="Modificar" name="btnModifUs">
      </p>
    </fieldset>

</form>		

</div>
<%	}%>

  
<div style="display:flex; flex-direction: column; align-items: center;">
	<div>
	<% if(request.getAttribute("mensaje") != "") {%>
		<p style="font-size: 1.5rem;"> <%=mensaje%> </p>
	<%}%>
	</div>
</div>
</body>
</html>