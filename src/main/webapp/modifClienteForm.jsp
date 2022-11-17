<%@page import="entidad.Usuario" %>
<%@page import="entidad.Pais" %>
<%@page import="entidad.Localidad" %>
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
	String dni = null;
	Cliente cl = null;
	
	ArrayList<String> sexo = new ArrayList<String>();
	sexo.add("F");
	sexo.add("M");
	sexo.add("X");
	
	if(request.getAttribute("dni") != null) {
		dni = (String) request.getAttribute("dni");
	}
	
	if(request.getAttribute("cliente") != null) {
		cl = (Cliente) request.getAttribute("cliente");
	}

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
	
	boolean modificado = false;
	if( request.getAttribute("modificado") != null) modificado = (boolean)request.getAttribute("modificado");
	
	
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
<a style="margin-top: 0.5rem;" class="volver" href="/TPINTEGRADOR_GRUPO1/ServletCliente?pag=1"> <span class="volverIcon fa fa-home"></span> Volver</a>
<h1>Modificar cliente</h1>
  <% if(cl != null )	{ %>

<div class="ABM">
<form class="form " method="get" action="ServletCliente">
    <fieldset>
    
      <legend>Modificar cliente</legend>
      <p class="inputForm">
        <label for="dni">DNI</label>
        <input id="dni" type="text" value="<%=cl.getDni()%>" disabled > <input type="hidden" name="txtDNI" value="<%=cl.getDni()%>" maxlength=10 >
      </p>
      <p class="inputForm">
        <label for="nombres">Nombre</label>
        <input id="nombres" type="text"required name="txtNombre" value="<%=cl.getNombre()%>" maxlength=50>
      </p>
      <p class="inputForm">
        <label for="apellidos">Apellido</label>
        <input id="apellidos" type="text" required name="txtApellido" value="<%=cl.getApellido()%>" maxlength=50 >
      </p>      
      <p class="inputForm">
        <label for="cuil">CUIL</label>
        <input id="cuil" type="text" required name="txtCuil" value="<%=cl.getCuil()%>" maxlength=13>
      </p>
      <p class="inputForm">
        <label for="sexo">Sexo</label>
        <select id="sexo" name="sexo" required>
         <%
		 	if(sexo!=null)
				for(String s:sexo)
				{
					if(!s.equals(cl.getSexo())){
			%>
				<option value="<%= s %>" > <%= s %></option>
			<%	} else { %>
				<option value="<%= s %>" selected> <%= s %></option>
			<%	} } %>
        </select>
      </p>
      <p class="inputForm">
        <label for="nacionalidad">Nacionalidad</label> 
        <select id="nacionalidad" name="nacionalidad" required>
		  <%
		 	if(listaPaises!=null)
				for(Pais p:listaPaises)
				{
					if(p.getCodPais() != cl.getNacionalidad().getCodPais()){
			%>
			<option value="<%=p.getCodPais()%>" > <%=p.getPais()%></option>
			<%	} else {%>
				<option value="<%=p.getCodPais()%>" selected > <%=p.getPais()%></option>
		<%	} }%>
        </select>
      </p>
      <p class="inputForm">
        <label for="fecha_nac">Fecha de nacimiento</label>
        <input id="fecha_nac" type="date" required name="txtFecha_nac" value="<%= cl.getFecha_nac() %>" >
      </p>     
      <p class="inputForm">
        <label for="direccion">Dirección</label>
        <input id="direccion" type="text" required name="txtDireccion" value="<%= cl.getDireccion() %>" maxlength=200>
      </p>
      <p class="inputForm">
        <label for="localidad">Localidad</label> 
        <select id="localidad" name="localidad" required>
		  <%
		 	if(listaLocalidades!=null)
				for(Localidad l:listaLocalidades)
				{
					if(l.getCodLocalidad() != cl.getLocalidad().getCodLocalidad()){
			%>
			<option value="<%=l.getCodLocalidad()%>" > <%=l.getLocalidad()%></option>
			<%	} else { %>
				<option value="<%=l.getCodLocalidad()%>" selected> <%=l.getLocalidad()%></option>
			<%	} } %>
        </select>
      </p>
      <p class="inputForm">
        <label for="email">E-mail</label>
        <input id="email" type="email" required name="txtEmail" value="<%= cl.getCorreo_electronico() %>" maxlength=200>
      </p>
      <p class="inputForm">
        <label for="telefonos">Teléfonos</label>
        <%  if( cl.getTelefonos() == null) { %>
                <input id="telefonos" type="text" required name="txtTelefonos" value=" " maxlength=200>
        	<%	} else { %>
        	<input id="telefonos" type="text" required name="txtTelefonos" value="<%= cl.getTelefonos() %>" maxlength=200>
        <%	}  %>
      </p>
      <p class="button">
        <input id="btnRegistrar" type="submit" value="Modificar" required name="btnModificarBD">
      </p>
    </fieldset>
</form>		

</div>
    <%	}%>


<div style="display:flex; flex-direction: column; align-items: center;">
<% if( modificado == true) 
	{
%>	
	<div>
		<p style="font-size: 1.5rem;">Cliente modificado con éxito <p>
	</div>
	<div>
	<% if(request.getAttribute("resultado") != null) {%>
		<%=request.getAttribute("resultado")%>
	<%}%>
	</div>
<%} %>
</div>
<div>
	<form method="get" action="ServletUsuario">
	  <p class="button">
        <input id="btnRegistrar" type="submit" value="Alta / Modificación Usuario Home Banking" name="btnModifUsuario">
        <input type="hidden" name="dni" value=<%= dni %> >
      </p>
	</form>
</div>

</div>
</body>
</html>