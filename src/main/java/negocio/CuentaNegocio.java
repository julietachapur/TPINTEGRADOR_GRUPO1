package negocio;

import java.util.List;

import entidad.Cuenta;

public interface CuentaNegocio {

	public boolean insert(Cuenta cuenta_a_agregar);

	public boolean delete(Cuenta cuenta_a_eliminar);

	public boolean update(Cuenta cuenta_a_modificar);

	public List<Cuenta> readAll();
	
	public List<Cuenta> readForClient(String dni);

	public int readLast();
	
	public Cuenta readOne(int nroCuenta);

	public boolean insert(String dni, int tc);

	boolean verificarMaxCuentas(String dni);
	
	boolean verificarCliente(String dni);
	
	public Cuenta readOneCbu(String cbu);
	
	
}