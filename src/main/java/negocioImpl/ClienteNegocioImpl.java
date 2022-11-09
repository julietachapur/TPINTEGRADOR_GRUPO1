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


	public List<Cliente> readAll() {

		List<Cliente> lClientes;
		lClientes = cDao.readAll();
		return lClientes;
	}


	public String readLast() {
		System.out.print(cDao.readLast());
		return cDao.readLast();
	}

}