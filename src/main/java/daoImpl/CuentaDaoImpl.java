package daoImpl;


import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.ClienteDao;
import dao.CuentaDao;
import dao.TipoCuentaDao;
import entidad.Cuenta;
import entidad.TipoCuenta;
import entidad.Cliente;

public class CuentaDaoImpl implements CuentaDao{
	private static final String insert = "INSERT INTO Cuentas(CBU, dni, fecha_creacion, tipoCuenta, saldo) VALUES (?,?,?,?,?)";
	private static final String logicalDeletion = "UPDATE Cuentas set estado = 0 Where nroCuenta = ?";
	private static final String readall = "SELECT * FROM Cuentas";
	private static final String readlast = "SELECT * FROM Cuentas ORDER by nroCuenta DESC LIMIT 1";
	private static final String readOne = "SELECT * FROM Cuentas Where nroCuenta = ?";
	private static final String readForClient = "SELECT * FROM Cuentas Where dni = ?";
	private static final String update = "UPDATE Cuentas set saldo = ?, CBU = ?, dni = ?, tipoCuenta = ? Where nroCuenta = ?";


	
	public boolean insert(Cuenta cuenta_a_agregar) {
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
			statement.setInt(1, cuenta_a_agregar.getCbu());
			statement.setString(2, cuenta_a_agregar.getDni().getDni());
			statement.setDate(3,(java.sql.Date) cuenta_a_agregar.getFecha_creacion());
			statement.setInt(4, cuenta_a_agregar.getTipoCuenta().getCodTipo());
			statement.setBigDecimal(5, (BigDecimal)cuenta_a_agregar.getSaldo());

			if (statement.executeUpdate() > 0) {
				conexion.commit();
				isInsertExitoso = true;
			}
		} catch (SQLException e) {

			System.out.println("Error al intentar ingresar el registro");
		}

		return isInsertExitoso;
	}
	
	public boolean delete(Cuenta cuenta_a_eliminar) {
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		boolean isLogicalDeletionExitoso = false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			statement = conexion.prepareStatement(logicalDeletion);
			statement.setBoolean(1, cuenta_a_eliminar.isEstado());
			if (statement.executeUpdate() > 0) {
				conexion.commit();
				isLogicalDeletionExitoso = true;
			}
		} catch (SQLException e) {
			System.out.print("Error al Querer Borrar el registro(SQL ERROR)");
		}
		return isLogicalDeletionExitoso;
	}
	
	public List<Cuenta> readAll() {
		PreparedStatement statement;
		ResultSet resultSet; // Guarda el resultado de la query
		ArrayList<Cuenta> cuenta = new ArrayList<Cuenta>();
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
				cuenta.add(getCuenta(resultSet));
			}
		} catch (SQLException e) {
			System.out.print("Error al Querer obtener todos los registros(SQL ERROR)");
		}
		return cuenta;
	}
	
	public int readLast() {
		PreparedStatement statement;
		ResultSet resultSet; // Guarda el resultado de la query
		Cuenta cuenta = new Cuenta();
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
				cuenta = getCuenta(resultSet);
			}
		} catch (SQLException e) {
			System.out.print("Error al Querer   el registro(SQL ERROR)");
		}
		return cuenta.getNroCuenta();
	}
	
	public Cuenta readOne(int nroCuenta) {
		PreparedStatement statement;
		ResultSet resultSet; // Guarda el resultado de la query
		Cuenta cuenta = new Cuenta();
		Conexion conexion = Conexion.getConexion();
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			statement = conexion.getSQLConexion().prepareStatement(readOne);
			statement.setInt(1, nroCuenta);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				cuenta = getCuenta(resultSet);
			}
		} catch (SQLException e) {
			System.out.print("Error al Querer   el registro(SQL ERROR)");
		}
		
		return cuenta;
	}
	
	public List<Cuenta> readForClient(String dni) {
		PreparedStatement statement;
		ResultSet resultSet; 
		ArrayList<Cuenta> cuenta = new ArrayList<Cuenta>();
		Conexion conexion = Conexion.getConexion();
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			statement = conexion.getSQLConexion().prepareStatement(readForClient);
			statement.setString(1, dni);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				cuenta.add(getCuenta(resultSet));
			}
		} catch (SQLException e) {
			System.out.print("Error al Querer   el registro(SQL ERROR)");
		}
		
		return cuenta;
	}
	
	private Cuenta getCuenta(ResultSet resultSet) throws SQLException {
	
		int nroCuenta = resultSet.getInt("nroCuenta");
		int cbu = resultSet.getInt("cbu");
		String dni = resultSet.getString("dni");
		ClienteDao clienteDao = new ClienteDaoImpl();
		Cliente cliente = clienteDao.readOne(dni);
		Date fecha_creacion = resultSet.getDate("fecha_creacion");
		int numCuenta = resultSet.getInt("tipoCuenta");
		TipoCuentaDao tipoCuentaDao = new TipoCuentaDaoImpl();
		TipoCuenta tipoCuenta = tipoCuentaDao.readOne(numCuenta);
		BigDecimal saldo = resultSet.getBigDecimal("saldo");
		Boolean estado = resultSet.getBoolean("estado");
		return new Cuenta(nroCuenta,cbu,cliente,fecha_creacion,tipoCuenta,saldo,estado);
	}
	
	
public boolean update(Cuenta cuenta_a_actualizar) {
		
		System.out.println(cuenta_a_actualizar.toString());
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		boolean isUpdateExitoso = false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
				statement = conexion.prepareStatement(update);	
				statement.setBigDecimal(1, cuenta_a_actualizar.getSaldo());
				statement.setInt(2, cuenta_a_actualizar.getCbu());
				statement.setString(3, cuenta_a_actualizar.getDni().getDni());
				statement.setString(4, cuenta_a_actualizar.getTipoCuenta().getTipoCuenta());
				statement.setInt(5,cuenta_a_actualizar.getNroCuenta());
				
			if(statement.executeUpdate() > 0){
				conexion.commit();
				isUpdateExitoso  = true;
				}
			} 
		catch (SQLException e1) {
				e1.printStackTrace();
			}
		
		
		return isUpdateExitoso;
		}

}
