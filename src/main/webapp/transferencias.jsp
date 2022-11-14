<%@page import="entidad.Usuario" %>
<%@page import="negocioImpl.CuentaNegocioImpl" %>
<%@page import="entidad.Cuenta" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page session="true"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transferencias</title>
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
</head>
<body>
<a href="gestionarCuentas.jsp"> <span class="fa fa-home"></span> Volver</a>
<h1 style="margin:auto;text-align:center;margin-bottom:30px;">Transferencias</h1>
<%
	ArrayList<Cuenta> cuentasList = null;
	if(session.getAttribute("Usuario")!=null && request.getParameter("cuenta")!=null){	
		Usuario usuario = new Usuario();
		usuario = (Usuario)session.getAttribute("Usuario");	
		//CuentaNegocioImpl cuentas = new CuentaNegocioImpl();
		//cuentasList = (ArrayList<Cuenta>)cuentas.readForClient(usuario.getcliente().getDni());
		//if (cuentasList.isEmpty())
			
	}
	else {
		%>
		<script>
			alert("Inicie sesion para continuar");
		</script>
		<%
 	response.sendRedirect("/TPINTEGRADOR_GRUPO1/Index.jsp");
	}
%>
<form class="form" method="post" action="ServletTransferencia">
    <fieldset>
      <legend>Nueva transferencia</legend>
      <p class="inputForm">
      	<label >Cuenta origen</label>
 		<select id="select-cuentas">	
        	<option value="0">Seleccione una cuenta</option>
        	<%for(Cuenta c: cuentasList){%>
        	<option value="<%=c.getNroCuenta()%>-<%=c.getSaldo()%>"><%=c.getCbu()%></option>
        	<%}%>
        </select>
      </p>
      <p class="inputForm">
      	<label>Importe disponible</label>
      	<input readonly type="text" id="ImporteDisponible" value="$0">
      </p>      
      <p class="inputForm">
        <label for="txtCbu">CBU destino</label>
        <input id="txtCbu" type="text"required name="txtCbu" placeholder="CBU..">
      </p>
      <p class="inputForm">
        <label for="txtDNI">DNI destino</label>
        <input id="txtDNI" type="text"required name="txtDNI" placeholder="DNI..">
      </p>
      <p class="inputForm">
        <label for="txtMonto">Monto a transferir</label>
        <input id="txtMontoi" type="text"required name="txtMonto" placeholder="$00,00">
      </p>
      <p class="button">
        <input id="btnRealizarTransferencia" type="submit" value="Transferir" required name="btnRealizarTransferencia">
      </p>
    </fieldset>
	<script>
		var cuentas = document.getElementById("select-cuentas");
		cuentas.addEventListener('click', mostrarImporte());
		
		function mostrarImporte(){
			
		}
	
	</script>
</form>		
</body>
</html>