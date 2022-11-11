package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClienteDao;
import dao.LocalidadDao;
import dao.PaisDao;
import daoImpl.ClienteDaoImpl;
import daoImpl.LocalidadDaoImpl;
import daoImpl.PaisDaoImpl;
import entidad.Cliente;
import entidad.Localidad;
import entidad.Pais;
import entidad.Provincia;

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
			cargarDesplegables(request, response);
		}
		
		if (request.getParameter("btnAltaCliente") != null) {
				registrarCliente(request, response);
		}
		
		if (request.getParameter("getId") != null) {
			cargarClientes(request, response);
		}		
		
		if (request.getParameter("clienteSeleccionado") != null && request.getParameter("btnFiltrar") != null) {
				ClienteDao cliente = new ClienteDaoImpl(); 
				ArrayList<Cliente> lCliente = (ArrayList<Cliente>) cliente.readAll();
				lCliente.stream()
	         	.filter(c -> c.getDni().equals(request.getAttribute("clienteSeleccionado")));
				request.setAttribute("clienteFiltrado", lCliente);
		        
				RequestDispatcher rd = request.getRequestDispatcher("/modifCliente.jsp");
				rd.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
	
	
	private void cargarDesplegables(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PaisDao p = new PaisDaoImpl(); 
		ArrayList<Pais> lPais = (ArrayList<Pais>) p.readAll();
		request.setAttribute("nacionalidad", lPais);
		
		LocalidadDao l = new LocalidadDaoImpl(); 
		ArrayList<Localidad> lLoc = (ArrayList<Localidad>) l.readAll();
		request.setAttribute("localidad", lLoc);
		
		RequestDispatcher rd = request.getRequestDispatcher("/altaCliente.jsp");
		rd.forward(request, response);
	}
	
	private void cargarClientes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClienteDao cliente = new ClienteDaoImpl(); 
		ArrayList<Cliente> lCliente = (ArrayList<Cliente>) cliente.readAll();
		request.setAttribute("clientes", lCliente);
				
		RequestDispatcher rd = request.getRequestDispatcher("/modifCliente.jsp");
		rd.forward(request, response);
	}
	
/*	private void filtrarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClienteDao clienteDao = new ClienteDaoImpl(); 
		Cliente cliente = (Cliente) clienteDao.readOne(request.getParameter("getDni"));
		ArrayList<Cliente> lClienteFiltrado = 
		//listaClientes
		//request.setAttribute("clientes", lCliente);
				
		RequestDispatcher rd = request.getRequestDispatcher("/modifCliente.jsp");
		rd.forward(request, response);
	}*/
	
	
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
		
		
		LocalidadDao locDao = new LocalidadDaoImpl();
		Localidad localidad = locDao.readOne(loc);			
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
			ClienteDao clienteDao = new ClienteDaoImpl();
			agregado = clienteDao.insert(cliente);
			if (agregado) {
		        System.out.println(cliente); 
				request.setAttribute("agregado", agregado);
			
				String resultado="";
				resultado+="Cliente: "+apellido+", "+nombre+"<br><br>DNI: "+dni+ " - CUIL: "+ cuil+"<br><br>Sexo: "+sexo;
				resultado+="<br><br>Fecha de Nacimiento: "+fNac+"<br><br>Domicilio: "+direccion+", "+localidad.getLocalidad()+"<br><br>Email: "+email;
				request.setAttribute("resultado", resultado);

				rd = request.getRequestDispatcher("/altaCliente.jsp");
				rd.forward(request, response);
			} 
		} catch (Exception e) {
				e.printStackTrace();
		}  
	}
	
	
}
