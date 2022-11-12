package negocio;

import java.util.List;

import entidad.Cuenta;

public interface CuentaNegocio {

	public boolean insert(Cuenta cuenta_a_agregar);

	public boolean delete(Cuenta cuenta_a_eliminar);

	public boolean update(Cuenta cuenta_a_modificar);

	public List<Cuenta> readAll();

	public int readLast();

	public boolean insert(String dni, int tc);
}