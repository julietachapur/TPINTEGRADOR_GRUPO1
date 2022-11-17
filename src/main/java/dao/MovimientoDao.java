package dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import entidad.Movimiento;

public interface  MovimientoDao {
	
	public boolean insert(Movimiento movimiento);
	
	public ArrayList<Movimiento> readAll();
	
	public ArrayList<Movimiento> readOneCta(int nroCuenta);
	
	public Movimiento readLast();

	public ArrayList<Movimiento> readXtipoMov(int tipoMovimiento);

	public ArrayList<Movimiento> readDesdeFecha(Date fechaInicio);

	public ArrayList<Movimiento> readHastaFecha(Date fechaFinal);
}
