<%@page import="entidad.Pais" %>
<%@page import="entidad.Localidad" %>
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
<title>Alta Cliente - Admin</title>
</head>
<body>

<% 
	ArrayList<Pais> listaPaises = null;
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
	if( request.getAttribute("agregado") != null) agregado = (boolean)request.getAttribute("agregado");
	
	
 %>
 
 
<a href="adminClientes.jsp"> <span class="fa fa-home"></span> Volver</a>
<div style="display:flex; justify-content: space-around; align-items: center;">
<div class="ABM">
<h1>Alta nuevo cliente</h1>
<span>Por favor complete todos los datos </span>

<form class="form " method="get" action="ServletCliente">
    <fieldset>
      <legend>Nuevo cliente</legend>
      <p class="inputForm">
        <label for="dni">DNI</label>
        <input id="dni" type="text"required name="txtDNI" value= ${dni}>
      </p>
      <p class="inputForm">
        <label for="nombres">Nombre</label>
        <input id="nombres" type="text"required name="txtNombre">
      </p>
      <p class="inputForm">
        <label for="apellidos">Apellido</label>
        <input id="apellidos" type="text" required name="txtApellido">
      </p>      
      <p class="inputForm">
        <label for="cuil">CUIL</label>
        <input id="cuil" type="text" required name="txtCuil">
      </p>
      <p class="inputForm">
        <label for="sexo">Sexo</label>
        <select id="sexo" name="sexo" required>
        	<option value="F">F<option>
        	<option value="M">M<option>
        	<option value="X">X<option>
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
        <!-- <option>Datos tabla Países de la BD<option>--> 
        </select>
      </p>
      <p class="inputForm">
        <label for="fecha_nac">Fecha de nacimiento</label>
        <input id="fecha_nac" type="date" required name="txtFecha_nac">
      </p>     
      <p class="inputForm">
        <label for="direccion">Dirección</label>
        <input id="direccion" type="text" required name="txtDireccion">
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
        <input id="email" type="email" required name="txtEmail">
      </p>
      <p class="button">
        <input id="btnRegistrar" type="submit" value="Registrar" required name="btnAltaCliente">
      </p>
    </fieldset>

</form>		

</div>

<div style="display:flex; flex-direction: column; align-items: center;">
<% if( agregado == true) 
	{
%>	
	<div>
		<p style="font-size: 1.5rem;">Cliente agregado con éxito <p>
	</div>
	<div>
	<% if(request.getAttribute("resultado") != null) {%>
		<%=request.getAttribute("resultado")%>
	<%}%>
	</div>
<%} %>
</div>

</div>
</body>
</html>