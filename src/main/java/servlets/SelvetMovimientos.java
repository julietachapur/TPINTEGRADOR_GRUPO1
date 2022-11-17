package servlets;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
/*
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
*/

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			cargarPlanilla(request, response);

		}
		if (request.getParameter("btnFiltrarMovimiento") != null) {
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
	private void cargarPlanilla(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TipoMovimientoNegocio tipoMovimientoNegocio = new TipoMovimientoNegocioImpl(); 
		ArrayList<TipoMovimiento> tipoMovimiento = (ArrayList<TipoMovimiento>) tipoMovimientoNegocio.readAll();
		request.setAttribute("tipoMovimiento", tipoMovimiento);
		
		MovimientoNegocio movimientoNegocio = new MovimientoNegocioImpl();
		ArrayList<Movimiento> movimiento = (ArrayList<Movimiento>)movimientoNegocio.readAll();
		cargarDesplegables(request);
		request.setAttribute("listaMovimientos", movimiento);
		hacerInformes(request);
		RequestDispatcher rd = request.getRequestDispatcher("/reportes.jsp");
		rd.forward(request, response);
		
	}
	
	private void cargarDesplegables(HttpServletRequest request) throws ServletException, IOException {
		TipoMovimientoNegocio tipoMovimientoNegocio = new TipoMovimientoNegocioImpl(); 
		ArrayList<TipoMovimiento> tipoMovimiento = (ArrayList<TipoMovimiento>) tipoMovimientoNegocio.readAll();
		request.setAttribute("tipoMovimiento", tipoMovimiento);		
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
		MovimientoNegocio movimientoNegocio = new MovimientoNegocioImpl();
		ArrayList<Movimiento> movimiento = (ArrayList<Movimiento>)movimientoNegocio.readAll();
		request.setAttribute("listaMovimientos", movimiento);
		if(request.getParameter("txtFechaFinal")!=null)
		{
			cargarFiltroFechaInicio(request, movimientoNegocio);
		}
        System.out.println(request.getParameter("txtFechaFinal")); 
		if(request.getParameter("txtFechaFinal")!=null)
		{
			cargarFiltroFechaFinal(request, movimientoNegocio);
		}
        System.out.println(request.getParameter("txtDni")); 
		if(request.getParameter("txtDni")!= null || request.getParameter("txtDni")!= "" )
		{
			cargarFiltroDni(request, movimientoNegocio);	
		}
        System.out.println(request.getParameter("movimiento")); 
		if(request.getParameter("movimiento") != "" || request.getParameter("movimiento") != null)
		{
			cargarFiltroMovimiento(request, movimientoNegocio);
		}
		cargarDesplegables(request);
		hacerInformes(request);
		RequestDispatcher rd = request.getRequestDispatcher("/reportes.jsp");
		rd.forward(request, response);
	}
	
	private void hacerInformes(HttpServletRequest request) throws ServletException, IOException {
		@SuppressWarnings("unchecked")
		ArrayList<Movimiento> listaMovimientos = (ArrayList<Movimiento>) request.getAttribute("listaMovimientos");
		ArrayList<Movimiento> listaCuentas= null;
		BigDecimal saldos = new BigDecimal(0);
		for(Movimiento mov:listaMovimientos)
		{
			boolean repetido = false;
			if(listaCuentas == null){
				listaCuentas = new ArrayList<Movimiento>();
				listaCuentas.add(mov);
				saldos = mov.getSaldo();
			}
			else{
				for(Movimiento cuenta:listaCuentas){
					if(mov.getNroCuenta().getNroCuenta()== cuenta.getNroCuenta().getNroCuenta()){
						repetido = true;
						break;
					}
				}
				if(repetido == false ){
					listaCuentas.add(mov);
				}
				saldos =saldos.add(mov.getSaldo());
			}
		}
	 	int numLista = listaMovimientos.size();
	 	int numCuentas = listaCuentas.size();
		request.setAttribute("saldos", saldos);
		request.setAttribute("numLista", numLista);
		request.setAttribute("numCuentas", numCuentas);
		
	}
	
	private void cargarFiltroFechaInicio(HttpServletRequest request, MovimientoNegocio movimientoNegocio) throws ServletException, IOException {
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date fecha_inicio = null;
		try {
			 fecha_inicio = formato.parse(request.getParameter("txtFechaInicio"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<Movimiento> listaMovimientos = (ArrayList<Movimiento>)movimientoNegocio.readDesdeFecha(fecha_inicio);
		request.setAttribute("listaMovimientos", listaMovimientos);
	}
	
	private void cargarFiltroFechaFinal(HttpServletRequest request, MovimientoNegocio movimientoNegocio) throws ServletException, IOException {
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date fecha_final = null;
		try {
			 fecha_final = formato.parse(request.getParameter("txtFechaFinal"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<Movimiento> listaMovimientos = (ArrayList<Movimiento>)movimientoNegocio.readHastaFecha(fecha_final);
		request.setAttribute("listaMovimientos", listaMovimientos);
	}
	
	private void cargarFiltroDni(HttpServletRequest request, MovimientoNegocio movimientoNegocio) throws ServletException, IOException {
		String dni = request.getParameter("txtDni");
		CuentaNegocio cuentaNegocio = new CuentaNegocioImpl();
		ArrayList<Cuenta> listaCuentas = (ArrayList<Cuenta>)cuentaNegocio.readForClient(dni);
		ArrayList<Movimiento> listaMovimientos = new ArrayList<Movimiento> ();
		for(Cuenta cnt: listaCuentas) 
		{
			listaMovimientos.addAll(movimientoNegocio.readOneCta((int)cnt.getNroCuenta()));
		}
		request.setAttribute("listaMovimientos", listaMovimientos);		
	}
	
	private void cargarFiltroMovimiento(HttpServletRequest request, MovimientoNegocio movimientoNegocio) throws ServletException, IOException {
		int movimiento =  Integer.parseInt(request.getParameter("movimiento"));
		ArrayList<Movimiento> listaMovimientos = (ArrayList<Movimiento>)movimientoNegocio.readXtipoMov(movimiento);		
		request.setAttribute("listaMovimientos", listaMovimientos);
	}	
	
}