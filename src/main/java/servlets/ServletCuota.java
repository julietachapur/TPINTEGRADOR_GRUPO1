package servlets;
import java.io.IOException;
import java.math.BigDecimal;

import negocioImpl.CuotasNegocioImpl;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class ServletCuota
 */
@WebServlet("/ServletCuota")
public class ServletCuota extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ServletCuota() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd;
		if(request.getParameter("OPPAGARCUOTA")!=null) {
			if(pagarCuota(request, response))
				request.setAttribute("CuotaPaga", true);
			else
				request.setAttribute("CuotaPaga", false);
			rd = request.getRequestDispatcher("/gestionarCuentas.jsp");
			rd.forward(request, response);
		}
	}
	
	protected boolean pagarCuota(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idCuota =  Integer.parseInt(request.getParameter("IdCuotaAPagar"));
		int NroCuenta = Integer.parseInt(request.getParameter("NroCuenta"));
		String importe = request.getParameter("impCuota");
		BigDecimal importeBig = new BigDecimal(importe);
		CuotasNegocioImpl cuotasneg =  new CuotasNegocioImpl();
		if(cuotasneg.pagarCuota(NroCuenta, idCuota, importeBig))
			return true;
		else
			return false;
	}

}
