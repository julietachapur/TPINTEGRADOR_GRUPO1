package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Usuario;
import negocio.UsuarioNegocio;
import negocioImpl.UsuarioNegocioImpl;

/**
 * Servlet implementation class usuarioServlet
 */
@WebServlet("/usuarioServlet")
public class usuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public usuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		if(request.getParameter("btnIniciarSesion") != null) {
			iniciarSesion(request, response);
		}
		
		
	}
	
	public void iniciarSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		
		/*Levanto los controles de la solicitud*/
		String usuarioD = request.getParameter("txtUsuario");
		String clave = request.getParameter("txtContraseña");
		String DNI = request.getParameter("txtDNI");
		
		/*Instancio la entidad usuario*/
		Usuario usuarioE = new Usuario( usuarioD, DNI, clave);
		
		/*Instancio la clase usuarioNegocio y utilizo su contructor para guardar la entidad usuario*/
		UsuarioNegocio usuario = new UsuarioNegocioImpl();
		if(usuario.IniciarSesion(usuarioE)) 
			{
			
			}
		request.setAttribute("usuario", "nahue");
		request.setAttribute("dni", "nahue");
		RequestDispatcher rd = request.getRequestDispatcher("/inicioClientes.jsp");
		rd.forward(request, response);
	}

}
