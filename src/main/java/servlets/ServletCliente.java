package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.ListIterator;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/*import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
*/

import entidad.Cliente;
import entidad.Localidad;
import entidad.Pais;
import entidad.Provincia;
import negocio.ClienteNegocio;
import negocio.LocalidadNegocio;
import negocio.PaisNegocio;
import negocio.UsuarioNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.LocalidadNegocioImpl;
import negocioImpl.PaisNegocioImpl;
import negocioImpl.UsuarioNegocioImpl;


/**
 * Servlet implementation class ServletCliente
 */
@WebServlet("/ServletCliente")
public class ServletCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ServletCliente() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("getTxtDni") != null) {
			cargarDesplegablesAlta(request, response);
		}
		
		if (request.getParameter("btnAltaCliente") != null) {
			registrarCliente(request, response);
		}
		
		if (request.getParameter("getId") != null || request.getParameter("btnFiltrar") != null || request.getParameter("btnLimpiar") != null ) {
			cargarClientes(request, response);

		}
		
		if (request.getParameter("btnModificar") != null) {
			cargarClienteParaModif(request, response);
		}
		
		if (request.getParameter("btnModificarBD") != null) {
			modificarCliente(request, response);
		}		
		
		if (request.getParameter("btnEliminar") != null) {
			cargarClienteBaja(request, response);
		}
		
		if (request.getParameter("btnBajaUsuario") != null) {
			eliminarCliente(request, response);
		}
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
	
	
	private void cargarDesplegablesAlta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PaisNegocio p = new PaisNegocioImpl(); 
		ArrayList<Pais> lPais = (ArrayList<Pais>) p.readAll();
		request.setAttribute("nacionalidad", lPais);
		
		LocalidadNegocio l = new LocalidadNegocioImpl(); 
		ArrayList<Localidad> lLoc = (ArrayList<Localidad>) l.readAll();
		request.setAttribute("localidad", lLoc);
			
		RequestDispatcher rd = request.getRequestDispatcher("/altaCliente.jsp");
		rd.forward(request, response);
		
	}
	
	private void cargarDesplegablesModif(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PaisNegocio p = new PaisNegocioImpl(); 
		ArrayList<Pais> lPais = (ArrayList<Pais>) p.readAll();
		request.setAttribute("nacionalidad", lPais);
		
		LocalidadNegocio l = new LocalidadNegocioImpl(); 
		ArrayList<Localidad> lLoc = (ArrayList<Localidad>) l.readAll();
		request.setAttribute("localidad", lLoc);
			
		RequestDispatcher rd = request.getRequestDispatcher("/modifClienteForm.jsp");
		rd.forward(request, response);
		
	}
	
	private void cargarClientes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		ClienteNegocio cliente = new ClienteNegocioImpl(); 
		ArrayList<Cliente> lCliente = (ArrayList<Cliente>) cliente.readAll();
		request.setAttribute("clientes", lCliente);
				
		if (request.getParameter("btnFiltrar") != null) {
	        
	        String clienteSeleccionado = request.getParameter("clienteSeleccionado");			
			ListIterator<Cliente> it = lCliente.listIterator();
			while (it.hasNext()) {
				Cliente cl = it.next();
				if(!cl.getDni().equals(clienteSeleccionado)) {
					it.remove();
				}
				request.setAttribute("listaFiltrada", lCliente);
			}
		}

			RequestDispatcher rd = request.getRequestDispatcher("/modifCliente.jsp");
			rd.forward(request, response);
	}
	
	private void cargarClienteParaModif(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		ClienteNegocio clienteNeg = new ClienteNegocioImpl(); 
	    String clienteSeleccionado = request.getParameter("dni");	
		Cliente cl = clienteNeg.readOne(clienteSeleccionado);					        
	    
		request.setAttribute("cliente", cl);
		request.setAttribute("dni", clienteSeleccionado);
		RequestDispatcher rd = request.getRequestDispatcher("/modifClienteForm.jsp");
		
		cargarDesplegablesModif(request, response);
		
		rd.forward(request, response);
	}
	
	private void cargarClienteBaja(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		ClienteNegocio clienteNeg = new ClienteNegocioImpl(); 
	    String clienteSeleccionado = request.getParameter("dni");	
		Cliente cl = clienteNeg.readOne(clienteSeleccionado);	
		
		String clienteBaja = "";
		clienteBaja+="Cliente: "+cl.getApellido()+", "+cl.getNombre()+"<br><br>DNI: "+cl.getDni()+ " - CUIL: "+ cl.getCuil()+"<br><br>Sexo: "+cl.getSexo();
		clienteBaja+="<br><br>Fecha de Nacimiento: "+cl.getFecha_nac()+"<br><br>Domicilio: "+cl.getDireccion()+", "+cl.getLocalidad().getLocalidad()+", "+cl.getLocalidad().getProvincia().getProvincia()+", "+cl.getLocalidad().getPais().getPais();
		clienteBaja+="<br><br>Email: "+cl.getCorreo_electronico();
		request.setAttribute("clienteBaja", clienteBaja);
		
	    
		request.setAttribute("cliente", cl);
		request.setAttribute("dni", cl.getDni());
		RequestDispatcher rd = request.getRequestDispatcher("/confirmaBajaUsuario.jsp");
		
		
		rd.forward(request, response);
	}
	
	
	private void registrarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		RequestDispatcher rd;
		boolean agregado = false;
		String dni = request.getParameter("txtDNI");
		String nombre = request.getParameter("txtNombre");
		String apellido = request.getParameter("txtApellido");
		String cuil = request.getParameter("txtCuil");
		String sexo = request.getParameter("sexo");
		int nac = Integer.parseInt(request.getParameter("nacionalidad"));
		String direccion = request.getParameter("txtDireccion");
		int loc = Integer.parseInt(request.getParameter("localidad"));
		String email = request.getParameter("txtEmail");
		
		
		LocalidadNegocio locDao = new LocalidadNegocioImpl();
		Localidad localidad = locDao.readOne(loc);	
        System.out.println(localidad); 

		Provincia provincia = new Provincia();		
		provincia.setCodProvincia(localidad.getProvincia().getCodProvincia());
		Pais pais = new Pais();
		pais.setCodPais(localidad.getPais().getCodPais());
		Pais nacionalidad = new Pais();
		nacionalidad.setCodPais(nac);
		
		try {
			//En la fecha, para pasarlo de String a Date (sql), primero hay que pasarlo a Date (java) con el formato deseado,
			//luego se pasa a Date sql. Estas dos líneas hacen el parseo a date java:
	        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date fecha = formato.parse(request.getParameter("txtFecha_nac"));
			java.sql.Date fNac = new java.sql.Date(fecha.getTime());  // acá se hace el parseo a Date sql
	        
	        Cliente cliente = new Cliente(dni, nombre, apellido, cuil, sexo, nacionalidad, fNac, direccion, localidad, provincia, pais, email, true);
			ClienteNegocio clienteNeg = new ClienteNegocioImpl(); 
			agregado = clienteNeg.insert(cliente);
			if (agregado) {
		        System.out.println(cliente); 
				request.setAttribute("agregado", agregado);
			
				String resultado="";
				resultado+="Cliente: "+apellido+", "+nombre+"<br><br>DNI: "+dni+ " - CUIL: "+ cuil+"<br><br>Sexo: "+sexo;
				resultado+="<br><br>Fecha de Nacimiento: "+fNac+"<br><br>Domicilio: "+direccion+", "+localidad.getLocalidad()+", "+localidad.getProvincia().getProvincia()+", "+localidad.getPais().getPais();
				resultado+="<br><br>Email: "+email;
				request.setAttribute("resultado", resultado);
				
				request.setAttribute("dni", dni);

				rd = request.getRequestDispatcher("/altaCliente.jsp");
				rd.forward(request, response);
			} 
		} catch (Exception e) {
				e.printStackTrace();
		}  
	}
	
	
	private void modificarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd;
		boolean modificado = false;
		String dni = request.getParameter("txtDNI");
		String nombre = request.getParameter("txtNombre");
		String apellido = request.getParameter("txtApellido");
		String cuil = request.getParameter("txtCuil");
		String sexo = request.getParameter("sexo");
		int nac = Integer.parseInt(request.getParameter("nacionalidad"));
		String direccion = request.getParameter("txtDireccion");
		int loc = Integer.parseInt(request.getParameter("localidad"));
		String email = request.getParameter("txtEmail");
		
		
		LocalidadNegocio locDao = new LocalidadNegocioImpl();
		Localidad localidad = locDao.readOne(loc);			
		Provincia provincia = new Provincia();		
		provincia.setCodProvincia(localidad.getProvincia().getCodProvincia());
		Pais pais = new Pais();
		pais.setCodPais(localidad.getPais().getCodPais());
		Pais nacionalidad = new Pais();
		nacionalidad.setCodPais(nac);
		
		try {
	        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date fecha = formato.parse(request.getParameter("txtFecha_nac"));
			java.sql.Date fNac = new java.sql.Date(fecha.getTime());  
	        
	        Cliente cliente = new Cliente(dni, nombre, apellido, cuil, sexo, nacionalidad, fNac, direccion, localidad, provincia, pais, email, true);
			ClienteNegocio clienteDao = new ClienteNegocioImpl(); 
			modificado = clienteDao.update(cliente);
			if (modificado) {
		        System.out.println(cliente); 
				request.setAttribute("modificado", modificado);
			
			
				String resultado="";
				resultado+="Cliente: "+apellido+", "+nombre+"<br><br>DNI: "+dni+ " - CUIL: "+ cuil+"<br><br>Sexo: "+sexo;
				resultado+="<br><br>Fecha de Nacimiento: "+ fNac;
				resultado+="<br><br>Domicilio: "+direccion+", "+localidad.getLocalidad()+", "+localidad.getProvincia().getProvincia()+", "+localidad.getPais().getPais();
				resultado+="<br><br>Email: "+email;
				request.setAttribute("resultado", resultado);

				request.setAttribute("dni", dni);

				rd = request.getRequestDispatcher("/modifClienteForm.jsp");
				rd.forward(request, response);
			} 
		} catch (Exception e) {
				e.printStackTrace();
		}  
	}
	
	
	private void eliminarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd;
		boolean eliminado = false;
		String dni = request.getParameter("dni");
				
		try {
	        Cliente cliente = new Cliente();
	        cliente.setDni(dni);
			ClienteNegocio clienteNeg = new ClienteNegocioImpl(); 
	        eliminado = clienteNeg.logicalDeletion(cliente);
	        
	        UsuarioNegocio usNeg = new UsuarioNegocioImpl();
	        Boolean eliminadoUs = usNeg.logicalDeletion(dni);
	        
			if (eliminado) {
		        System.out.println("cliente eliminado"); 
				request.setAttribute("eliminado", eliminado);
			
				//rd = request.getRequestDispatcher("/ServletCliente?getId");
				rd = request.getRequestDispatcher("/confirmaBajaUsuario.jsp");
				rd.forward(request, response);
			} 
		} catch (Exception e) {
				e.printStackTrace();
		}  
	}
	
	
}
