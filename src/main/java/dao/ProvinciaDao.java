package dao;

import java.util.List;

import entidad.Provincia;

public interface ProvinciaDao {
	
	public boolean insert(Provincia provincia_a_agregar);

	public boolean logicalDeletion(Provincia provincia_a_eliminar);  // Baja lógica

	public boolean update(Provincia provincia_a_modificar);

	public List<Provincia> readAll();
	
	public Provincia readOne(int codProvincia);

	public int readLast();
	
}
