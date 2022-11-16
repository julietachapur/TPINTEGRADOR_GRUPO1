package daoImpl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;

import com.mysql.cj.jdbc.CallableStatement;

import dao.PrestamosxAutorizarDao;

import entidad.PrestamoxAutorizar;


public class PrestamosxAutorizarDaoImpl implements PrestamosxAutorizarDao{
	
	private static final String insert = "{CALL agregarPrestamoxAutorizar(?,?,?)}";
	private static final String getcuotas = "select * from cuotas_x_prestamo where codPrestamo  =  ? ";
	@Override
	public boolean insert(PrestamoxAutorizar prestamo) {
		
		Connection conexion = Conexion.getConexion().getSQLConexion();
		boolean isInsertExitoso = false;
		try {
	
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();   //setInt setDouble
		}

		try {
			 CallableStatement cs = (CallableStatement) conexion.prepareCall(insert);
			cs.setInt(1, prestamo.getNroCuenta());
			cs.setBigDecimal(2, prestamo.getPrestamo().getImporte_pedido());
			cs.setInt(3, prestamo.getPrestamo().getCantidad_cuotas());

			if (cs.executeUpdate() > 0) {
				conexion.commit();
				isInsertExitoso = true;
			}
		} catch (SQLException e) {

			System.out.println("Error al intentar ingresar el registro");
		}

		return isInsertExitoso;
	
	}
	@Override
	public boolean logicalDeletion(PrestamoxAutorizar prestamo) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public PrestamoxAutorizar readOne(int nroCuenta) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<PrestamoxAutorizar> readAll() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean update(PrestamoxAutorizar prestamo) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
	

}




