<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Prestamo" %>
<%@page import="java.util.ArrayList" %>
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
	<div class="comboEleccionCuenta" style="margin-bottom:15px;">
		<label>Seleccionar Prestamo</label>
		<%
		ArrayList<Prestamo> prestamoList = null;
		if (request.getAttribute("Prestamos")!=null){
			prestamoList = (ArrayList<Prestamo>) request.getAttribute("Prestamos");
			
			
		}
		else if(request.getAttribute("SinPrestamos")!=null){
			%><script>alert("No tiene prestamos para abonar");</script><% 
		}
		
		%>
		
		<section class="eleccion-prestamos">
		<select class="select" id="select-prestamo">
			<option value="-1">Seleccione un prestamo</option>
		<% for(Prestamo p : prestamoList){%>
			<option value="<%=p.getCodPrestamo()%>">Codigo: <%=p.getCodPrestamo()%> - Monto: $<%=p.getImporte_a_pagar()%></option>
		
		<%}%> 
		</select>
	</div>
	<div class="comboEleccionCuenta" style="margin-bottom:20px;">
		<label>Seleccionar cuota</label>
		<select class="select-cuota">
			<option>1/6</option>
			<option>2/3</option>
			<option>3/4</option>
			<option>4/5</option>
			<option>5/6</option>
			<option>6/6</option>
		</select>
	</div>
	</section>
	<section class="detalle-cuota">
	<table>
		<tr>
			<th>Cuota</th>
			<th>Importe</th>
			<th>Estado</th>
			<th>Fecha de Vto.</th>
		</tr>
		<tr>
			<td>Cuota 3/6</td>
			<td>$1558</td>
			<td>Vencida</td>
			<td>25/06/2022</td>
		</tr>
	</table>
	<div class="botones">
		<button>Pagar</button>
	</div>
	</section>
</body>
</html>