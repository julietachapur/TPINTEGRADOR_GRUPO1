<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Pais" %>
<%@page import="entidad.Localidad" %>
<%@page import="entidad.Usuario" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<title>Alta Cliente - Admin</title>
</head>
<body>

<% 
	
	ArrayList<String> sexo = new ArrayList<String>();
	sexo.add("F");
	sexo.add("M");
	sexo.add("X");
	ArrayList<Pais> listaPaises = null;
	String dni = null;
	String mensaje = "";
	Boolean existe = false;
	
	if(request.getAttribute("nacionalidad") != null)
	{
		listaPaises = (ArrayList<Pais>) request.getAttribute("nacionalidad");
	}
	
	ArrayList<Localidad> listaLocalidades = null;
	if(request.getAttribute("localidad") != null)
	{
		listaLocalidades = (ArrayList<Localidad>) request.getAttribute("localidad");
	}
	
	boolean agregado = false;
	if( request.getAttribute("agregado") != null) {
		agregado = (boolean)request.getAttribute("agregado");
		dni = (String) request.getAttribute("dni");
		mensaje = (String) request.getAttribute("mensaje");
	}
	
	if( request.getAttribute("existe") != null) {
		existe = (boolean)request.getAttribute("existe");
		mensaje = (String) request.getAttribute("mensaje");
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
 
 
<div style="display:flex; justify-content: space-around; align-items: center; flex-direction: column">
<a style="margin-top: 0.5rem;" class="volver" href="adminClientes.jsp"> <span class="volverIcon fa fa-home"></span> Volver</a>
<h1>Alta nuevo cliente</h1>
  <%  if( agregado == false && existe == false)	{ %>
<span>Por favor complete todos los datos </span>
<div class="ABM">

<form class="form " method="get" action="ServletCliente">
    <fieldset>
      <legend>Nuevo cliente</legend>
      <p class="inputForm">
        <label for="dni">DNI</label>
        <input id="dni" type="text" required maxlength=10 name="txtDNI" value= ${txtDni}>
      </p>
      <p class="inputForm">
        <label for="nombres">Nombre</label>
        <input id="nombres" type="text" maxlength=50 required name="txtNombre">
      </p>
      <p class="inputForm">
        <label for="apellidos">Apellido</label>
        <input id="apellidos" type="text" maxlength=50 required name="txtApellido">
      </p>      
      <p class="inputForm">
        <label for="cuil">CUIL</label>
        <input id="cuil" type="text" required name="txtCuil" maxlength=13>
      </p>
      <p class="inputForm">
        <label for="sexo">Sexo</label>
        <select id="sexo" name="sexo" required>
         <%
		 	if(sexo!=null)
				for(String s:sexo){
			%>
				<option value="<%= s %>" > <%= s %></option>
			<%	} %>
        </select>
      </p>
      <p class="inputForm">
        <label for="nacionalidad">Nacionalidad</label> 
        <select id="nacionalidad" name="nacionalidad" required>
		  <%
		 	if(listaPaises!=null)
				for(Pais p:listaPaises)
				{
			%>
			<option value="<%=p.getCodPais()%>" > <%=p.getPais()%></option>
			<%	}%>
        </select>
      </p>
      <p class="inputForm">
        <label for="fecha_nac">Fecha de nacimiento</label>
        <input id="fecha_nac" type="date" required name="txtFecha_nac">
      </p>     
      <p class="inputForm">
        <label for="direccion">Dirección</label>
        <input id="direccion" type="text" required name="txtDireccion" maxlength=200>
      </p>
      <p class="inputForm">
        <label for="localidad">Localidad</label> 
        <select id="localidad" name="localidad" required>
		  <%
		 	if(listaLocalidades!=null)
				for(Localidad l:listaLocalidades)
				{
			%>
			<option value="<%=l.getCodLocalidad()%>" > <%=l.getLocalidad()%></option>
			<%	}%>
        </select>
      </p>
      <p class="inputForm">
        <label for="email">E-mail</label>
        <input id="email" type="email" required name="txtEmail" maxlength=200>
      </p>
      <p class="inputForm">
        <label for="telefonos">Teléfonos</label>
        <input id="telefonos" type="text" required name="txtTelefonos" maxlength=200>
      </p>
      <p class="button">
        <input id="btnRegistrar" type="submit" value="Registrar" name="btnAltaCliente">
      </p>
    </fieldset>

</form>		

</div>
  <%	}%>
<div style="display:flex; flex-direction: column; align-items: center;">
<% if( agregado == true || existe == true ) { %>	
	<div>
		<p style="font-size: 1.5rem;"><%=mensaje %> <p>
	</div>
	<div>
	<% if(request.getAttribute("resultado") != null) {%>
		<%=request.getAttribute("resultado")%>
	<%}%>
	</div>
	<%} %>
	<% if( agregado == true) { %>	
	<form method="get" action="ServletUsuario">
	  <p class="button">
        <input id="btnRegistrar" type="submit" value="Alta Usuario Home Banking" name="btnAltaUsuario">
        <input type="hidden" name="dni" value=<%= dni %> >
      </p>
	</form>
<%} %>
</div>

</div>
</body>
</html>