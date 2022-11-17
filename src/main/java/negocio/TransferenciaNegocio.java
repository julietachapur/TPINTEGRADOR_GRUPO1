package negocio;

import java.math.BigDecimal;
import java.util.List;

import entidad.Cuenta;
import entidad.TipoMovimiento;

public interface TransferenciaNegocio {
	
	public Boolean DoTransfer(Cuenta CtaOrigen, Cuenta CtaDestino, BigDecimal importe, BigDecimal saldoOrigen, BigDecimal SaldoDestino, TipoMovimiento TMov, String detalle);
}
