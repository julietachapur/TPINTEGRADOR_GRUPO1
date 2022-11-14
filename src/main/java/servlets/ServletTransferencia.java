package servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

import daoImpl.CuentaDaoImpl;
import daoImpl.MovimientoDaoImpl;
import entidad.Cuenta;
import entidad.Movimiento;
import entidad.TipoMovimiento;

/*
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
*/

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import negocioImpl.UsuarioNegocioImpl;


/**
 * Servlet implementation class ServletTransferencia
 */
@WebServlet("/ServletTransferencia")
public class ServletTransferencia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletTransferencia() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getAttribute("btnRealizarTransferencia")!=null) {
			realizarTransferencia(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void realizarTransferencia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ctaOrigen = request.getParameter("ctaOrigen");
		String DNI = request.getParameter("txtDNI");
		String cbuDestino = request.getParameter("txtCbuDestino");
		String importe = request.getParameter("txtMonto");
		BigDecimal saldo;
		
		/*Valido todo ya que los datos se pueden alterar desde el front,
		 * tambien debo verificar que esa cuenta le pertenezca al usuario
		 * iniciado en la session*/
		try {
			Double.parseDouble(importe);
			Integer.parseInt(DNI);
			Integer.parseInt(cbuDestino);
			Integer.parseInt(ctaOrigen);
		}
		catch(NumberFormatException e) {
			request.setAttribute("errorFormato", true);
			RequestDispatcher rd = request.getRequestDispatcher("/TPINTEGRADOR_GRUPO1/gestionarCuentas.jsp");
			rd.forward(request, response);
			
		}
		
		/*Cuenta destino - Conseguir Nro Cuenta mediante DNI - y etc etc..*/
		CuentaDaoImpl cuentaDaoD = new CuentaDaoImpl();
		Cuenta cueD = new Cuenta();
		cueD =cuentaDaoD.readOne(Integer.parseInt(ctaOrigen));
		Date fecha = null;
		TipoMovimiento Tmov= new TipoMovimiento(4,"Transferencia",true);
		BigDecimal importeBig = new BigDecimal(importe);
		saldo = cue.getSaldo().subtract(importeBig);
		
		
		/*Cuenta origen*/
		CuentaDaoImpl cuentaDao = new CuentaDaoImpl();
		Cuenta cue = new Cuenta();
		cue =cuentaDao.readOne(Integer.parseInt(ctaOrigen));
		Date fecha = null;
		TipoMovimiento Tmov= new TipoMovimiento(4,"Transferencia",true);
		BigDecimal importeBig = new BigDecimal(importe);
		saldo = cue.getSaldo().subtract(importeBig);
		
		/*Movimiento cuenta de origen*/
		Movimiento mov = new Movimiento(cue, fecha, saldo, Tmov, saldo, "Transferencia" );
		MovimientoDaoImpl movimiento = new MovimientoDaoImpl();
		movimiento.insert(mov);
		
		/*Movimiento cuenta de destino*/
		
		
		
		
		

	}

}
