<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Usuario" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<title>Eliminar Cliente - Admin</title>
</head>
<body>

<% 
	String dni = null;
	String mensaje = " ";

	if(request.getAttribute("dni") != null) {
		dni = (String) request.getAttribute("dni");
	}
	
	boolean eliminado = false;
	if( request.getAttribute("eliminado") != null) {
		eliminado = (boolean)request.getAttribute("eliminado");
	}
	
	Usuario usuario = new Usuario();
 	if(session.getAttribute("Usuario")!=null){	
 		usuario = (Usuario)session.getAttribute("Usuario");
 	}
	
 	
 	if( request.getAttribute("mensaje") != null ) {
		mensaje = (String) request.getAttribute("mensaje");
	}
 	
	boolean conSaldo = false;
 	if( request.getAttribute("conSaldo") != null ) {
 		conSaldo = (Boolean) request.getAttribute("conSaldo");
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
 
<div class="ABM">
<a class="volver" href="/TPINTEGRADOR_GRUPO1/ServletCliente?pag=1"> <span class="volverIcon fa fa-home"></span> Volver</a>
<h1>Eliminar cliente</h1>


<div style="display:flex; flex-direction: column; align-items: center;">
<% if( eliminado == true || conSaldo == true) { %>	
	<div>
		<p style="font-size: 1.5rem;"> <%=mensaje %> <p>
	</div>
	<%} else { %>
	<div>
	<% if(request.getAttribute("clienteBaja") != null) {%>
		<%=request.getAttribute("clienteBaja")%>
	<%}%>
		<p style="font-size: 1.5rem;"> ¿Confirma realizar la baja del cliente y su usuario ? </p>
	</div>
	<form method="get" action="ServletCliente">
	  <p class="button">
        <input id="btnSeleccionar" type="submit" value="Confirmar" name="btnBajaUsuario">
        <input type="hidden" name="dni" value=<%= dni %> >
      </p>
	</form>
<%} %>
</div>

</body>
</html>