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
import dao.CuentaDao;
import dao.LocalidadDao;
import dao.PaisDao;
import dao.TipoCuentaDao;
import daoImpl.ClienteDaoImpl;
import daoImpl.CuentaDaoImpl;
import daoImpl.LocalidadDaoImpl;
import daoImpl.PaisDaoImpl;
import daoImpl.TipoCuentaDaoImpl;
import entidad.Cliente;
import entidad.Cuenta;
import entidad.Localidad;
import entidad.Pais;
import entidad.Provincia;
import negocio.CuentaNegocio;

/**
 * Servlet implementation class ServletCliente
 */
@WebServlet("/ServletCuenta")
public class ServletCuenta extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ServletCuenta() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("btnBuscar") != null) {
			cargarDesplegables(request, response);
		}
		
		
		if (request.getParameter("btnAgregar") != null) {
			registrarCuenta(request, response);
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
		CuentaDao p = new CuentaDaoImpl();
		////String dni = request.getParameter("txtdni");
		String dni = request.getParameter("txtdni");
		ArrayList<Cuenta> lCuenta = (ArrayList<Cuenta>) p.readForClient(dni);
		request.setAttribute("Cuentas", lCuenta);
		request.setAttribute("dni", dni);
		RequestDispatcher rd = request.getRequestDispatcher("/adminAltaCuenta.jsp");
		rd.forward(request, response);
	}
	
	private void registrarCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		RequestDispatcher rd;
		boolean agregado = false;
		int tc = Integer.parseInt(request.getParameter("TC"));
		String dni = request.getParameter("dni");
		CuentaNegocio neg = new CuentaNegocio();
		String resultado="";
		 agregado = neg.insert(dni,tc);
			
			if (agregado) {
				
				resultado="Cuenta agregada Satisfactoriamente";
				
			}
			else
			{
				resultado="Cuenta no pudo ser agregada satisfactoriamente";
			}
			request.setAttribute("resultado", resultado);
			rd = request.getRequestDispatcher("/altaCliente.jsp");
			rd.forward(request, response);
	}
}
	       
	
		
	
	
	

