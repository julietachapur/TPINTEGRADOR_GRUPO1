package daoImpl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entidad.Cliente;
import entidad.Cuenta;
import entidad.Localidad;
import entidad.Movimiento;
import entidad.Pais;
import entidad.Provincia;
import entidad.TipoMovimiento;
import dao.CuentaDao;
import dao.LocalidadDao;
import dao.MovimientoDao;
import dao.PaisDao;
import dao.ProvinciaDao;
import dao.TipoMovimientoDao;


public class MovimientoDaoImpl implements MovimientoDao {
	private static final String insert = "INSERT INTO Movimientos(nroCuenta, fecha,Detalle, importe, tipoMovimiento) VALUES (?,?,?,?,?)";
	private static final String readall = "SELECT * FROM Movimientos";
	
	public boolean insert(Movimiento movimiento_a_agregar) {
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		boolean isInsertExitoso = false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();   //setInt setDouble
		}

		try {
			statement = conexion.prepareStatement(insert);
			statement.setInt(1, movimiento_a_agregar.getNroCuenta().getNroCuenta());
			statement.setDate(2, (Date) movimiento_a_agregar.getFecha());
			statement.setString(3, movimiento_a_agregar.getDetalle());
			statement.setBigDecimal(4, (BigDecimal)movimiento_a_agregar.getImporte());
			statement.setInt(5, movimiento_a_agregar.getTipoMovimiento().getCodTipo());

			if (statement.executeUpdate() > 0) {
				conexion.commit();
				isInsertExitoso = true;
			}
		} catch (SQLException e) {

			System.out.println("Error al intentar ingresar el registro");
		}

		return isInsertExitoso;
	}
	
	public List<Movimiento> readAll() {
		PreparedStatement statement;
		ResultSet resultSet; // Guarda el resultado de la query
		ArrayList<Movimiento> movimientos = new ArrayList<Movimiento>();
		Conexion conexion = Conexion.getConexion();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			statement = conexion.getSQLConexion().prepareStatement(readall);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				movimientos.add(getMovimiento(resultSet));
			}
		} catch (SQLException e) {
			System.out.print("Error al Querer obtener todos los registros(SQL ERROR)");
		}
		return movimientos;
	}
	private Movimiento getMovimiento(ResultSet resultSet) throws SQLException {
		int codMovimiento = resultSet.getInt("codMovimiento");
		int nroCuenta = resultSet.getInt("nroCuenta");
		CuentaDao cuentaDao = new CuentaDaoImpl();
		Cuenta cuenta = cuentaDao.readOne(nroCuenta);
		Date fecha = resultSet.getDate("fecha");
		String detalle = resultSet.getString("detalle");
		BigDecimal importe = resultSet.getBigDecimal("importe");
		int codTipoMovimiento = resultSet.getInt("tipoMovimiento");
		TipoMovimientoDao tipoMovimientoDao = new TipoMovimientoDaoImpl();
		TipoMovimiento tipoMovimiento = tipoMovimientoDao.readOne(codTipoMovimiento);
		return new Movimiento(codMovimiento,cuenta,fecha,detalle,importe,tipoMovimiento);
	}


}
