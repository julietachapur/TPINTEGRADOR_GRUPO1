package negocioImpl;

import java.math.BigDecimal;
import java.sql.Date;

import daoImpl.TransferenciaDaoImpl;
import entidad.Cuenta;
import entidad.TipoMovimiento;
import negocio.TransferenciaNegocio;

public class TransferenciaNegocioImpl implements TransferenciaNegocio{
	
	public Boolean DoTransfer(Cuenta CtaOrigen, Cuenta CtaDestino, BigDecimal importe,TipoMovimiento TMov, String detalle) {
		TransferenciaDaoImpl transferNeg = new TransferenciaDaoImpl();
		if(transferNeg.DoTransfer(CtaOrigen, CtaDestino, importe, TMov, detalle))
			return true;
		else 
			return false;
	}
	
}



