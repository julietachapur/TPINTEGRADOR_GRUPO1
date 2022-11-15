package dao;

import java.math.BigDecimal;

import entidad.Cuenta;
import entidad.TipoMovimiento;

public interface TransferenciaDao {
	public Boolean DoTransfer(Cuenta CtaOrigen, Cuenta CtaDestino, BigDecimal importe,TipoMovimiento TMov, String detalle);
}
