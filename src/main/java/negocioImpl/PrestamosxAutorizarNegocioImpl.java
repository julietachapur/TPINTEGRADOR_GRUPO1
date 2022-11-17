package negocioImpl;

import java.util.List;

import dao.PrestamosxAutorizarDao;
import daoImpl.PrestamosxAutorizarDaoImpl;
import entidad.PrestamoxAutorizar;
import negocio.PrestamosxAutorizarNegocio;

public class PrestamosxAutorizarNegocioImpl implements PrestamosxAutorizarNegocio {
	
	PrestamosxAutorizarDao pxaDao = new PrestamosxAutorizarDaoImpl();
	
	@Override
	public boolean insert(PrestamoxAutorizar prestamo) {

		boolean estado = false;
		estado = pxaDao.insert(prestamo);
		return estado;
	}

	@Override
	public boolean logicalDeletion(PrestamoxAutorizar prestamo) {
		boolean estado=false;
		if( prestamo.getNroCuenta()  > 0 )
		{
			estado=pxaDao.logicalDeletion(prestamo);
		}
		return estado;
	}
	@Override
	public List<PrestamoxAutorizar> readAll() {
		List<PrestamoxAutorizar> prestamo;
		prestamo = pxaDao.readAll();
		return prestamo;
	
	}

	@Override
	public PrestamoxAutorizar readOne(int nroPrestamo) {
		PrestamoxAutorizar prestamo = new PrestamoxAutorizar();
		prestamo = pxaDao.readOne(nroPrestamo);
		return prestamo; 
	}

	@Override
	public boolean update(PrestamoxAutorizar prestamo) {
		boolean estado=false;
		if( prestamo.getCodPrestamoPendiente()  > 0 )
		{
			estado=pxaDao.update(prestamo);
			
		}
		return estado;
	
	}
	public int countActive() {

		int cant;
		cant = pxaDao.countActive();
		return cant;
	}

	@Override
	public List<PrestamoxAutorizar> readAllActive() {
		List<PrestamoxAutorizar> prestamo;
		prestamo = pxaDao.readAllActive();
		return prestamo;
	
	}


	
	
}