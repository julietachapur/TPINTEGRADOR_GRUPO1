package negocioImpl;


import java.util.ArrayList;
import java.util.List;

import dao.ClienteDao;
import dao.CuentaDao;
import dao.TipoCuentaDao;
import daoImpl.ClienteDaoImpl;
import daoImpl.CuentaDaoImpl;
import daoImpl.TipoCuentaDaoImpl;
import entidad.Cuenta;
import negocio.CuentaNegocio;

public class CuentaNegocioImpl implements CuentaNegocio {

	CuentaDao cDao = new CuentaDaoImpl();

	public boolean insert(Cuenta Cuenta) {

		boolean estado = false;
			estado = cDao.insert(Cuenta);
		//}
		return estado;
	}


	public List<Cuenta> readAll() {

		List<Cuenta> lCuentas;
		lCuentas = cDao.readAll();
		return lCuentas;
	}


	public int readLast() {
		System.out.print(cDao.readLast());
		return cDao.readLast();
	}

	public List<Cuenta> readForClient(String dni){
		List<Cuenta> lCuentas_x_usuario;
		lCuentas_x_usuario = cDao.readForClient(dni);
		return lCuentas_x_usuario; 
	}

	public Cuenta readOne(int nroCta){
		Cuenta cta = new Cuenta();
		cta = cDao.readOne(nroCta);
		return cta; 
	}




	public boolean update(Cuenta cuenta) {

		boolean estado=false;
		if( cuenta.getNroCuenta()  > 0 )
		{
			estado=cDao.update(cuenta);
		}
		return estado;
	}


	public boolean delete(Cuenta persona_a_eliminar) {
		boolean estado=false;
		try
		{
			if( persona_a_eliminar.getNroCuenta()  > 0 )
			{
				estado=cDao.delete(persona_a_eliminar);
			}
		}
		catch(Exception e) {
            e.printStackTrace();
}
		return estado;
	}


	@Override
	public boolean insert(String dni, int tc) {

		CuentaDao cDao = new CuentaDaoImpl();
		ClienteDao clienteDao = new ClienteDaoImpl();
		TipoCuentaDao tcDao = new TipoCuentaDaoImpl();
		Cuenta  c = new Cuenta();
		boolean agregado;
		ArrayList<Cuenta> lCuenta = (ArrayList<Cuenta>) cDao.readForClient(dni);

		///verificamos realmente que exista ese dni
		try
		{
				c.setDni(clienteDao.readOne(dni));
				c.setTipoCuenta(tcDao.readOne(tc));
				c.setCbu(Long.parseLong(clienteDao.readOne(dni).getDni().toString()));
				System.out.print(c.toString());
				return cDao.insert(c);
		}
		catch(Exception e) {
            e.printStackTrace();
}
		return false;
				
}
	public boolean verificarCliente(String dni) {
		ClienteDao clienteDao = new ClienteDaoImpl();
		try										
		{
		return !clienteDao.readOne(dni).equals(dni);
		}
		catch(Exception e) {
           return false;
}
	}
	
	public Cuenta obtenerCuenta(String Dni) {
		
		
		return new Cuenta();
	}

	public boolean verificarMaxCuentas(String dni) {
		CuentaDao cDao = new CuentaDaoImpl();
		ArrayList<Cuenta> lCuenta = (ArrayList<Cuenta>) cDao.readForClient(dni);
		if(lCuenta.size()>=3)
		{
			return true;
		}
		return false;
	}

}