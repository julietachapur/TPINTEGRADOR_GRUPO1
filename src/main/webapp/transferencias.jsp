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
	Cuenta cuenta = new Cuenta();
	int currentCuenta;
	if(session.getAttribute("Usuario")!=null && request.getParameter("getCuenta")!=null && request.getSession().getAttribute("cuentaSeleccionada")!=null){	
		Usuario usuario = new Usuario();
		usuario = (Usuario)session.getAttribute("Usuario");	
		CuentaNegocioImpl cuentas = new CuentaNegocioImpl();
		currentCuenta = (int) request.getSession().getAttribute("cuentaSeleccionada");
		cuenta = cuentas.readOne(currentCuenta);
		
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
<form class="form" method="post">
    <fieldset>
      <legend>Nueva transferencia</legend>
      <p class="inputForm">
      	<label >Cuenta origen</label>
      	<input readonly value="<%=cuenta.getCbu()%>" type="text">
      	<input hidden value="<%=cuenta.getNroCuenta()%>" type="text" name="ctaOrigen">
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
      <p class="button">
        <button id="btnRealizarTransferencia" name="btnRealizarTransferencia" onclick="confirmar();">Transferir</button>
      </p>
    </fieldset>
</form>	
<script>

	function confirmar(){
		var monto = document.getElementById('txtMonto');
		var dni = document.getElementById('txtDNI');
		var cbu = document.getElementById('txtCbu');
		if (monto.value == "" || dni.value =="" || cbu.value ==""){
			alert("Llene los campos");
		}
		else if(isNaN(monto.value)|| isNaN(dni.value) || isNaN(cbu.value)){
			alert("Los datos ingresados no estan en el formato correcto.");
		}
		else if (<%=cuenta.getSaldo()%><monto.value){
			alert("El saldo de la cuenta es insuficiente para realizar la transferencia");
		}
		else if (confirm("Presione aceptar para confirmar la transferencia..")){
			document.forms[0].action = "ServletTransferencia";
			document.forms[0].submit();
		}
	}

</script>	
</body>
</html>