package daoImpl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import entidad.Cuenta;
import entidad.Movimiento;
import entidad.TipoMovimiento;
import dao.CuentaDao;
import dao.MovimientoDao;
import dao.TipoMovimientoDao;


public class MovimientoDaoImpl implements MovimientoDao {
	private static final String insert = "INSERT INTO Movimientos(nroCuenta, fecha, importe, tipoMovimiento, saldo, detalle) VALUES (?,?,?,?,?)";
	private static final String readall = "SELECT * FROM Movimientos";
	private static final String readOneCta = "SELECT * FROM Movimientos Where nroCuenta = ? order by fecha DESC";
	private static final String readlast = "SELECT * FROM Movimientos ORDER by fecha DESC LIMIT 1";

	
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
			statement.setBigDecimal(3, (BigDecimal)movimiento_a_agregar.getImporte());
			statement.setInt(4, movimiento_a_agregar.getTipoMovimiento().getCodTipo());
			statement.setBigDecimal(5, (BigDecimal)movimiento_a_agregar.getImporte());
			statement.setString(6, movimiento_a_agregar.getDetalle());


			if (statement.executeUpdate() > 0) {
				conexion.commit();
				isInsertExitoso = true;
			}
		} catch (SQLException e) {

			System.out.println("Error al intentar ingresar el registro");
		}

		return isInsertExitoso;
	}
	
	public ArrayList<Movimiento> readAll() {
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
	
	
	public ArrayList<Movimiento> readOneCta(int nroCuenta) {
		PreparedStatement statement;
		ResultSet resultSet; 
		ArrayList<Movimiento> movList = new ArrayList<Movimiento>();
		Conexion conexion = Conexion.getConexion();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			statement = conexion.getSQLConexion().prepareStatement(readOneCta);
			statement.setInt(1, nroCuenta);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				movList.add(getMovimiento(resultSet));
			}
		} catch (SQLException e) {
			System.out.print("Error al querer leer los movimientos del registro(SQL ERROR)");
		}

		return movList;
		
	}

	public Movimiento readLast() {
		PreparedStatement statement;
		ResultSet resultSet; 
		Movimiento mov = new Movimiento();
		Conexion conexion = Conexion.getConexion();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			statement = conexion.getSQLConexion().prepareStatement(readlast);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				mov = getMovimiento(resultSet);
			}
		} catch (SQLException e) {
			System.out.print("Error al Querer   el registro(SQL ERROR)");
		}
		return mov;
	}
	
	
	private Movimiento getMovimiento(ResultSet resultSet) throws SQLException {
		int codMovimiento = resultSet.getInt("codMovimiento");
		int nroCuenta = resultSet.getInt("nroCuenta");
		CuentaDao cuentaDao = new CuentaDaoImpl();
		Cuenta cuenta = cuentaDao.readOne(nroCuenta);
		Date fecha = resultSet.getDate("fecha");
		String detalle = resultSet.getString("detalle");
		BigDecimal importe = resultSet.getBigDecimal("importe");
		BigDecimal saldo = resultSet.getBigDecimal("saldo");
		int codTipoMovimiento = resultSet.getInt("tipoMovimiento");
		TipoMovimientoDao tipoMovimientoDao = new TipoMovimientoDaoImpl();
		TipoMovimiento tipoMovimiento = tipoMovimientoDao.readOne(codTipoMovimiento);
		return new Movimiento(codMovimiento,cuenta,fecha,importe,tipoMovimiento,saldo,detalle);
		
	}
	


}
