package negocio;

import java.util.List;

import entidad.Cuota;
import entidad.Prestamo;

public interface PrestamosNegocio {
	public List<Prestamo> readAllDni(String dni);
	public List<Cuota> getCuotas(int codPrestamo);
}
