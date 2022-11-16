papackage negocio;

import java.util.List;

import entidad.Cuota;
import entidad.Localidad;
import entidad.Prestamo;
import entidad.PrestamoxAutorizar;

public interface PrestamosxAutorizarNegocio {
	
	public boolean insert(PrestamoxAutorizar prestamo);

	public boolean logicalDeletion(PrestamoxAutorizar prestamo);  // Baja lógica

	public boolean update(PrestamoxAutorizar prestamo);

	public List<PrestamoxAutorizar> readAll();
	
	public PrestamoxAutorizar readOne(int nroCuenta);
}