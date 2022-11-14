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

import dao.CuentaDao;
import daoImpl.CuentaDaoImpl;
import entidad.Cuenta;
import negocio.CuentaNegocio;
import negocioImpl.CuentaNegocioImpl;

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
		
		
		if (request.getParameter("btnSeleccionar") != null) {
			setearCurrentCuenta(request, response);
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
		CuentaNegocio neg = new CuentaNegocioImpl();
		String resultado="";
		if(neg.verificarCliente(dni))
			if(!neg.verificarMaxCuentas(dni))
			{
			 agregado = neg.insert(dni,tc);

				if (agregado) {

					resultado="Cuenta agregada Satisfactoriamente";
				}
				else
				{
					resultado="Cuenta no pudo ser agregada satisfactoriamente";
				}
			}
			else
				resultado="El cliente  tiene mas de 3 cuentas a su nombre";
		else
			resultado="El cliente no existe";
			
			request.setAttribute("resultado", resultado);
			rd = request.getRequestDispatcher("/adminAltaCuenta.jsp");
			rd.forward(request, response);
		}
			
	
	private void setearCurrentCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		RequestDispatcher rd;
		int nroCuenta = Integer.parseInt(request.getParameter("cuentaSeleccionada"));
		request.getSession().setAttribute("cuentaSeleccionada", nroCuenta);
		rd = request.getRequestDispatcher("/gestionarCuentas.jsp");
		rd.forward(request, response);
	
	}


}
		
