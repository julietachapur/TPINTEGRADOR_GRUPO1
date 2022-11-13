package negocioImpl;

import entidad.Usuario;
import negocio.UsuarioNegocio;
import daoImpl.UsuarioDaoImpl;

public class UsuarioNegocioImpl implements UsuarioNegocio {

	public Boolean IniciarSesion(Usuario usuario) {
		
		/*Instancio la clase responsable de contectarse con la BD*/
		UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
		
		/*Si encontro el registro en la BD entonces declaro una session*/
		if (usuDao.IniciarSesion(usuario)) {
			return true;
		}
		
		return false;
	}
}
