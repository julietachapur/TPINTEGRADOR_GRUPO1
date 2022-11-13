<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movimientos</title>
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
</head>
<body>

<% 

	//BigDecimal currentCuenta = 0;
	/*Usuario usuario = null;
	if(request.getSession().getAttribute("Usuario") != null) {
		usuario = (Usuario) request.getSession().getAttribute("Usuario");
	}
	
	ArrayList<Cuenta> listaCuentas = null;
	if(request.getSession().getAttribute("cuentas") != null)
	{
		listaCuentas = (ArrayList<Cuenta>) request.getSession().getAttribute("cuentas");
		currentCuenta = listaCuentas.get(0).getNroCuenta();
	}*/
	
	/*if( request.getAttribute("cuentaSeleccionada") != null) 
	{
		currentCuenta = (int) request.getSession().getAttribute("cuentaSeleccionada");
	}*/
	
	/*if( request.getAttribute("saldo") != null) 
	{
		currentCuenta = (BigDecimal) request.getSession().getAttribute("saldo");
	}
		*/
		
 %> 
 
 
<a href="gestionarCuentas.jsp"> <span class="fa fa-home"></span> Volver</a>
	<h1 style="margin:auto; margin-bottom:20px;text-align:center;">Movimientos</h1>
	
	<section class="Cuenta">
		<div class="Cuenta-Tipo">
			<label id="lblCuentaTipo">CA$</label>
		</div>
		<div class="Cuenta-Detalle">
			<label id="lblDisponibleCuenta">$95.454,77</label>
			<label id="lblDetalleCuenta">Caja Ahorro pesos 4020981-3 420-20</label>
		</div>
	</section>
	<section class="tabla-movimientos">
	<table >
		<tr>
			<th>Fecha</th>
			<th>Descripcion</th>
			<th>Tipo de movimiento</th>
			<th>Monto</th>
		</tr>
		<tr>
			<td>25/06/2022</td>
			<td>Cuota 3</td>
			<td>Pago de cuota</td>
			<td>$1558</td>
		</tr>
		<tr>
			<td>26/06/2022</td>
			<td>Compra Moto</td>
			<td>Transferencia</td>
			<td>$1558</td>
		</tr>
		<tr>
			<td>28/06/2022</td>
			<td>Pago de haberes</td>
			<td>Transferencia</td>
			<td>$1558</td>
		</tr>
	</table>
	<div class="botones">
		<button>Anterior</button>
		<button>Siguiente</button>
	</div>
	</section>
</body>
</html>