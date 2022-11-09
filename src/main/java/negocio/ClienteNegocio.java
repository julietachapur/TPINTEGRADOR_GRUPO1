package negocio;

import java.util.List;

import entidad.Cliente;

public interface ClienteNegocio {
	
	public boolean insert(Cliente cliente_a_agregar);

	//public boolean delete(Cliente cliente_a_eliminar);

	//public boolean update(Cliente cliente_a_modificar);

	public List<Cliente> readAll();

	public String readLast();
}
