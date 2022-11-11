package negocioImpl;

import java.util.List;

import dao.PaisDao;
import daoImpl.PaisDaoImpl;
import entidad.Pais;
import negocio.PaisNegocio;

public class PaisNegocioImpl implements PaisNegocio {

	PaisDao pDao = new PaisDaoImpl();

	public boolean insert(Pais pais) {

		boolean estado = false;
		estado = pDao.insert(pais);
		
		return estado;
	}
	
	public boolean update(Pais pais) {

		boolean estado = false;
		estado = pDao.update(pais);
		
		return estado;
	}

	public boolean logicalDeletion(Pais pais_a_eliminar) {
		boolean estado = false;
		try {
			if (pais_a_eliminar.getCodPais() > 0) {
				estado = pDao.logicalDeletion(pais_a_eliminar);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return estado;
	}


	public List<Pais> readAll() {

		List<Pais> lPaises;
		lPaises = pDao.readAll();
		return lPaises;
	}


	public int readLast() {
		System.out.print(pDao.readLast());
		return pDao.readLast();
	}


}