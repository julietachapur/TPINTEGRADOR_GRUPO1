package negocioImpl;

import java.util.List;

import dao.ClienteDao;
import daoImpl.ClienteDaoImpl;
import entidad.Cliente;
import negocio.ClienteNegocio;

public class ClienteNegocioImpl implements ClienteNegocio {

	ClienteDao cDao = new ClienteDaoImpl();

	public boolean insert(Cliente cliente) {

		boolean estado = false;
		/*if (cliente.getDni() > -1 && cliente.getDescripcion().trim().length() > 0 && cliente.getIdTipo() > -1
				&& cliente.getCostoContratacion() > 0 && cliente.getCostoAsegurado() > 0) {*/
			estado = cDao.insert(cliente);
		//}
		return estado;
	}
	
	public boolean update(Cliente cliente) {

		boolean estado = false;
		estado = cDao.update(cliente);
		
		return estado;
	}

	public boolean logicalDeletion(Cliente cliente_a_eliminar) {
		boolean estado = false;
		try {
			if (cliente_a_eliminar.getDni() != null) {
				estado = cDao.logicalDeletion(cliente_a_eliminar);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return estado;
	}


	public List<Cliente> readAll() {

		List<Cliente> lClientes;
		lClientes = cDao.readAll();
		return lClientes;
	}
	
	
	public Cliente readOne(String dni) {

		Cliente cliente;
		cliente = cDao.readOne(dni);
		return cliente;
	}


	public String readLast() {
		System.out.print(cDao.readLast());
		return cDao.readLast();
	}
	
	public int countActive() {

		int cant;
		cant = cDao.countActive();
		return cant;
	}


}