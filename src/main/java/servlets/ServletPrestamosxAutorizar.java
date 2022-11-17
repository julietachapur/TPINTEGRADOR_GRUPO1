package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import entidad.Prestamo;
import entidad.PrestamoxAutorizar;

import negocio.PrestamosxAutorizarNegocio;
import negocioImpl.PrestamosxAutorizarNegocioImpl;
import java.math.BigDecimal;
import java.util.ArrayList;

/*
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;*/

/**
 * Servlet implementation class ServletPrestamosxAutorizar
 */
@WebServlet("/ServletPrestamosxAutorizar")
public class ServletPrestamosxAutorizar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPrestamosxAutorizar() {
        super();
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
		if (request.getParameter("getPrestamos") != null) {
			cargarPrestamos(request, response);
		}
		
	}

	private void cargarPrestamos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd;
		boolean solicitado = false;
		String resString="";
		PrestamosxAutorizarNegocio pdxaNeg = new PrestamosxAutorizarNegocioImpl();
		ArrayList<PrestamoxAutorizar> lPrestamos = (ArrayList<PrestamoxAutorizar>)pdxaNeg.readAll() ;
		if(lPrestamos != null)
		{
			for(PrestamoxAutorizar cadena :lPrestamos) {
			      System.out.println(cadena.getCodPrestamoPendiente());
			    }
			if(!lPrestamos.isEmpty())
				solicitado =true;
			else
			resString="No hay Prestamos pendientes de aprobacion";
		}
		request.setAttribute("resString", resString);
		request.setAttribute("resBoolean", solicitado);
		request.setAttribute("Prestamos", lPrestamos);
		rd = request.getRequestDispatcher("/AltaPrestamo.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	
	public void btnRealizarSolicitudPrestamo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		RequestDispatcher rd;
		
		Prestamo p = new Prestamo();
		PrestamosxAutorizarNegocio pdxaNeg = new PrestamosxAutorizarNegocioImpl();
		boolean solicitado = false;
		String resString="";
		PrestamoxAutorizar pxa = new PrestamoxAutorizar();
		try
		{
		pxa.setNroCuenta(Integer.parseInt(request.getParameter("getCuenta")));
		pxa.setCantidad_cuotas(Integer.parseInt(request.getParameter("txtCuotas")));
		pxa.setImporte(new BigDecimal(request.getParameter("txtMonto")));
		
		
		solicitado = pdxaNeg.insert(pxa);

		if(solicitado)
			resString="Solicitud agregada Satisfactoriamente";
		else
			resString="Solicitud no pudo ser agregada Satisfactoriamente";
		}
		catch(Exception e)
		{
			resString="Solicitud no pudo ser agregada Satisfactoriamente";
			request.setAttribute("cuentaSeleccionada",null);
		}
		request.setAttribute("cuentaSeleccionada", pxa.getNroCuenta());
		request.setAttribute("resBoolean", solicitado);
		request.setAttribute("resString", resString);
		rd = request.getRequestDispatcher("/solicitarPrestamo.jsp");
		rd.forward(request, response);
		
	}

}