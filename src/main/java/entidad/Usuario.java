package entidad;

public class Usuario {
	private String usuario;
	private String dni;
	private int tipoUsuario;
	private String contraseña;
	private Boolean estado;
	
	public Usuario(String usuario, String dni, int tipoUsuario, String contraseña, Boolean estado) {
		this.usuario = usuario;
		this.dni = dni;
		this.tipoUsuario = tipoUsuario;
		this.contraseña = contraseña;
		this.estado = estado;
	}
	
	public Usuario(String usuario, String dni, String contraseña) {
		this.usuario = usuario;
		this.dni = dni;
		this.contraseña = contraseña;
	}
	
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public int getTipoUsuario() {
		return tipoUsuario;
	}
	public void setTipoUsuario(int tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}
	public String getContraseña() {
		return contraseña;
	}
	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}
	public Boolean getEstado() {
		return estado;
	}
	public void setEstado(Boolean estado) {
		this.estado = estado;
	}
	@Override
	public String toString() {
		return "Usuario [usuario=" + usuario + ", dni=" + dni + ", tipoUsuario=" + tipoUsuario + ", contraseña="
				+ contraseña + ", estado=" + estado + "]";
	}
	
	
	
	
}
