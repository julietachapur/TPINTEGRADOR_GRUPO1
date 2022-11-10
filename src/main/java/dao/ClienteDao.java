package dao;

import java.util.List;

import entidad.Cliente;
import entidad.Cuenta;

public interface ClienteDao {
	
	public boolean insert(Cliente cliente);

	//public boolean delete(Cliente cliente_a_eliminar);

	//public boolean update(Cliente cliente_a_modificar);

	public Cliente readOne(String dni);
	
	public List<Cliente> readAll();

	public String readLast();

}
