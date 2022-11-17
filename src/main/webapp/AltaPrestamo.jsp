<%@page import="java.util.ArrayList"%>
<%@page import="entidad.PrestamoxAutorizar" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@page import="entidad.Usuario" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<style type="text/css">
	<jsp:include page="css/style.css"></jsp:include>
</style>
<title>Administrar Prestamos - Admin</title>
</head>
<body>
<% 
	ArrayList<PrestamoxAutorizar> listaPrestamos= null;
	String resString=null;
	Boolean resBoolean=false;
	if(request.getAttribute("Prestamos")!=null)
	{
		listaPrestamos = (ArrayList<PrestamoxAutorizar>) request.getAttribute("Prestamos");
	}
	if(request.getAttribute("resString")!=null)
	{
		resString =  request.getAttribute("resString").toString();
	}
	if(request.getAttribute("resBoolean")!=null)
	{
		resBoolean =  Boolean.parseBoolean( request.getAttribute("resBoolean").toString());
	}

	Usuario usuario = new Usuario();
 	if(session.getAttribute("Usuario")!=null){	
 		usuario = (Usuario)session.getAttribute("Usuario");
 	}
 	//Para paginado:
 		int pag = 0;
 		int cantPag = 0;
 	    //Al momento de dar siguiente o presionar otro botón, manda como parametro "pag" con el número de página.
 	    if (request.getAttribute("pag") != null) {
 	        pag = (int) request.getAttribute("pag");
 	        cantPag = (int) request.getAttribute("cantPag");
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

<div class="menu">
<a style="margin-top: 0.5rem;" class="volver" href="inicioAdmin.jsp"> <span class="volverIcon fa fa-home"></span> Volver</a>
<h2>Autorización Prestamos</h2>
<%
		if(!resBoolean && resString!= null){%>
	<br>
	 <h2 style="color:red;"><%=resString%></h2>
	<%}
	else
	{ 
		if(resString!= null)
		{
			if( !resString.equals("go")){
	%>
		
		<br>
	 <h2 style="color:green;"><%=resString%></h2>
		
	<%}}
		}

	%>
<script>
		<%
		 	if(resString!= null && resBoolean){	
		 		if(!resString.equals("go"))
		 		{
		 			%>
					function resultado(){alert("<%=resString%>");}
				<%}}
		 	%>
	</script>
<%if(listaPrestamos!=null && resBoolean){ %>

 <table >
			<caption>Prestamos disponibles para aprobacion</caption>
		   
		<tr>
			<th>Codigo de prestamo pendiente</th>
		    <th>Numero de cuenta</th>
		    <th>importe pedido</th>
		    <th>Cantidad de cuotas</th>
		    <th>Fecha Creación</th>
		    <th>estado</th>
		    <th colspan="2">Autorizacion</th>
		</tr>
<%

		for(PrestamoxAutorizar p:listaPrestamos)
		{%>
		
		<tr>
		 <form method="get" action="ServletPrestamosxAutorizar">
			<td><%=p.getCodPrestamoPendiente() %></td>
			<td><%=p.getNroCuenta() %></td>
			<td><%=p.getImporte() %></td>
			<td><%=p.getCantidad_cuotas()%></td>
			<td><%=p.getFecha_creacion() %></td>
			<%
			switch(p.getEstado())
			{
			case 0:%>
				<td>Desaprobado</td>
				<%break;
			case 1:%>
				<td>Pendiente de aprobacion</td>
			<%break;
			case 2:%>
			<td>Aprobado</td>
		<%break;
			 default: %>
				<td>Error</td>
			<%break;
			}%>
			
		
			<td><input type="submit" value="Aprobar" name="btnAutorizar"></td>
			<td><input type="submit" value="Rechazar" name="btnRechazar"></td>
			<input type="hidden" name="codPrestamo" value="<%=p.getCodPrestamoPendiente()%>">

		</form>
	</tr>
		<%}%>
		 </table>

<%}
		else
		{%>
			<br>
			 <h3 style="color:red;"> <No disponible></h3>
		<%}%>
		
		
		<!---Empieza PAginado---->
<div class="paginado">
		 <%	if (cantPag >= 1) {
            //Si la página diferente a uno, si agrega el botón anterior.
               if(pag!=1){%>
                   <a href="ServletPrestamosxAutorizar?pag=<%=pag - 1%>">&lt;</a>
                      <%  }  //Calcula la cant de páginas a mostrar.
                            for (int i = 0; i < cantPag; i++) {
                         
                                if(i+1==pag){  //Si la página es igual a la página actual, muestra la etiqueta active.
                        %>
                            <span><%=i+1%></span>
                      
                      <%  } else { //Si no, sigue mostrando las etiquetas normales con la opción para desplazarse. %>
                             <a href="ServletPrestamosxAutorizar?pag=<%=i+1%>"><%=i+1%></a>
                        <%} }
                        //Sí pagina es diferente al número máximo de páginas, muestra la opción siguiente.
                        if(pag!=cantPag){%>
                            <a href="ServletPrestamosxAutorizar?pag=<%=pag + 1%>">&gt;</a>
                <%} }  else { //Si el máximo de páginas no es mayor a 1, muestra solo una página %>
                   			<span>1</span>
                <% }  %>						
	</div>
	
	<!---Termina PAginado---->
		 </div					>	
</body>
</html>