package negocio;

import java.util.List;

import entidad.PrestamoxAutorizar;

public interface PrestamosxAutorizarNegocio {
	
	public boolean insert(PrestamoxAutorizar prestamo);

	public boolean logicalDeletion(PrestamoxAutorizar prestamo);  // Baja lógica

	public boolean update(PrestamoxAutorizar prestamo);

	public List<PrestamoxAutorizar> readAll();
	public List<PrestamoxAutorizar> readAllActive();
	public PrestamoxAutorizar readOne(int nroCuenta);

	public int countActive();
	
}