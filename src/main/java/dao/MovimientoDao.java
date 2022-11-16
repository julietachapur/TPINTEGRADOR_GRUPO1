package dao;

import java.util.ArrayList;
import java.util.List;

import entidad.Movimiento;

public interface  MovimientoDao {
	
	public boolean insert(Movimiento movimiento);
	
	public ArrayList<Movimiento> readAll();
	
	public ArrayList<Movimiento> readOneCta(int nroCuenta);
	
	public ArrayList<Movimiento> readXtipoMov(int tipoMovimiento);
	
	public Movimiento readLast();
}
