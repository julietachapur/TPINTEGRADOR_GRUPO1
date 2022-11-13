package dao;

import java.util.List;

import entidad.Movimiento;

public interface  MovimientoDao {
	public boolean insert(Movimiento movimiento);
	public List<Movimiento> readAll();
}
