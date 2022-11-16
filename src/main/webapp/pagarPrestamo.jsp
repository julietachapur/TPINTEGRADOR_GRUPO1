<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Prestamo" %>
<%@page import="entidad.Cuenta" %>
<%@page import="entidad.Cuota" %>
<%@page import="java.util.ArrayList" %>
<%@page import="jakarta.servlet.RequestDispatcher" %>

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
<a href="gestionarCuentas.jsp"> <span class="fa fa-home"></span> Volver</a>
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
			request.setAttribute("ErrorSinParametro",true);
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request,response);
		}
		//cuentasList.get(pos)
		%>
		<label>Seleccionar Prestamo</label>
		<section class="eleccion-prestamos">
		<select class="select" id="select-prestamo">
			<option value="-1">Seleccione un prestamo</option>
		<% for(Prestamo p : prestamoList){%>
			<option value="<%=p.getCodPrestamo()%>">Codigo: <%=p.getCodPrestamo()%> - Monto: $<%=p.getImporte_a_pagar()%></option>
		
		<%}%> 
		</select>
		<button id="btnPagar">Pagar</button>
	</section>
	
	<section class="Cuenta">
		<div class="Cuenta-Tipo">
		<%  if(cuentasList.get(pos).getTipoCuenta().getCodTipo()== 1) {	%>
			<label id="lblCuentaTipo">CA$</label>
		<%	} else { %>
				<label id="lblCuentaTipo">CC$</label>
		<%	} %>
		</div>
		<div class="Cuenta-Detalle">
			<label id="lblDisponibleCuenta">$<%=cuentasList.get(pos).getSaldo() %></label>
			<label id="lblDetalleCuenta"><%=cuentasList.get(pos).getTipoCuenta().getTipoCuenta()%> - Cuenta Nro: <%= cuentasList.get(pos).getNroCuenta() %></label>
		</div>
	</section>
	
	
	<section class="detalle-cuota">
	<table id="tabla-cuotas">
		<tr>
			<th>Cuota</th>
			<th>Importe</th>
			<th>Fecha de pago</th>
			<th>Fecha vencimiento</th>
			<th>Estado</th>
		</tr>
		<% for(Cuota c : cuotasList){%>
		<tr class="<%=c.getCodPrestamo()%>">
			<td><%=c.getNroCuota()%></td>
			<td><%=c.getImporte() %></td>
			<td><%=c.getFecha_pago() %></td>
			<td><%=c.getFecha_venc() %></td>
			<td><%=c.getEstado()%></td>
			<td><button onclick="cuotaSeleccionada(<%=c.getIdCuota()%>);">Seleccionar</button></td>
		</tr>
		<%}%> 
	</table>
	</section>
	
	<script>
	
	function cuotaSeleccionada(idCuota){
		alert("Selecciono la cuota con el ID " + idCuota + ", vamo a pagarla en el proximo episodio");
	}
	
	var prestamoSeleccionado = document.getElementById("select-prestamo");
	var btnPagar = document.getElementById("btnPagar");
	var tabla = document.getElementById("tabla-cuotas");
	
	</script>
</body>
</html>