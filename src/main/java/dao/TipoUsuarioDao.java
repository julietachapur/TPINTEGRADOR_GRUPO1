package dao;

import java.util.List;

import entidad.TipoUsuario;

public interface TipoUsuarioDao {
	
	public List<TipoUsuario> readAll();
	
	public TipoUsuario readOne(int codTipoUsuario);

}
