<%@page import="java.util.ArrayList"%>
<%@page import="entidad.Cuenta" %>
<%@page import="entidad.Usuario" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Solicitar prestamo</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
</head>
<body>
<% 

///Verificacion  de usuario conectado
Usuario usuario = null;
if(request.getSession().getAttribute("Usuario") != null) {
	usuario = (Usuario) request.getSession().getAttribute("Usuario");
}
else
{
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", "index.jsp"); 	
}
///terminacion de Verificacion  de usuario conectado


///comprobacion de cuenta
int currentCuenta = 0;
if(request.getSession().getAttribute("cuentaSeleccionada") != null) 
	{
	currentCuenta = (int) request.getSession().getAttribute("cuentaSeleccionada");
	}
///terminacion de comprobacion de cuenta


///Resultados para cuando vuelve la pagina con response
String resString=null;
Boolean resBoolean=false;
if(request.getAttribute("resString")!=null)
	{
		resString =  request.getAttribute("resString").toString();
	}
if(request.getAttribute("resBoolean")!=null)
	{
	resBoolean =  Boolean.parseBoolean( request.getAttribute("resBoolean").toString());
	}
/////Terminacion de resultados
 %>
<header class="header"> 
	<div>
		<a href="inicioClientes.jsp">
			<img style = "float: left; margin: 2px 20px 10px 0; ; " src="img/logo.jpg"  alt="logo" width="50" height="50"  />
		</a>
	</div>
	<div class="logged">
		<span><%=usuario.getUsuario()%></span>
		<span>LOGGUEADO</span>
	</div>
</header>



<a style="margin-top: 0.5rem;" class="volver" href="gestionarCuentas.jsp"> <span class="volverIcon fa fa-home"></span> Volver</a>


<form class="form" method="get" action="ServletPrestamosxAutorizar">

<h1 style="margin:auto;text-align:center;margin-bottom:30px;">Solicitar nuevo prestamo</h1>
<%
		if(resString!= null && !resString.equals("go"))
		{
		if(!resBoolean){%>
	<br>
	 <h2 style="color:red;"><%=resString%></h2>
	<%}
		else
		{%>
			<br>
	 	<h2 style="color:green;"><%=resString%></h2>
		<%}
		}
	%>
	

    <fieldset>
      <legend>Solicitud de prestamo para cuenta <%=currentCuenta%></legend>
      <p class="inputForm">
        <label for="txtMonto">Monto solicitado</label>
        <input id="txtMonto" type="text" required name="txtMonto" placeholder="$..">
      </p>
     
        <label for="txtCuotas">Cant. De cuotas</label>
        
        <label for="cuotas">Elige  una cuota</label>
  <select name="txtCuotas" id="cuotas">
      <option value="3">3</option>
      <option value="6">6</option>
      <option value="9">9</option>
      <option value="12">12</option>
      <option value="12">18</option>
      <option value="24">24</option>
      <option value="48">48</option>
      <option value="60">60</option>
      <option value="72">72</option>
  </select>
      
      <input type="hidden" name="getCuenta" value="<%=currentCuenta%>">
      <p class="buton">
		<input id="btnRealizarSolicitudPrestamo" type="submit" value="Solicitar Prestamo" required name="btnRealizarSolicitudPrestamo">      </p>
    </fieldset>
</form>		
</body>
</html>