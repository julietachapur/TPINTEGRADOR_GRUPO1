package negocio;

import java.util.List;

import entidad.TipoMovimiento;

public interface TipoMovimientoNegocio {
	public boolean insert(TipoMovimiento tipo_movimiento_a_agregar);

	public boolean logicalDeletion(TipoMovimiento tipo_movimiento_a_eliminar);

	public boolean update(TipoMovimiento tipo_movimiento_a_modificar);

	public List<TipoMovimiento> readAll();
	
	public TipoMovimiento readOne(int codTipoMovimiento);

	public int readLast();
}
