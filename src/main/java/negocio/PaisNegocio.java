package negocio;

import java.util.List;

import entidad.Pais;

public interface PaisNegocio {
	public boolean insert(Pais pais_a_agregar);

	public boolean logicalDeletion(Pais pais_a_eliminar);  // Baja lógica

	public boolean update(Pais pais_a_modificar);

	public List<Pais> readAll();
	
	public int readLast();
}
