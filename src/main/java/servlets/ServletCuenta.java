package servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;

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


import entidad.Cuenta;
import excepciones.SaldoCuenta;
import negocio.CuentaNegocio;
import negocio.TipoCuentaNegocio;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.TipoCuentaImpl;

/**
 * Servlet implementation class ServletCliente
 */
@WebServlet("/ServletCuenta")
public class ServletCuenta extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CuentaNegocio neg = new CuentaNegocioImpl();


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
			cargarBusquedaDeCuentas(request, response,0);
		}
		if (request.getParameter("btnBuscarBaja") != null) {
			cargarBusquedaDeCuentas(request, response,1);
		}

		if (request.getParameter("btnAgregar") != null) {
			registrarCuenta(request, response);
		}
		if (request.getParameter("btnBaja") != null) {
			BajaCurrentCuenta(request, response);
		}	
		
		if (request.getParameter("btnSeleccionar")!=null) {
			setearCurrentCuenta(request,response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}


	private void cargarBusquedaDeCuentas(HttpServletRequest request, HttpServletResponse response, int i) throws ServletException, IOException {
	
		
		CuentaNegocio neg = new CuentaNegocioImpl();
		TipoCuentaNegocio negTC = new TipoCuentaImpl();
		////String dni = request.getParameter("txtdni");
		String resString = null;
		Boolean resBoolean = false;
		String dni = request.getParameter("txtdni").toString().trim();
		ArrayList<Cuenta> lCuenta = (ArrayList<Cuenta>) neg.readForClient(dni);
		RequestDispatcher rd;
		if(neg.verificarCliente(dni))
		{
			if(lCuenta == null)
			{
				resString="El cliente no tiene cuentas asociadas";
				resBoolean =false;
			}
			if(lCuenta.isEmpty())
			{
				resString="El cliente no tiene cuentas asociadas";
				resBoolean=true;
			}
			else
			{
				resString="go";
				resBoolean =true;			
			}
		}
		else
		{
			resString="El cliente no existe";
			resBoolean =false;
		}
			
		request.setAttribute("Cuentas", lCuenta);
		request.setAttribute("dni", dni);
		request.setAttribute("resString", resString);
		request.setAttribute("resBoolean", resBoolean);
		request.setAttribute("listaTC", negTC.readAll());
		
	switch(i)
	{
	case 0:
		 rd = request.getRequestDispatcher("/adminAltaCuenta.jsp");
		 break;
	case 1:
		 rd = request.getRequestDispatcher("/adminBajaCuenta.jsp");
		 break;
	default:
		 rd = request.getRequestDispatcher("/index.jsp");
		 break;
	}
		
		rd.forward(request, response);
	}

	private void registrarCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd;
		
		int tc = Integer.parseInt(request.getParameter("TC"));
		String dni = request.getParameter("dni");
		CuentaNegocio neg = new CuentaNegocioImpl();
		boolean agregado = false;
		String resString="";
		
		if(neg.verificarCliente(dni))
		{
			if(!neg.verificarMaxCuentas(dni))
			{
			 agregado = neg.insert(dni,tc);

				if (agregado) {

					resString="Cuenta agregada Satisfactoriamente";
				}
				else
				{
					resString="Cuenta no pudo ser agregada satisfactoriamente";
				}
			}
			else
				resString="El cliente con DNI: "+dni+" tiene mas de 3 cuentas a su nombre";
		}
		else
			resString="El cliente no existe";
			
			request.setAttribute("resString", resString);
			request.setAttribute("resBoolean", agregado);
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
	
	private void validarSaldo( int nroCuenta ) throws SaldoCuenta {
		
		Cuenta cuenta = neg.readOne(nroCuenta);	

		if ( cuenta.getSaldo().compareTo(BigDecimal.ZERO) > 0) {

			throw new SaldoCuenta();
		} 
	}

	private void BajaCurrentCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd;
		boolean borrado = false;
		String resString = "";
		
		try {
			int nroCuenta = Integer.parseInt(request.getParameter("cuenta"));
			validarSaldo(nroCuenta);
			
			borrado = neg.delete(neg.readOne(nroCuenta));
			if (borrado) 
				resString="Cuenta dada de baja Satisfactoriamente";
			else
				resString="Cuenta "+neg.readOne(nroCuenta).getNroCuenta()+" no pudo ser dada de baja satisfactoriamente";
		} catch(SaldoCuenta ex) {
			resString = "La cuenta debe estar en cero para poder darse de baja";
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
				
		request.setAttribute("resString", resString);
		request.setAttribute("resBoolean", borrado);
		rd = request.getRequestDispatcher("/adminBajaCuenta.jsp");
		rd.forward(request, response);
	}

}
		
