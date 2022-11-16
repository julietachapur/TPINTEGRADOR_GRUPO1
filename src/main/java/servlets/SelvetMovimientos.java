package servlets;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import entidad.Cliente;
import entidad.Cuenta;
import entidad.Movimiento;
import entidad.Pais;
import entidad.TipoMovimiento;
import negocio.ClienteNegocio;
import negocio.CuentaNegocio;
import negocio.MovimientoNegocio;
import negocio.PaisNegocio;
import negocio.TipoMovimientoNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.CuentaNegocioImpl;
import negocioImpl.MovimientoNegocioImpl;
import negocioImpl.PaisNegocioImpl;
import negocioImpl.TipoMovimientoNegocioImpl;


/**
 * Servlet implementation class ServletMovimientos
 */
@WebServlet("/ServletMovimientos")
public class SelvetMovimientos extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SelvetMovimientos() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("getCuenta") != null) {
			filtrarMovimientos(request, response);
		}
		
		if (request.getParameter("getMovimientos") != null) {
			cargarDesplegables(request, response);
		}
		if (request.getParameter("btnFiltrar") != null) {
			filtrarReporte(request, response);
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
		TipoMovimientoNegocio tipoMovimientoNegocio = new TipoMovimientoNegocioImpl(); 
		ArrayList<TipoMovimiento> tipoMovimiento = (ArrayList<TipoMovimiento>) tipoMovimientoNegocio.readAll();
		request.setAttribute("tipoMovimiento", tipoMovimiento);
		RequestDispatcher rd = request.getRequestDispatcher("/reportes.jsp");
		rd.forward(request, response);

	}
	
	private void filtrarMovimientos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentCuenta = (int) request.getSession().getAttribute("cuentaSeleccionada");
		CuentaNegocio ctaNeg = new CuentaNegocioImpl(); 
		Cuenta cta = new Cuenta(); 
		cta = ctaNeg.readOne(currentCuenta);
		request.setAttribute("cuenta", cta);

		MovimientoNegocio movNeg = new MovimientoNegocioImpl(); 
		ArrayList<Movimiento> lMov = movNeg.readOneCta(currentCuenta);
		//BigDecimal currentSaldo = mov.getSaldo();
		if (lMov.size() > 0) {
			request.setAttribute("saldo", lMov.get(0).getSaldo());
		} 
		request.setAttribute("movimientos", lMov);
        System.out.println(lMov.size()); 

	
		RequestDispatcher rd = request.getRequestDispatcher("/movimientos.jsp");
		rd.forward(request, response);
	}
	private void filtrarReporte(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClienteNegocio clienteNegocio= new ClienteNegocioImpl();
		Cliente cliente = clienteNegocio.readOne(request.getParameter("txtDni"));
		if (request.getParameter("desplegableMovimiento") != null && request.getParameter("txtDni")!= null && 
				request.getParameter("txtFechaInicio")!=null && request.getParameter("txtFechaFin")!= null){			
		
		}
		else {
			MovimientoNegocio movimientoNegocio = new MovimientoNegocioImpl();
			ArrayList<Movimiento> movimiento = (ArrayList<Movimiento>)movimientoNegocio.readAll();
		}

	}
	
}