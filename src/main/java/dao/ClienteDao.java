package dao;

import java.util.List;

import entidad.Cliente;

public interface ClienteDao {
	
	public boolean insert(Cliente cliente);

	//public boolean delete(Cliente cliente_a_eliminar);

	//public boolean update(Cliente cliente_a_modificar);

	public List<Cliente> readAll();

	public String readLast();

}
