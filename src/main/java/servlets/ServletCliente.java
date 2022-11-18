package servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.ListIterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
*/

import entidad.Cliente;
import entidad.Cuenta;
import entidad.Localidad;
import entidad.Pais;
import entidad.Provincia;
import excepciones.DniRepetido;
import excepciones.SaldoCuenta;
import negocio.ClienteNegocio;
import negocio.CuentaNegocio;
import negocio.LocalidadNegocio;
import negocio.PaisNegocio;
import negocio.UsuarioNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.LocalidadNegocioImpl;
import negocioImpl.PaisNegocioImpl;
import negocioImpl.UsuarioNegocioImpl;


/**
 * Servlet implementation class ServletCliente
 */
@WebServlet("/ServletCliente")
public class ServletCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ClienteNegocio clienteNeg = new ClienteNegocioImpl(); 
	PaisNegocio pNeg = new PaisNegocioImpl(); 
	LocalidadNegocio lNeg = new LocalidadNegocioImpl(); 
	CuentaNegocio neg = new CuentaNegocioImpl();




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
		
		if (request.getParameter("pag") != null || request.getParameter("btnFiltrar") != null || request.getParameter("btnLimpiar") != null ) {
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
		ArrayList<Pais> lPais = new ArrayList<Pais> ();
		ArrayList<Localidad> lLoc = new ArrayList<Localidad>();	
		
		try {
			lPais = (ArrayList<Pais>) pNeg.readAll();		
			lLoc = (ArrayList<Localidad>) lNeg.readAll();			
			
		}  catch (Exception e) {
			e.printStackTrace();
		} 
		
		
		request.setAttribute("localidad", lLoc);
		request.setAttribute("nacionalidad", lPais);

			
		RequestDispatcher rd = request.getRequestDispatcher("/altaCliente.jsp");
		rd.forward(request, response);
		
	}
	
	private void cargarDesplegablesModif(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Pais> lPais = new ArrayList<Pais> ();
		ArrayList<Localidad> lLoc = new ArrayList<Localidad>();	
		
		try {
				lPais = (ArrayList<Pais>) pNeg.readAll();		
				lLoc = (ArrayList<Localidad>) lNeg.readAll();			
			
		}  catch (Exception e) {
			e.printStackTrace();
		} 
		
		
		request.setAttribute("localidad", lLoc);
		request.setAttribute("nacionalidad", lPais);
		
	}
	
	private void cargarClientes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		ArrayList<Cliente> lCliente = (ArrayList<Cliente>) clienteNeg.readAll();
		request.setAttribute("clientes", lCliente);
				
		if (request.getParameter("btnFiltrar") != null) {
	        
	        String clienteSeleccionado = request.getParameter("clienteSeleccionado");			
			ListIterator<Cliente> it = lCliente.listIterator();
			while (it.hasNext()) {
				Cliente cl = it.next();
				if(!cl.getDni().equals(clienteSeleccionado)) {
					it.remove();
				}
				request.setAttribute("clientesPaginados", lCliente);
			}
		} else {
			
			//PAGINADO
			int cantTotal = (int) clienteNeg.countActive();  //Cantidad de registros activos en la BD

			int pag = 1;
			if(request.getParameter("pag") != null) {
				pag = Integer.parseInt(request.getParameter("pag"));	
			}
			
			int limit = 10;                      //Elementos por página.		
			int offset = 0;
			if(pag > 1) offset = limit * (pag - 1);	 //inicio paginado   	
			int cantPag = (cantTotal / limit) + 1 ; // Cantidad de páginas.	
			int resto = offset + limit;
			int index = 0;

			ArrayList<Cliente> lClientePag = (ArrayList<Cliente>) clienteNeg.readAll();
	        System.out.println(lClientePag); 
			ListIterator<Cliente> itLista = lClientePag.listIterator();
			while (itLista.hasNext()) {
				Cliente cli = itLista.next();
				index += 1;
				if(index < offset + 1 || index > resto ) {
					itLista.remove();
				}
			}
				
			request.setAttribute("clientesPaginados", lClientePag);
			request.setAttribute("pag", pag);
			request.setAttribute("cantPag", cantPag);	
				
		}	


		RequestDispatcher rd = request.getRequestDispatcher("/modifCliente.jsp");
		rd.forward(request, response);
	}
	
	private void cargarClienteParaModif(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
	    String clienteSeleccionado = request.getParameter("dni");	
		Cliente cl = clienteNeg.readOne(clienteSeleccionado);					        
	    
		request.setAttribute("cliente", cl);
		request.setAttribute("dni", clienteSeleccionado);
		RequestDispatcher rd = request.getRequestDispatcher("/modifClienteForm.jsp");
		
		cargarDesplegablesModif(request, response);
		
		rd.forward(request, response);
	}
	
	private void cargarClienteBaja(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
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
	
	private void validarDNI( String dni ) throws DniRepetido {
		
		Cliente cl = clienteNeg.readOne(dni);	

		if (cl.getDni() != null) {

			throw new DniRepetido();
		} 
	}
	
	private Boolean validaEstado( String dni ) {
		boolean estado = true;

		Cliente cl = clienteNeg.readOne(dni);	
		
		if (cl != null && cl.isEstado() == false) {
				estado = false;
			} 
			
		return estado;
	}
	
	private void registrarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		RequestDispatcher rd;
		boolean agregado = false;
		Boolean existe = false;
		Boolean estado = true;
		String mensaje = "";
		String dni = request.getParameter("txtDNI");
		String nombre = request.getParameter("txtNombre");
		String apellido = request.getParameter("txtApellido");
		String cuil = request.getParameter("txtCuil");
		String sexo = request.getParameter("sexo");
		int nac = Integer.parseInt(request.getParameter("nacionalidad"));
		String direccion = request.getParameter("txtDireccion");
		int loc = Integer.parseInt(request.getParameter("localidad"));
		String email = request.getParameter("txtEmail");
		String tel = request.getParameter("txtTelefonos");
        System.out.println(tel); 

		
		LocalidadNegocio locDao = new LocalidadNegocioImpl();
		Localidad localidad = locDao.readOne(loc);	
        //System.out.println(localidad); 

		Provincia provincia = new Provincia();		
		provincia.setCodProvincia(localidad.getProvincia().getCodProvincia());
		Pais pais = new Pais();
		pais.setCodPais(localidad.getPais().getCodPais());
		Pais nacionalidad = new Pais();
		nacionalidad.setCodPais(nac);
		
		try {
			
			validarDNI(dni);

			//En la fecha, para pasarlo de String a Date (sql), primero hay que pasarlo a Date (java) con el formato deseado,
			//luego se pasa a Date sql. Estas dos líneas hacen el parseo a date java:
	        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date fecha = formato.parse(request.getParameter("txtFecha_nac"));
			java.sql.Date fNac = new java.sql.Date(fecha.getTime());  // acá se hace el parseo a Date sql
	        
	        Cliente cliente = new Cliente(dni, nombre, apellido, cuil, sexo, nacionalidad, fNac, direccion, localidad, provincia, pais, email, tel, true);
			agregado = clienteNeg.insert(cliente);
			if (agregado) {
				request.setAttribute("agregado", agregado);
			
				String resultado="";
				resultado+="Cliente: "+apellido+", "+nombre+"<br><br>DNI: "+dni+ " - CUIL: "+ cuil+"<br><br>Sexo: "+sexo;
				resultado+="<br><br>Fecha de Nacimiento: "+fNac+"<br><br>Domicilio: "+direccion+", "+localidad.getLocalidad()+", "+localidad.getProvincia().getProvincia()+", "+localidad.getPais().getPais();
				resultado+="<br><br>Email: "+email+ " - Telefonos: "+ tel;
				request.setAttribute("resultado", resultado);
				mensaje = "Cliente agregado con éxito";
				
				request.setAttribute("dni", dni);

			} 
		} catch (DniRepetido ex) {
				existe = true;
				estado = validaEstado(dni);
		        System.out.println(1); 
				if (existe && estado) {
					mensaje = "Ya existe un usuario activo en el banco con ese DNI";
				} else if (!estado) {
			        System.out.println(2); 
					mensaje = "Ya existe un registro dado de baja con ese DNI. Comuniquese con el Dpto de sistemas para reactivarlo";
				}
				
				
		} catch (Exception e) {
				e.printStackTrace();
		} 

		request.setAttribute("existe", existe);
		request.setAttribute("mensaje", mensaje);

		rd = request.getRequestDispatcher("/altaCliente.jsp");
		rd.forward(request, response);
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
		String tel = request.getParameter("txtTelefonos");
        System.out.println(tel); 
		
		
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
	        
	        Cliente cliente = new Cliente(dni, nombre, apellido, cuil, sexo, nacionalidad, fNac, direccion, localidad, provincia, pais, email, tel, true);
	        System.out.println(cliente); 
	        modificado = clienteNeg.update(cliente);
			if (modificado) {
//		        System.out.println(cliente); 
				request.setAttribute("modificado", modificado);
			
			
				String resultado="";
				resultado+="Cliente: "+apellido+", "+nombre+"<br><br>DNI: "+dni+ " - CUIL: "+ cuil+"<br><br>Sexo: "+sexo;
				resultado+="<br><br>Fecha de Nacimiento: "+ fNac;
				resultado+="<br><br>Domicilio: "+direccion+", "+localidad.getLocalidad()+", "+localidad.getProvincia().getProvincia()+", "+localidad.getPais().getPais();
				resultado+="<br><br>Email: "+email+ " - Telefonos: "+ tel;
				request.setAttribute("resultado", resultado);

				request.setAttribute("dni", dni);

				rd = request.getRequestDispatcher("/modifClienteForm.jsp");
				rd.forward(request, response);
			} 
		} catch (Exception e) {
				e.printStackTrace();
		}  
	}
	
	private void validarSaldo( int nroCuenta ) throws SaldoCuenta {
		
		Cuenta cuenta = neg.readOne(nroCuenta);	
		

		if ( cuenta.getSaldo().compareTo(BigDecimal.ZERO) > 0 && cuenta.isEstado() == true) {
			

			System.out.println(cuenta.getSaldo().compareTo(BigDecimal.ZERO)); 

			throw new SaldoCuenta();
		} 
	}
	
	private void eliminarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd;
		boolean eliminado = false;
		boolean conSaldo = false;
		String mensaje = " ";
		
		try {
			String dni = request.getParameter("dni");
			ArrayList<Cuenta> lCuentas = (ArrayList<Cuenta>) neg.readForClient(dni);
			
			if (lCuentas != null ) {
				for(Cuenta cta : lCuentas) {
					validarSaldo(cta.getNroCuenta());
				}
			}
			
	        Cliente cliente = new Cliente();
	        cliente.setDni(dni);
	        eliminado = clienteNeg.logicalDeletion(cliente);
	        
	        UsuarioNegocio usNeg = new UsuarioNegocioImpl();
	        Boolean eliminadoUs = usNeg.logicalDeletion(dni);
	        
			 
		} catch(SaldoCuenta ex) {
			mensaje = "El usuario tiene cuentas con saldo. Las cuentas deben estar dadas de baja para eliminar el usuario.";
			conSaldo = true;

		} catch (Exception e) {
				e.printStackTrace();
		}
		
		if (eliminado) {
	        System.out.println("cliente eliminado"); 
	        mensaje = "Cliente eliminado con éxito";
		}
		
		request.setAttribute("eliminado", eliminado);				
		request.setAttribute("mensaje", mensaje);		
		request.setAttribute("conSaldo", conSaldo);		
		rd = request.getRequestDispatcher("/confirmaBajaUsuario.jsp");
		rd.forward(request, response);
	}
	
	
}
