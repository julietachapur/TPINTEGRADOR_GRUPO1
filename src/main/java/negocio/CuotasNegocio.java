package negocio;

import java.math.BigDecimal;

public interface CuotasNegocio {
	public boolean pagarCuota(int NroCuenta,int idCuota, BigDecimal importe);
}
