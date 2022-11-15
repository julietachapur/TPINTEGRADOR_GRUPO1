package negocioImpl;

import entidad.Usuario;
import negocio.UsuarioNegocio;
import dao.UsuarioDao;
import daoImpl.UsuarioDaoImpl;

import java.util.List;


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
	
	public boolean update(Usuario usuario) {

		boolean estado = false;
		estado = uDao.update(usuario);
		
		return estado;
	}

	public boolean logicalDeletion(String dni) {
		boolean estado = false;
		try {
			if (dni != null) {
				estado = uDao.logicalDeletion(dni);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return estado;
	}


	public List<Usuario> readAll() {

		List<Usuario> lUsuarios;
		lUsuarios = uDao.readAll();
		return lUsuarios;
	}
	
	public Usuario readOne(String dni) {
		
		Usuario usuario = new Usuario();
		usuario = uDao.readOne(dni);
		
		return usuario;
	}


}
