package dao;

import java.math.BigDecimal;

import entidad.Cuenta;
import entidad.TipoMovimiento;

public interface TransferenciaDao {
	public Boolean DoTransfer(Cuenta CtaOrigen, Cuenta CtaDestino, BigDecimal importe, BigDecimal saldoOrigen, BigDecimal SaldoDestino, TipoMovimiento TMov, String detalle);
}
