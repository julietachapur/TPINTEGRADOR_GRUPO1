package dao;

import java.util.List;


import entidad.Prestamo;


public interface PrestamosDao {
	
	public boolean insert(Prestamo prestamo);

	public boolean logicalDeletion(Prestamo prestamo); // Baja lógica

	public boolean update(Prestamo prestamo);

	public Prestamo readOne(int nroCuenta);
	
	public List<Prestamo> readAll();

	public String readLast();

	public List<Prestamo> readAllDni(String dni);
}
