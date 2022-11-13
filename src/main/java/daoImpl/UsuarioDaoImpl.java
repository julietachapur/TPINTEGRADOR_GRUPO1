package daoImpl;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.protocol.Resultset;

import dao.UsuarioDao;
import entidad.Cliente;
import entidad.TipoUsuario;
import entidad.Usuario;

public class UsuarioDaoImpl implements UsuarioDao {
	
	private static final String QueryIniciarSesion = "select  c.nombre, c.apellido, c.cuil, c.sexo, c.nacionalidad, c.fecha_nac, c.direccion, c.correo_electronico, c.estado, tu.tipoUsuario, tu.codTipo from usuarios u  inner join clientes c on c.dni = u.dni  inner join tiposUsuarios tu on tu.CodTipo = u.tipoUsuario where u.usuario = ? and u.DNI = ? and	u.contraseña = ? and	u.estado = 1 and c.estado = 1 and tu.estado = 1";
	
	public Boolean IniciarSesion(Usuario usuario) {
		
		PreparedStatement statement;
		ResultSet resultSet;
		Conexion conexion = Conexion.getConexion();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {    
			statement = conexion.getSQLConexion().prepareStatement(QueryIniciarSesion);
			statement.setString(1,  usuario.getUsuario());
			statement.setString(2, usuario.getDni());
			statement.setString(3, usuario.getContraseña());
			resultSet = statement.executeQuery();
			
			/*Vuelvo un registro atras*/
			//resultSet.beforeFirst();
			
			/*Si tengo un resultado el usuario existe*/
			if (resultSet.next()) {
				cargarUsuario(resultSet, usuario);
				return true;
			}
			else 
				return false;
				
		} catch (SQLException e) {
			System.out.print("Error al iniciar sesion(SQL ERROR)");
			return false;
		}

		}
	
	public void cargarUsuario(ResultSet rs, Usuario usuario) throws SQLException {
		
		String 	Nombre = rs.getString("nombre");
		String 	Apellido = rs.getString("apellido");
		String 	Cuil = rs.getString("cuil");
		String 	Sexo = rs.getString("sexo");
		Date 	fecha_nac = rs.getDate("fecha_nac");
		
		String 	direccion = rs.getString("direccion");
		String 	correo_electronico = rs.getString("correo_electronico");
		String 	tipoUsuario = rs.getString("tipoUsuario");
		int 	CodTipo = rs.getInt("codTipo");
		
		usuario.getcliente().setNombre(Nombre);
		usuario.getcliente().setApellido(Apellido);
		usuario.getcliente().setCuil(Cuil);
		usuario.getcliente().setSexo(Sexo);
		usuario.getcliente().setFecha_nac(fecha_nac);
		/*Si llegue aca es porque el estado es true*/
		usuario.setEstado(true);
		
		TipoUsuario Tusuario = new TipoUsuario(CodTipo, tipoUsuario, true);
		usuario.setTipoUsuario(Tusuario);
		
	}
	
	
}
