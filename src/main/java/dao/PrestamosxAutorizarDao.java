package dao;

import java.util.List;

import entidad.PrestamoxAutorizar;

public interface PrestamosxAutorizarDao {
	
	public boolean insert(PrestamoxAutorizar prestamo);
	public boolean update(PrestamoxAutorizar prestamo);

	public boolean logicalDeletion(PrestamoxAutorizar prestamo); // Baja lógica

	public PrestamoxAutorizar readOne(int nroCuenta);
	
	public List<PrestamoxAutorizar> readAll();
	public List<PrestamoxAutorizar> readAllActive();
	public int countActive();

}