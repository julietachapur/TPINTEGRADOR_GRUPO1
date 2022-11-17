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
	boolean isCliente = false;

	if(request.getAttribute("isCliente") != null)
	{
		isCliente = (Boolean) request.getAttribute("isCliente");

	}
	
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
	
	Usuario usuario = new Usuario();
 	if(session.getAttribute("Usuario")!=null){	
 		usuario = (Usuario)session.getAttribute("Usuario");
 	}
	
	%>
 
 
<header class="header"> 
	<div>
		<a href="#">
			<img style = "float: left; margin: 2px 20px 10px 0; ; " src="img/logo.jpg"  alt="logo" width="50" height="50"  />
		</a>
	</div>
	<div class="logged">
		<span><%=usuario.getUsuario()%></span>
		<span>LOGGUEADO</span>
	</div>
</header>
 
 
 <% 	if(isCliente == false) { %>  
<a href="/TPINTEGRADOR_GRUPO1/ServletCliente?pag=1"> <span class="fa fa-home"></span> Volver</a>
	 <%} else {%>	  
<a href="index.jsp"> <span class="fas fa-times-circle"></span>Salir</a>
<%	} %>
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
        <input id="dni" type="text" value="<%= dni %>" disabled > <input type="hidden" name="txtDNI" value="<%= dni %>" >
      </p>
      <p class="inputForm">
        <label for="tipo">Tipo Usuario</label>
        <select id="tipo" name="tipo" required>
         <%
		 	if(listaTipos!=null)		 		
				 if(isCliente == true) { %>  
					<option value="2" >Cliente</option>
				<%	} else {
				
				for(TipoUsuario t:listaTipos){
			%>
				<option value="<%= t.getCodTipo() %>" > <%= t.getTipoUsuario() %></option>
			<%	} }%>
        </select>
      </p>
      <p class="inputForm">
        <label for="usuario">Usuario</label>
        <input id="usuario" type="text"required name="txtUsuario" maxlength=20>
      </p>
      <% } else if(us != null && agregado == false) { %>
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
				<option value="2" selected >Cliente</option>
			<%	} else {			
				
				for(TipoUsuario t:listaTipos){
					if(t.getCodTipo() != us.getTipoUsuario().getCodTipo()) { %>
						<option value="<%= t.getCodTipo() %>" > <%= t.getTipoUsuario() %></option>
			<%	} else { %>
				<option value="<%= t.getCodTipo() %>" selected> <%= t.getTipoUsuario() %></option>
			<%	} }  }%>
        </select>
      </p>
      <p class="inputForm">
        <label for="usuario">Usuario</label>
        <input id="usuario" type="text"required name="txtUsuario" value="<%= us.getUsuario() %>" maxlength=20>
      </p>
      <% }  %>
      <p class="inputForm">
        <label for="contrasenia">contraseña</label>
        <input id="contrasenia" type="password" required name="txtContrasenia" maxlength=10>
      </p>
	  <p class="inputForm">
        <label for="contrasenia2">Repita contraseña</label>
        <input id="contrasenia2" type="password" required name="txtContrasenia2" maxlength=10>
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
	<% if(request.getAttribute("mensaje") != null) { %>
		<p style="font-size: 1.5rem;"> <%=mensaje%> </p>
	<%}%>
	</div>
	<%} %>
</div>
<%-- 	<form method="get" action="ServletCuenta">
	  <p class="button">
        <input id="btnRegistrar" type="submit" value="Agregar Cuenta" name="btnAltaCuenta">
        <input type="hidden" name="getDni" value=<%= dni %> >
      </p>
	</form> --%>

</body>
</html>