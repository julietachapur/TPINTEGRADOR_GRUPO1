package entidad;

import java.math.BigDecimal;
import java.util.Date;

public class Movimiento {
	
	private int codMovimiento;  
	private Cuenta nroCuenta;  
	private Date fecha; 
	private String detalle;
	private BigDecimal importe;
	private TipoMovimiento tipoMovimiento;

	public Movimiento() { }

	public Movimiento(int codMovimiento, Cuenta nroCuenta, Date fecha, String detalle, BigDecimal importe,
			TipoMovimiento tipoMovimiento) {		this.codMovimiento = codMovimiento;
		this.nroCuenta = nroCuenta;
		this.fecha = fecha;
		this.detalle = detalle;
		this.importe = importe;
		this.tipoMovimiento = tipoMovimiento;
	}

	public int getCodMovimiento() {
		return codMovimiento;
	}

	public void setCodMovimiento(int codMovimiento) {
		this.codMovimiento = codMovimiento;
	}

	public Cuenta getNroCuenta() {
		return nroCuenta;
	}

	public void setNroCuenta(Cuenta nroCuenta) {
		this.nroCuenta = nroCuenta;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getDetalle() {
		return detalle;
	}

	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}

	public BigDecimal getImporte() {
		return importe;
	}

	public void setImporte(BigDecimal importe) {
		this.importe = importe;
	}

	public TipoMovimiento getTipoMovimiento() {
		return tipoMovimiento;
	}

	public void setTipoMovimiento(TipoMovimiento tipoMovimiento) {
		this.tipoMovimiento = tipoMovimiento;
	}

	@Override
	public String toString() {
		return "Movimiento [codMovimiento=" + codMovimiento + ", nroCuenta=" + nroCuenta + ", fecha=" + fecha
				+ ", detalle=" + detalle + ", importe=" + importe + ", tipoMovimiento=" + tipoMovimiento + "]";
	}
	
}
