package daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.ClienteDao;
import dao.LocalidadDao;
import dao.PaisDao;
import dao.ProvinciaDao;
import entidad.Cliente;
import entidad.Localidad;
import entidad.Pais;
import entidad.Provincia;

public class ClienteDaoImpl implements ClienteDao {
	private static final String insert = "INSERT INTO Clientes(dni,nombre,apellido,CUIL,sexo,nacionalidad,fecha_nac,direccion,codLocalidad, codProvincia, codPais,correo_electronico) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
	//private static final String delete = "DELETE FROM Clientes WHERE idSeguro = ?";
	private static final String readall = "SELECT * FROM Clientes";
	//private static final String update = "UPDATE Clientes set descripcion = ?, idTipo = ?, costoContratacion = ?, costoAsegurado = ? Where idSeguro = ?";
	private static final String readlast = "SELECT * FROM Clientes ORDER by dni DESC LIMIT 1";
	
	public boolean insert(Cliente cliente_a_agregar) {
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
			statement.setString(1, cliente_a_agregar.getDni());
			statement.setString(2, cliente_a_agregar.getNombre());
			statement.setString(3, cliente_a_agregar.getApellido());
			statement.setString(4, cliente_a_agregar.getCuil());
			statement.setString(5, cliente_a_agregar.getSexo());
			statement.setInt(6, cliente_a_agregar.getNacionalidad().getCodPais());
			statement.setDate(7, cliente_a_agregar.getFecha_nac());
			statement.setString(8, cliente_a_agregar.getDireccion());
			statement.setInt(9, cliente_a_agregar.getLocalidad().getCodLocalidad());
			statement.setInt(10, cliente_a_agregar.getLocalidad().getProvincia().getCodProvincia());
			statement.setInt(11, cliente_a_agregar.getLocalidad().getPais().getCodPais());
			statement.setString(12, cliente_a_agregar.getCorreo_electronico());


			if (statement.executeUpdate() > 0) {
				conexion.commit();
				isInsertExitoso = true;
			}
		} catch (SQLException e) {

			System.out.println("Error al intentar ingresar el registro");
		}

		return isInsertExitoso;
	}
	
	public List<Cliente> readAll() {
		PreparedStatement statement;
		ResultSet resultSet; // Guarda el resultado de la query
		ArrayList<Cliente> clientes = new ArrayList<Cliente>();
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
				clientes.add(getCliente(resultSet));
			}
		} catch (SQLException e) {
			System.out.print("Error al Querer obtener todos los registros(SQL ERROR)");
		}
		return clientes;
	}
	
	public String readLast() {
		PreparedStatement statement;
		ResultSet resultSet; // Guarda el resultado de la query
		Cliente cliente = new Cliente();
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
				cliente = getCliente(resultSet);
			}
		} catch (SQLException e) {
			System.out.print("Error al Querer   el registro(SQL ERROR)");
		}
		return cliente.getDni();
	}
	
	private Cliente getCliente(ResultSet resultSet) throws SQLException {

		String dni = resultSet.getString("dni");
		String nombre = resultSet.getString("nombre");
		String apellido = resultSet.getString("apellido");
		String cuil = resultSet.getString("CUIL");
		String sexo = resultSet.getString("sexo");
		int codNacionalidad = resultSet.getInt("nacionalidad");
		Date fecha_nac = resultSet.getDate("fecha_nac");
		String direccion = resultSet.getString("direccion");
		int codLocalidad = resultSet.getInt("codLocalidad");
		int codProvincia = resultSet.getInt("codProvincia");
		int codPais = resultSet.getInt("codPais");
		String correo_electronico = resultSet.getString("correo_electronico");
		boolean estado = resultSet.getBoolean("estado");
		
		LocalidadDao localidadDao = new LocalidadDaoImpl();
		Localidad localidad = localidadDao.readOne(codLocalidad);		
		ProvinciaDao provinciaDao = new ProvinciaDaoImpl();
		Provincia provincia = provinciaDao.readOne(codProvincia);		
		PaisDao paisDao = new PaisDaoImpl();
		Pais pais = paisDao.readOne(codPais);
		Pais nacionalidad = paisDao.readOne(codNacionalidad);
		
		
		return new Cliente(dni, nombre, apellido, cuil, sexo, nacionalidad, fecha_nac, direccion, localidad, provincia, pais, correo_electronico, estado);
	}


}
