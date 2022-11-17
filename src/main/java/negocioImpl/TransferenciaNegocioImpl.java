package negocioImpl;

import java.math.BigDecimal;
import java.sql.Date;

import daoImpl.TransferenciaDaoImpl;
import entidad.Cuenta;
import entidad.TipoMovimiento;
import negocio.TransferenciaNegocio;

public class TransferenciaNegocioImpl implements TransferenciaNegocio{
	
	public Boolean DoTransfer(String ctaOrigen, String cbuDestino, BigDecimal importe, TipoMovimiento TMov, String detalle) {
		TransferenciaDaoImpl transferNeg = new TransferenciaDaoImpl();
		BigDecimal SaldoDestino;
		BigDecimal SaldoOrigen;
		Cuenta cueOrigen = new Cuenta();
		CuentaNegocioImpl cuentaDaoD = new CuentaNegocioImpl();
		Cuenta cueDestino = new Cuenta();
		
		/*Obtengo cuenta destino y cuenta de origen*/
		
		
		cueOrigen =cuentaDaoD.readOne(Integer.parseInt(ctaOrigen));
		cueDestino =cuentaDaoD.readOneCbu(cbuDestino);
	
		
		/*Validaciones*/
		if(cueDestino.getCbu()== null) {
			return false;
		}
		else if(cueOrigen.getSaldo().compareTo(importe)==-1) {
			return false;
		}
		
		/*Calculo los nuevos saldos*/
		SaldoDestino = cueDestino.getSaldo().add(importe);
		SaldoOrigen = cueOrigen.getSaldo().subtract(importe);
		
		if(transferNeg.DoTransfer(cueOrigen, cueDestino, importe,SaldoOrigen, SaldoDestino, TMov, detalle)) {
			
			return true;
		}
		else 
			return false;
	}
	
}



