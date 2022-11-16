package negocio;

import java.util.List;

import entidad.Prestamo;

public interface PrestamosNegocio {
	public List<Prestamo> readAllDni(String dni);
}
