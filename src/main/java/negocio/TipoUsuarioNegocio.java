package negocio;

import java.util.List;

import entidad.TipoUsuario;

public interface TipoUsuarioNegocio {
	
public List<TipoUsuario> readAll();
	
	public TipoUsuario readOne(int codTipoUsuario);

}
