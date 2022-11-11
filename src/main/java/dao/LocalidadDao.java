package dao;

import java.util.List;

import entidad.Localidad;

public interface LocalidadDao {
	
	public boolean insert(Localidad localidad_a_agregar);

	public boolean logicalDeletion(Localidad localidad_a_eliminar);  // Baja lógica

	public boolean update(Localidad localidad_a_modificar);

	public List<Localidad> readAll();

	public Localidad readOne(int codLocalidad);
	
	public int readLast();

}
