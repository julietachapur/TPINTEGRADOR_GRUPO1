<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
	if(request.getAttribute("dni") != null) {
		dni = (String) request.getAttribute("dni");
	}
	
	boolean eliminado = false;
	if( request.getAttribute("eliminado") != null) eliminado = (boolean)request.getAttribute("eliminado");
	
 %>
 
 
<a href="/TPINTEGRADOR_GRUPO1/ServletCliente?getId"> <span class="fa fa-home"></span> Volver</a>
<div class="ABM">
<h1>Eliminar cliente</h1>


<div style="display:flex; flex-direction: column; align-items: center;">
<% if( eliminado == true) { %>	
	<div>
		<p style="font-size: 1.5rem;">Cliente eliminado con éxito <p>
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