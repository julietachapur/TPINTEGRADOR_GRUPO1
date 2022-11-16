package daoImpl;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.ClienteDao;
import dao.PrestamosDao;
import dao.TipoCuentaDao;
import entidad.Cliente;
import entidad.Cuenta;
import entidad.Prestamo;
import entidad.TipoCuenta;

public class PrestamosDaoImpl implements PrestamosDao{
	
	private static final String readall = "SELECT * FROM prestamos where dni = ?";
	
	public List<Prestamo> readAllDni(String dni) {
		PreparedStatement statement;
		ResultSet resultSet; // Guarda el resultado de la query
		ArrayList<Prestamo> prestamos = new ArrayList<Prestamo>();
		Conexion conexion = Conexion.getConexion();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			statement = conexion.getSQLConexion().prepareStatement(readall);
			statement.setString(1, dni);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				prestamos.add(getPrestamo(resultSet));
			}
		} catch (SQLException e) {
			System.out.print("Error al Querer obtener todos los registros(SQL ERROR)");
		}
		return prestamos;
	}
	
	private Prestamo getPrestamo(ResultSet resultSet) throws SQLException {

		int codPrestamo = resultSet.getInt("codPrestamo");
		Date fecha = resultSet.getDate("fecha");
		BigDecimal importePagar = resultSet.getBigDecimal("importe_a_pagar");
		BigDecimal importePedido = resultSet.getBigDecimal("importe_pedido");
		int plazoPago = resultSet.getInt("plazo_pago");
		BigDecimal montoMensual = resultSet.getBigDecimal("monto_mensual");
		int cantidadCuotas = resultSet.getInt("cantidad_cuotas");
		boolean estado = resultSet.getBoolean("estado");
		return new Prestamo(codPrestamo,fecha,importePagar,importePedido,plazoPago,montoMensual,cantidadCuotas, estado);
	}

	@Override
	public boolean insert(Prestamo prestamo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean logicalDeletion(Prestamo prestamo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Prestamo prestamo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Prestamo readOne(int nroCuenta) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Prestamo> readAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String readLast() {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * public Prestamo(int codPrestamo, Date fecha, BigDecimal importe_a_pagar, BigDecimal importe_pedido,
			int plazo_pago, BigDecimal monto_mensual, int cantidad_cuotas) {
	 * */
	
}




