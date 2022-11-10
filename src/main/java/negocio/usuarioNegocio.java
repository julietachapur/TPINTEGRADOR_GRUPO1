package negocio;

import org.json.simple.JSONArray;

import entidad.Usuario;

public interface usuarioNegocio {
	public Boolean iniciarSesion(Usuario usuario);
	public Boolean validarSesion(Usuario usuario);
	public Boolean cerrarSesion(Usuario usuario);
	public Boolean getUsuarioActivo(Usuario usuario);
}
