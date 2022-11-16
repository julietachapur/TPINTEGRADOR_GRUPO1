package servlets;
import java.io.IOException;
/*
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
*/
import java.util.ArrayList;
import java.util.ListIterator;

import entidad.Prestamo;
import entidad.Usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import negocioImpl.PrestamosNegocioImpl;

/**
 * Servlet implementation class ServletPrestamos
 */
@WebServlet("/ServletPrestamos")
public class ServletPrestamos extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ServletPrestamos() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("pagoPrestamos")!=null) {
			obtenerPrestamos(request, response);
			
	
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	
	public void obtenerPrestamos(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		Usuario usuario = new Usuario();
		
		ArrayList<Prestamo> prestamosList = new ArrayList<Prestamo>();
		usuario = (Usuario)request.getSession().getAttribute("Usuario");
		PrestamosNegocioImpl prestamos = new PrestamosNegocioImpl();
		prestamosList=(ArrayList<Prestamo>) prestamos.readAllDni(usuario.getDni());	
		ArrayList<Prestamo> prestamosActivos  = new ArrayList<Prestamo>();
		ListIterator<Prestamo> it = prestamosList.listIterator();
		
		/*Levanto solo los prestamos activos*/
		while (it.hasNext()) {
			Prestamo p = it.next();
			if(p.getEstado()) 
				prestamosActivos.add(p);
		}
		
		if (prestamosActivos.size() != 0) {
			request.setAttribute("Prestamos", prestamosActivos);
			
		}
		else {
			request.setAttribute("SinPrestamos", true);
		}
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("/pagarPrestamo.jsp");
		rd.forward(request, response);
		
	}
	

}
