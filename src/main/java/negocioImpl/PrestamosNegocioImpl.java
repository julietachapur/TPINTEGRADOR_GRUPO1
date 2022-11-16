package negocioImpl;

import java.util.List;

import daoImpl.PrestamosDaoImpl;
import entidad.Prestamo;
import negocio.PrestamosNegocio;

public class PrestamosNegocioImpl implements PrestamosNegocio{
	public List<Prestamo> readAllDni(String dni){
		PrestamosDaoImpl prestamos = new PrestamosDaoImpl();
		return prestamos.readAllDni(dni);
	}
}
