package servlets;
import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.ListIterator;

import entidad.Cuota;
import entidad.Prestamo;
import entidad.PrestamoxAutorizar;
import entidad.Usuario;
import negocio.PrestamosxAutorizarNegocio;
import negocioImpl.PrestamosxAutorizarNegocioImpl;

/*
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;*/


/**
 * Servlet implementation class ServletPrestamos
 */
@WebServlet("/ServletPrestamos")
public class ServletPrestamosxAutorizar extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ServletPrestamosxAutorizar() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("btnRealizarSolicitudPrestamo")!=null) {
			btnRealizarSolicitudPrestamo(request, response);
	
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	
	public void btnRealizarSolicitudPrestamo(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		RequestDispatcher rd;
		String resString="";
		Prestamo p = new Prestamo();
		PrestamosxAutorizarNegocio pdxaNeg = new PrestamosxAutorizarNegocioImpl();
		PrestamoxAutorizar pxa = new PrestamoxAutorizar();
		pxa.setNroCuenta(Integer.parseInt(request.getParameter("getCuenta")));
		p.setCantidad_cuotas(Integer.parseInt(request.getParameter("txtCuotas")));
		p.setImporte_pedido(new BigDecimal(request.getParameter("txtMonto")));
		pxa.setPrestamo(p);
		boolean solicitado = false;
		solicitado = pdxaNeg.insert(pxa);

		if(solicitado)
			resString="Solicitud agregada Satisfactoriamente";
		else
			resString="Solicitud no pudo ser agregada Satisfactoriamente";
		request.setAttribute("getCuenta", pxa.getNroCuenta());
		request.setAttribute("resString", resString);
		request.setAttribute("resBoolean", solicitado);
		rd = request.getRequestDispatcher("/solicitarPrestamo.jsp");
		rd.forward(request, response);
	}

}
