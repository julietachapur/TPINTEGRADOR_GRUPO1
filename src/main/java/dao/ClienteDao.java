package dao;

import java.util.List;

import entidad.Cliente;


public interface ClienteDao {
	
	public boolean insert(Cliente cliente);

	public boolean logicalDeletion(Cliente cliente_a_eliminar); // Baja lógica

	public boolean update(Cliente cliente_a_modificar);

	public Cliente readOne(String dni);
	
	public List<Cliente> readAll();
	
	public String readLast();

	public int countActive();

}
