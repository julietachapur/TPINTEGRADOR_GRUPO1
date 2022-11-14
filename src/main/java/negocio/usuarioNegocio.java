package negocio;

import entidad.Usuario;

public interface UsuarioNegocio {

	public Boolean IniciarSesion(Usuario usuario);
	
	public boolean insert(Usuario usuario);

}
