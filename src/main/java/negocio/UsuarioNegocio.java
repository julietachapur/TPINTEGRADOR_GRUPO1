package negocio;

import java.util.List;

import entidad.Usuario;

public interface UsuarioNegocio {

	public Boolean IniciarSesion(Usuario usuario);
	
	public boolean insert(Usuario usuario);
	
	public boolean update(Usuario usuario);
	
	public boolean logicalDeletion(String dni); // Baja lógica

	public Usuario readOne(String dni);
	
	public List<Usuario> readAll();

//	public String readLast();

}
