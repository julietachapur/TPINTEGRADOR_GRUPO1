package servlets;
import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Movimiento;
import entidad.Pais;
import entidad.TipoMovimiento;
import negocio.MovimientoNegocio;
import negocio.PaisNegocio;
import negocio.TipoMovimientoNegocio;
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
		
		if (request.getParameter("listaTipoMovimientos") != null) {
			cargarDesplegables(request, response);
		}
		
		if (request.getParameter("getCuenta") == null) {
				filtrarMovimientos(request, response);
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
		
		MovimientoNegocio movNeg = new MovimientoNegocioImpl(); 
		ArrayList<Movimiento> lMov = movNeg.readOneCta(currentCuenta);
		Movimiento mov = movNeg.readLast();
		request.setAttribute("saldo", mov.getSaldo());
		
	
		RequestDispatcher rd = request.getRequestDispatcher("/movimientos.jsp");
		rd.forward(request, response);
	}
	
	
}
