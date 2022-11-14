package servlets;
import java.io.IOException;
import java.util.ArrayList;

import entidad.Cliente;
import entidad.Usuario;
import entidad.Cuenta;
import negocio.ClienteNegocio;
import negocioImpl.ClienteNegocioImpl;
import negocioImpl.UsuarioNegocioImpl;
import negocioImpl.CuentaNegocioImpl;
import negocio.CuentaNegocio;

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


/**
 * Servlet implementation class ServletUsuario
 */
@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ServletUsuario() {
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
		if (request.getParameter("btnIniciarSesion")!=null) {
			Usuario usuario = new Usuario();
			RequestDispatcher rd;
			if(iniciarSesion(request, response, usuario)){
				/*Segun el tipo de usuario redirecciona al panel de cliente o de admin.*/
				if(usuario.getTipoUsuario().getCodTipo()==2)
					 rd = request.getRequestDispatcher("/inicioClientes.jsp");
				else 
					rd = request.getRequestDispatcher("/inicioAdmin.jsp");
				rd.forward(request, response);
			}
			else {
				rd = request.getRequestDispatcher("/index.jsp");
				request.setAttribute("SesionFallida", true);
				rd.forward(request, response);
			}	
		}
		
	}
	
	/*InicarSesion(request, response, usuario)
	 * Entrada: request, response, entidad.usuario
	 * Salida: true o false en el nombre de la funcion.
	 * Funcionalidad: Levanta los datos ingresados en el form Index.jsp y intenta iniciar sesion,
	 * en caso de exito genera una session con los datos del usuario,
	 * en caso de error o usuario inexistente devuelve false*/
	public Boolean iniciarSesion(HttpServletRequest request, HttpServletResponse response, Usuario usuario) throws ServletException, IOException { 
		
		String clave =  request.getParameter("txtClave");
		String usu = request.getParameter("txtUsuario");
		String DNI = request.getParameter("txtDNI");
		
		usuario.setDNI(DNI); 
		usuario.setUsuario(usu);
		usuario.setContraseña(clave);
		UsuarioNegocioImpl usuNeg = new UsuarioNegocioImpl();
		
		if (usuNeg.IniciarSesion(usuario)) {
			request.getSession().setAttribute("Usuario", usuario);
			cuentasUsuario(request, usuario);
			return true; 
		}	
		else 
			return false;
		
		}
	
		private void cuentasUsuario(HttpServletRequest request, Usuario usuario) {
			CuentaNegocio cuenta = new CuentaNegocioImpl(); 
			ArrayList<Cuenta> cta = (ArrayList<Cuenta>) cuenta.readForClient(usuario.getDni());	
			
			request.getSession().setAttribute("cuentas", cta);
	        //System.out.println(request.getSession().getAttribute("cuentas")); 

		}
	
}

