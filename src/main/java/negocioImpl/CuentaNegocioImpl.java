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
				c.setCbu(Integer.parseInt(clienteDao.readOne(dni).getDni().toString()));
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