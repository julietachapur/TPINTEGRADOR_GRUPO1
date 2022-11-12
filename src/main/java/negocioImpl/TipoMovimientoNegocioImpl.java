package negocioImpl;

import java.util.List;

import dao.TipoMovimientoDao;
import daoImpl.TipoMovimientoDaoImpl;
import entidad.TipoMovimiento;
import negocio.TipoMovimientoNegocio;

public class TipoMovimientoNegocioImpl implements TipoMovimientoNegocio {
	TipoMovimientoDao tipoMovimientoDao = new TipoMovimientoDaoImpl();
	
	@Override
	public boolean insert(TipoMovimiento tipo_movimiento_a_agregar) {
		boolean estado = false;
		estado = tipoMovimientoDao.insert(tipo_movimiento_a_agregar);
		return estado;
	}

	@Override
	public boolean logicalDeletion(TipoMovimiento tipo_movimiento_a_eliminar) {
		boolean estado = false;
		estado = tipoMovimientoDao.logicalDeletion(tipo_movimiento_a_eliminar);
		return estado;
	}

	@Override
	public boolean update(TipoMovimiento tipo_movimiento_a_modificar) {
		boolean estado = false;
		estado = tipoMovimientoDao.update(tipo_movimiento_a_modificar);
		return estado;
	}

	@Override
	public List<TipoMovimiento> readAll() {
		List<TipoMovimiento> listaMovimientos;
		listaMovimientos = tipoMovimientoDao.readAll();
		return listaMovimientos;
	}

	@Override
	public TipoMovimiento readOne(int codTipoMovimiento) {
		System.out.print(tipoMovimientoDao.readOne(codTipoMovimiento));
		return tipoMovimientoDao.readOne(codTipoMovimiento);
	}

	@Override
	public int readLast() {
		System.out.print(tipoMovimientoDao.readLast());
		return tipoMovimientoDao.readLast();
	}

}

