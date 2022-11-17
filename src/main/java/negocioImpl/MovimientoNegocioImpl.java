package negocioImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.MovimientoDao;
import daoImpl.MovimientoDaoImpl;
import entidad.Movimiento;
import negocio.MovimientoNegocio;


public class MovimientoNegocioImpl implements MovimientoNegocio{

	MovimientoDao mDao = new MovimientoDaoImpl();

	public boolean insert(Movimiento mov) {

		boolean estado = false;
		estado = mDao.insert(mov);
		
		return estado;
	}


	public ArrayList<Movimiento> readAll() {

		ArrayList<Movimiento> lMovimiento;
		lMovimiento = mDao.readAll();
		return lMovimiento;
	}


	public Movimiento readLast() {
		System.out.print(mDao.readLast());
		return mDao.readLast();
	}

	public ArrayList<Movimiento> readOneCta(int nroCuenta){
		ArrayList<Movimiento> lMovimientos_x_cuenta;
		lMovimientos_x_cuenta = mDao.readOneCta(nroCuenta);
		return lMovimientos_x_cuenta; 
	}


	public ArrayList<Movimiento> readXtipoMov(int tipoMovimiento) {
		ArrayList<Movimiento> tipo_movimiento;
		tipo_movimiento = mDao.readXtipoMov(tipoMovimiento);
		return tipo_movimiento; 
	}
	
	public ArrayList<Movimiento> readDesdeFecha(Date fechaInicio) {
		ArrayList<Movimiento> tipo_movimiento;
		tipo_movimiento = mDao.readDesdeFecha(fechaInicio);
		return tipo_movimiento; 
	}

	public ArrayList<Movimiento> readHastaFecha(Date fechaFinal) {
		ArrayList<Movimiento> tipo_movimiento;
		tipo_movimiento = mDao.readDesdeFecha(fechaFinal);
		return tipo_movimiento; 
	}

}