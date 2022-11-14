package negocio;

import java.util.ArrayList;
import java.util.List;

import entidad.Movimiento;

public interface MovimientoNegocio {
	
	public boolean insert(Movimiento movimiento);
	
	public ArrayList<Movimiento> readAll();
	
	public ArrayList<Movimiento> readOneCta(int nroCuenta);
	
	public Movimiento readLast();

}
