package dao;

import java.util.List;

import entidad.Usuario;

public interface UsuarioDao {
	public Boolean IniciarSesion(Usuario usuario);
	
	public boolean insert(Usuario usuario);

	public boolean logicalDeletion(Usuario usuario_a_eliminar); // Baja lógica

	public boolean update(Usuario usuario_a_modificar);

	public Usuario readOne(String dni);
	
	public List<Usuario> readAll();

//	public String readLast();


}
