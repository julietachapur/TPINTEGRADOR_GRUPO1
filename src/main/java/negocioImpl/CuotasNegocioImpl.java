package negocioImpl;

import java.math.BigDecimal;

import daoImpl.CuentaDaoImpl;
import daoImpl.CuotasDaoImpl;
import entidad.Cuenta;
import negocio.CuotasNegocio;

public class CuotasNegocioImpl implements CuotasNegocio{
	CuotasDaoImpl cuotasDao = new CuotasDaoImpl();
	
	public boolean pagarCuota(int NroCuenta,int idCuota) {
		CuentaDaoImpl cuenta = new CuentaDaoImpl();
		Cuenta cuentaE;
		cuentaE = cuenta.readOne(NroCuenta);
		if(cuotasDao.pagarCuota(NroCuenta,idCuota, cuentaE.getSaldo(), "Pago cuota - ID" + idCuota))
			return true;
		else
			return false;
	}
}
