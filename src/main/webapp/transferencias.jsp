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

<%
	Cuenta cuenta = null;
	int currentCuenta = 0;
	int nroCuenta = 0;
	ArrayList<Cuenta> cuentasList = null;
	Usuario usuario = new Usuario();
	
	if(session.getAttribute("Usuario")!=null && request.getParameter("getCuenta")!=null && request.getSession().getAttribute("cuentas") != null){	
		cuentasList = (ArrayList<Cuenta>) request.getSession().getAttribute("cuentas");
		usuario = (Usuario)session.getAttribute("Usuario");	
		currentCuenta = Integer.parseInt(request.getParameter("getCuenta"));
		nroCuenta = Integer.parseInt(request.getParameter("getCuenta"));	
		for(int i=0;i<cuentasList.size();i++) { 
 			if(cuentasList.get(i).isEstado()){
 				if (cuentasList.get(i).getNroCuenta()==nroCuenta){
 					cuenta = cuentasList.get(i);
 					break;
 				}
 			}
		}
		
	}
	else {
	%>
	<script>
		alert("Permiso denegado. Inicie sesion para continuar")
	</script>
	<%
 	response.sendRedirect("/TPINTEGRADOR_GRUPO1/index.jsp");
	}
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
<h1 style="margin:auto;text-align:center;margin-bottom:30px;">Transferencias</h1>


<form class="form" method="post">
    <fieldset>
      <legend>Nueva transferencia</legend>
      <p class="inputForm">
      	<label >Cuenta origen</label>
      	<input readonly value="<%=cuenta.getCbu()%>" type="text">
      	<input hidden value="<%=cuenta.getNroCuenta()%>" type="text" id="txtCtaOrigen" name="txtCtaOrigen">
      </p>    
      <p class="inputForm">
        <label for="txtImporteDisponible">Importe disponible: </label>
        <input id="txtImporteDisponible" type="text" value="$<%=cuenta.getSaldo()%>" name="txtImporteDisponible" readonly>
      </p>  
      <p class="inputForm">
        <label for="txtCbuDestino">CBU destino:</label>
        <input id="txtCbu" type="text"required name="txtCbu" placeholder="CBU..">
      </p>
      <p class="inputForm">
        <label for="txtDNI">DNI destino:</label>
        <input id="txtDNI" type="text"required name="txtDNI" placeholder="DNI..">
      </p>
      <p class="inputForm">
        <label for="txtMonto">Monto: </label>
        <input id="txtMonto" type="text"required name="txtMonto"  placeholder="$00,00">
      </p>
      <p class="inputForm">
        <label for="txtDetalle">Detalle: </label>
        <input id="txtDetalle" type="text" name="txtDetalle"  placeholder="..">
      </p>
      <p class="button">
        <button id="btnRealizarTransferencia" name="btnRealizarTransferencia" onclick="confirmar();" value="1">Transferir</button>
      </p>
    </fieldset>
</form>	
<script>
	function confirmar(){
		var monto = document.getElementById('txtMonto');
		var dni = document.getElementById('txtDNI');
		var cbu = document.getElementById('txtCbu');
		
		<%
 				%>if(cbu.value==<%=cuenta.getCbu()%>){
 					alert("No puede transferir dinero a la misma cuenta!");
 				}<%
		%>
		else if (monto.value == "" || dni.value =="" || cbu.value ==""){
			alert("Llene los campos");
		}
		else if(isNaN(monto.value)|| isNaN(dni.value) || isNaN(cbu.value)){
			alert("Los datos ingresados no estan en el formato correcto.");
		}
		else if (<%=cuenta.getSaldo()%><monto.value){
			alert("El saldo de la cuenta es insuficiente para realizar la transferencia");
		}
		else if(monto.value<500){
			alert("El monto minimo de transferencia es de $500");
		}
		else if (confirm("Presione aceptar para confirmar la transferencia..")){
			document.forms[0].action = "ServletTransferencia";
			document.forms[0].submit();
		}
	}
</script>	
</body>
</html>