package negocioImpl;

import java.util.List;

import dao.TipoUsuarioDao;
import daoImpl.TipoUsuarioDaoImpl;
import entidad.TipoUsuario;
import negocio.TipoUsuarioNegocio;


public class TipoUsuarioNegocioImpl implements TipoUsuarioNegocio {
	
	TipoUsuarioDao tDao = new TipoUsuarioDaoImpl();

	public List<TipoUsuario> readAll() {
		List<TipoUsuario> lTipo;
		lTipo = tDao.readAll();
		return lTipo;
	}

	public TipoUsuario readOne(int codUsuario) {

		return tDao.readOne(codUsuario);
	}

}
