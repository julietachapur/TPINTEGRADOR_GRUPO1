package negocio;

import java.util.List;

import entidad.TipoCuenta;

public interface TipoCuentaNegocio {
	public boolean insert(TipoCuenta tipo_movimiento_a_agregar);

	public boolean logicalDeletion(TipoCuenta tipo_movimiento_a_eliminar);

	public List<TipoCuenta> readAll();
	
	public TipoCuenta readOne(int codTipoCuenta);



	
}
