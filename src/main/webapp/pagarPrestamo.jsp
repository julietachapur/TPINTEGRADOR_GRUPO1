<%@page import="entidad.Usuario" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Prestamo" %>
<%@page import="entidad.Cuenta" %>
<%@page import="entidad.Cuota" %>
<%@page import="java.util.ArrayList" %>
<%-- <%@page import="jakarta.servlet.RequestDispatcher" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pagar prestamo</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
</head>
<body>
<%
		
		Usuario usuario = new Usuario();
	 	if(session.getAttribute("Usuario")!=null){	
	 		usuario = (Usuario)session.getAttribute("Usuario");
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



<h1 style="margin:auto;text-align:center;margin-bottom:30px;">Pagar prestamos</h1>
		<%
	 	
		ArrayList<Prestamo> prestamoList = null;
		ArrayList<Cuenta> cuentasList = null;
		ArrayList<Cuota> cuotasList = null;
		int pos= 0;
		int nroCuenta = 0;
		
		/*Verifico si estoy recibiendo todos los parametros que necesito*/
		if (request.getAttribute("Prestamos")!=null &&request.getAttribute("Cuotas")!=null && request.getSession().getAttribute("cuentas") != null && request.getAttribute("NroCuenta")!=null){
			prestamoList = (ArrayList<Prestamo>) request.getAttribute("Prestamos");
			cuotasList = (ArrayList<Cuota>) request.getAttribute("Cuotas");
			nroCuenta = (int) request.getAttribute("NroCuenta");
			cuentasList = (ArrayList<Cuenta>) request.getSession().getAttribute("cuentas");
			for(int i=0;i<cuentasList.size();i++) { 
	 			if(cuentasList.get(i).isEstado()){
	 				if (cuentasList.get(i).getNroCuenta()==nroCuenta){
	 					pos=i;
	 					break;
	 				}
	 			}
			}
			
		}
		else{
			%><script>alert("Ocurrio un error durante la carga de la pagina. Si el problema persiste contacte a soporte tecnico.")</script><%
			response.sendRedirect("/index.jsp");
		}
		//cuentasList.get(pos)
		%>
		
		<section class="eleccion-prestamos">
		<label>SELECCIONAR PRESTAMO</label>
		<select class="select" id="select-prestamo">
			<option value="-1">Seleccione un prestamo</option>
		<% for(Prestamo p : prestamoList){%>
			<option value="<%=p.getCodPrestamo()%>">Codigo: <%=p.getCodPrestamo()%> - Monto: $<%=p.getImporte_a_pagar()%></option>
		
		<%}%> 
		</select>
		<button id="btnElegirPrestamo" class="btnSeleccionar" onclick="getCuotasPretamo()">Elegir prestamo</button>
	</section>
	
	<section class="Cuenta" style="margin-bottom:30px;">
		<div class="Cuenta-Tipo">
		<%  if(cuentasList.get(pos).getTipoCuenta().getCodTipo()== 1) {	%>
			<label id="lblCuentaTipo">CA$</label>
		<%	} else { %>
				<label id="lblCuentaTipo">CC$</label>
		<%	} %>
		</div>
		<div class="Cuenta-Detalle">
			<label id="">$<%=cuentasList.get(pos).getSaldo()%></label>
			<label id="lblDetalleCuenta"><%=cuentasList.get(pos).getTipoCuenta().getTipoCuenta()%> - Cuenta Nro: <%=cuentasList.get(pos).getNroCuenta()%></label>
		</div>
	</section>
	<!-- -->
	<!--<%=cuentasList.get(pos).getNroCuenta()%>-->
	<section class="detalle-cuota">
	<table id="tabla-cuotas" style="display:none; text-align:center; width:80%; margin:auto;">
		<tr style="text-align:center;">
			<th>Cuota</th>
			<th>Importe</th>
			<th>Fecha de pago</th>
			<th>Fecha vencimiento</th>
			<th>Estado</th>
			<th>Pagar</th>
		</tr>
		<% for(Cuota c : cuotasList){%>
		<tr class="cuotasTr cuoPrestamo-<%=c.getCodPrestamo()%>" style="display:none">
			<td><%=c.getNroCuota()%></td>
			<td>$<%=c.getImporte() %></td>
			<td><% if (c.getFecha_pago()==null ){%>
				<%="-"%>
			<%} 
			else{%>
				<%=c.getFecha_pago()%>
			<%}%></td>
			<td><%=c.getFecha_venc() %></td>
			<td><% if (c.getEstado()){%>
				<%="Pendiente de pago"%>
			<%} 
			else{%>
				<%="Pago"%>
			<%}%></td>
			<td><button <%if(!c.getEstado()){%>
							disabled				
						<%}%> 
				onclick="cuotaSeleccionada(<%=c.getIdCuota()%>,<%=c.getImporte()%>,<%=c.getEstado()%>);" class="">Pagar cuota</button></td>
		</tr>
		<%}%> 
	</table>
	</section>
	<form method="post" action ="ServletCuota" hidden>
		<input type="text" hidden id="IdCuotaAPagar" name="IdCuotaAPagar">
		<input type="text" hidden id="NroCuenta" name="NroCuenta" value="<%=cuentasList.get(pos).getNroCuenta()%>">
		<input type="text"  hidden id="impCuot" name="impCuota">
		<input type="text" name="OPPAGARCUOTA">
	</form>
	<script>
	
	function cuotaSeleccionada(idCuota, importe, estado){
		requestID = document.getElementById("IdCuotaAPagar");
		requestImporte = document.getElementById("impCuot");
		requestID.value= idCuota;
		requestImporte.value = importe;
		if(!estado)
			alert("La cuota esta paga")
		
		else if (importe><%=cuentasList.get(pos).getSaldo()%>)
			alert("No tiene saldo suficiente para realizar el pago.");
		
		else if(confirm("Presione aceptar para confirmar el pago de la cuota.."))
			document.forms[0].submit();
		
		else
			alert("Pago cancelado")
		
		}
	
	var tabla = document.getElementById("tabla-cuotas");
	var prestamoSeleccionado = document.getElementById("select-prestamo");
	
		
	function getCuotasPretamo(){
		/*Oculto Todas Las Cuotas*/
		var btnElegirPrestamo = document.getElementById("btnElegirPrestamo");
		var CodPrestamo = prestamoSeleccionado.options[prestamoSeleccionado.selectedIndex].value;
		
		var allCuo = document.querySelectorAll('.cuotasTr');
		OcultarCuotas(allCuo);
		
		/*Si se eligio un prestamo muestro las cuotas de ese prestamo*/
		if (CodPrestamo!=-1){
			var cuotasPrestamoSeleccionado = document.querySelectorAll(".cuoPrestamo-"+CodPrestamo);
			MostrarCuotas(cuotasPrestamoSeleccionado);
			MostrarTabla();
		}
		/*Si no oculto las cuotas*/
		else{
			OcultarTabla();
		}
		
	}
	
	function OcultarCuotas(allCuo){
		
		for (var cuo of allCuo){
				cuo.style.display='none';
		}	
	}
	
	function MostrarCuotas(allCuo){
		for (var cuo of allCuo){
			cuo.style.display="";
	}	
	}
	
	function OcultarTabla(){
		tabla.style.display='none';
	}
	
	function MostrarTabla(){
		tabla.style.display='';
	}
	
	</script>
</body>
</html>