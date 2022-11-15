package negocio;

import java.util.List;

import entidad.Cliente;

public interface ClienteNegocio {
	
	public boolean insert(Cliente cliente);

	public boolean logicalDeletion(Cliente cliente_a_eliminar); // Baja lógica

	public boolean update(Cliente cliente_a_modificar);
	
	public List<Cliente> readAll();
	
	public Cliente readOne(String dni);

	public String readLast();
}
