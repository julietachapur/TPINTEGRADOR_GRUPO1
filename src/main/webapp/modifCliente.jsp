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
	if(request.getAttribute("clientes") != null)
	{
		listaClientes = (ArrayList<Cliente>) request.getAttribute("clientes");
	}

	//Para paginado:
	int pag = 1;
	int maxPag = 1;
    //Al momento de dar siguiente o presionar otro botón, manda como parametro "pg" con el número de página.
    if (request.getParameter("pag") != null) {
        pag = Integer.valueOf(request.getParameter("pag"));
        maxPag = Integer.valueOf(request.getParameter("maxPag"));
    } 
	
	
 %>
 
 
<a href="adminClientes.jsp"> <span class="fa fa-home"></span> Volver</a>
<div class="ABM">
<h1>Modificar cliente</h1>
<span>Por favor seleccione el cliente que desea modificar</span>

 <form method="get" action="ServletCliente" >
 <label for="filtroClientes">Filtro clientes:</label><br>
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
       <%  if(listaClientes != null)
		for(Cliente cl : listaClientes) 
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
			    <%	if (maxPag >= 1) {
                        //Si la página diferente a uno, si agrega el botón anterior.
                        if(pag!=1){%>
                            <li><a href="blog.jsp?pg=<%=pag - 1%>">&lt;</a></li>
                        <%}%>
                        <%//Realizo el for para calcular el máximo de páginas.
                            for (int i = 0; i < maxPag; i++) {
                            //Si la página es igual a la página actual, muestra la etiqueta active.
                                if(i+1==pag){
                        %>
                            <li class="active"><span><%=i+1%></span></li>
                        <%  }//Si no, sigue mostrando las etiquetas normales con la opción para desplazarse.
                            else{%>
                                <li><a href="blog.jsp?pg=<%=i+1%>"><%=i+1%></a></li>
                        <%}}
                        //Sí pagina es diferente al número máximo de páginas, muestra la opción siguiente.
                        if(pag!=maxPag){%>
                            <li><a href="blog.jsp?pg=<%=pag + 1%>">&gt;</a></li>
                <%}}//Si el máximo de páginas no es mayor a 1, muestra solo una página 
                    else {%>
                        <li class="active"><span>1</span></li>
                <%}
                %>

</body>
</html>