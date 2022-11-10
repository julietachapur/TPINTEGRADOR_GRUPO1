package dao;

import java.util.List;

import entidad.Cuenta;

public interface  CuentaDao {
	public boolean insert(Cuenta cuenta_a_agregar);

	public boolean logicalDeletion(Cuenta cuenta_a_eliminar);

	public List<Cuenta> readAll();
	
	public List<Cuenta> readForClient(String dni);
	
	public Cuenta readOne(int codCuenta);

	public int readLast();

}
