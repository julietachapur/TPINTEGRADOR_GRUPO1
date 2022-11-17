<%@page import="entidad.Usuario" %>
<%@page import="java.util.ArrayList"%>
<%@page import="entidad.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<title>Modificar Cliente - Admin</title>
</head>
<body>

<% 
	ArrayList<Cliente> listaClientes = null;
	ArrayList<Cliente> clientesPaginados = null;
	if(request.getAttribute("clientes") != null)
	{
		listaClientes = (ArrayList<Cliente>) request.getAttribute("clientes");
		clientesPaginados = (ArrayList<Cliente>) request.getAttribute("clientesPaginados");
		
	}

	//Para paginado:
	int pag = 0;
	int cantPag = 0;
    //Al momento de dar siguiente o presionar otro botón, manda como parametro "pag" con el número de página.
    if (request.getAttribute("pag") != null) {
        pag = (int) request.getAttribute("pag");
        cantPag = (int) request.getAttribute("cantPag");
    } 
	
	
    Usuario usuario = new Usuario();
 	if(session.getAttribute("Usuario")!=null){	
 		usuario = (Usuario)session.getAttribute("Usuario");
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
<a style="margin-top: 0.5rem;" class="volver" href="adminClientes.jsp"> <span class="volverIcon fa fa-home"></span> Volver</a>
<h1>Modificar cliente</h1>
<span style="margin-bottom: 0.5rem;">Por favor seleccione el cliente que desea modificar</span>

 <form method="get" action="ServletCliente" >
 <select name="clienteSeleccionado">   
  <%
 	if(listaClientes!=null)
 		for(Cliente clFil : listaClientes) 
		{ 
 			if(clFil.isEstado()) {
	%>
	<option value="<%=clFil.getDni()%>" > <%= clFil.getApellido() %>, <%= clFil.getNombre() %> - DNI: <%=clFil.getDni()%> </option>
	<%	} }%>
  
</select>
    <input type="submit" value="Filtrar" name="btnFiltrar">
    <input type="submit" value="Limpiar filtro" name="btnLimpiar">
</form>


<table class="tablaClientes" >
    <thead>
        <tr>
	    	<th>DNI</th>
		    <th>Nombre</th>
	    	<th>Sexo</th>
	    	<th>Localidad</th>
	    	<th>Email</th>
	    	<th>Acción</th>
        </tr>
    </thead>
    <tbody>
       <%  if(clientesPaginados != null)
		for(Cliente cl : clientesPaginados) 
		{			
			if(cl.isEstado()) {   //Así solo muestra los que tienen el estado en true
	%>
		<tr>  
		    <form name="listadoClientes" action="ServletCliente" method="get">
				<td><%= cl.getDni() %> <input type= "hidden" name="dni" value=<%=cl.getDni()%>> </td> 
				<td><%= cl.getApellido() %>,   
				    <%= cl.getNombre() %></td>
				<td><%= cl.getSexo()%></td>
				<td><%= cl.getLocalidad().getLocalidad() %>, 
					<%= cl.getLocalidad().getProvincia().getProvincia() %>,
					<%= cl.getLocalidad().getPais().getPais() %></td>
				<td><%= cl.getCorreo_electronico() %></td>				
				<td> 
					<div style="display:flex; justify-content: space-evenly;" >
						<input type="submit" name="btnModificar" value="Modificar"> 
						<input type="submit" name="btnEliminar" value="Eliminar">
					</div>
				</td>
			
			</form> 
		</tr>
	<% } } %>
		
    </tbody>
</table>
	<div class="paginado">
		 <%	if (cantPag >= 1) {
            //Si la página diferente a uno, si agrega el botón anterior.
               if(pag!=1){%>
                   <a href="ServletCliente?pag=<%=pag - 1%>">&lt;</a>
                      <%  }  //Calcula la cant de páginas a mostrar.
                            for (int i = 0; i < cantPag; i++) {
                         
                                if(i+1==pag){  //Si la página es igual a la página actual, muestra la etiqueta active.
                        %>
                            <span><%=i+1%></span>
                      
                      <%  } else { //Si no, sigue mostrando las etiquetas normales con la opción para desplazarse. %>
                             <a href="ServletCliente?pag=<%=i+1%>"><%=i+1%></a>
                        <%} }
                        //Sí pagina es diferente al número máximo de páginas, muestra la opción siguiente.
                        if(pag!=cantPag){%>
                            <a href="ServletCliente?pag=<%=pag + 1%>">&gt;</a>
                <%} }  else { //Si el máximo de páginas no es mayor a 1, muestra solo una página %>
                   			<span>1</span>
                <% }  %>
	</div>
	</div>
</body>
</html>