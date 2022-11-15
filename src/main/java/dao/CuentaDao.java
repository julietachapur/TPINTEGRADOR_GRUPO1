package dao;

import java.util.List;

import entidad.Cuenta;

public interface  CuentaDao {
	
	public boolean insert(Cuenta cuenta_a_agregar);
	
	public boolean update(Cuenta cuenta_a_agregar);
	
	public boolean delete(Cuenta cuenta_a_eliminar);

	public List<Cuenta> readAll();

	public List<Cuenta> readForClient(String dni);

	public Cuenta readOneCbu(String cbu);
	
	public Cuenta readOne(int nroCuenta);

	public int readLast();

}
