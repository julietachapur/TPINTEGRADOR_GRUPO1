package negocioImpl;

import entidad.Usuario;
import negocio.UsuarioNegocio;
import dao.ClienteDao;
import dao.UsuarioDao;
import daoImpl.ClienteDaoImpl;
import daoImpl.UsuarioDaoImpl;

public class UsuarioNegocioImpl implements UsuarioNegocio {
	
	UsuarioDao uDao = new UsuarioDaoImpl();

	public Boolean IniciarSesion(Usuario usuario) {
		
		/*Instancio la clase responsable de contectarse con la BD*/		
		/*Si encontro el registro en la BD entonces declaro una session*/
		if (uDao.IniciarSesion(usuario)) {
			return true;
		}
		
		return false;
	}
	
	public boolean insert(Usuario usuario) {
		boolean estado = false;
		estado = uDao.insert(usuario);
		return estado;
	}

}
