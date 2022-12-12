package negocioImpl;


import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.env.ISourceMethod;

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
	
	public Cuenta readOneCbu(String cbu){
		Cuenta cta = new Cuenta();
		cta = cDao.readOneCbu(cbu);
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
	public boolean delete(Cuenta cuenta) {

		boolean estado=false;
		try
		{
			if( cuenta.getNroCuenta()  > 0 )
			{
				estado=cDao.delete(cuenta);
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
		
		try {
			c.setDni(clienteDao.readOne(dni));
			c.setTipoCuenta(tcDao.readOne(tc));
					
			long cbuNuevo = Long.parseLong(clienteDao.readOne(dni).getDni().toString());
			ArrayList<Cuenta> todas = (ArrayList<Cuenta>)cDao.readAll();
			int x;
			
			if(lCuenta.isEmpty()) {
				for(x=0; x<todas.size(); x++) {
					if(todas.get(x).getCbu()==cbuNuevo) {
						cbuNuevo++;
						x=0;
						}
					}
				c.setCbu(cbuNuevo);
				}
			else{
				int tam = lCuenta.size();
				if(tam==1) {
					cbuNuevo++;
					for(x=0; x<todas.size(); x++) {
						if(todas.get(x).getCbu()==cbuNuevo){
							cbuNuevo++;
							x=0;
							}
						}
					c.setCbu(cbuNuevo);
					}
				if(tam==2) {
					cbuNuevo+=2;
					for(x=0; x<todas.size(); x++) {
						if(todas.get(x).getCbu()==cbuNuevo){
							cbuNuevo++;
							x=0;
							}
						}
					c.setCbu(cbuNuevo);
					}
				}
			System.out.println(c.getDni().getDni());
			System.out.println(c.getCbu());
			System.out.println(c.getTipoCuenta().getCodTipo());
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
		return clienteDao.readOne(dni).getDni().equals(dni);
		}
		catch(Exception e) {
           return false;
}
	}
	public boolean verificarMaxCuentas(String dni) {
		try
		{
		CuentaDao cDao = new CuentaDaoImpl();
		ArrayList<Cuenta> lCuenta = (ArrayList<Cuenta>) cDao.readForClient(dni);
       int i=0;
       if(lCuenta !=  null)
       {
       for(Cuenta c:lCuenta)
       {
    	   if(c.isEstado())
    		   i++;
       }
		if(i>=3)
		{
			return true;
		}
       }
		return false;
		}
		catch(Exception  e)
		{
			return false;
		}
	}
}