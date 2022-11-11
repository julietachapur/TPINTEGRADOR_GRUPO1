package entidad;

public class Usuario {
	
	private String usuario;
	private Cliente dni;
	private TipoUsuario tipoUsuario;
	private String contraseña;
	private boolean estado;

	public Usuario() { }

	public Usuario(String usuario, Cliente dni, TipoUsuario tipoUsuario, String contraseña, boolean estado) {
		this.usuario = usuario;
		this.dni = dni;
		this.tipoUsuario = tipoUsuario;
		this.contraseña = contraseña;
		this.estado = estado;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public Cliente getDni() {
		return dni;
	}

	public void setDni(Cliente dni) {
		this.dni = dni;
	}

	public TipoUsuario getTipoUsuario() {
		return tipoUsuario;
	}

	public void setTipoUsuario(TipoUsuario tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}

	public String getContraseña() {
		return contraseña;
	}

	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "Usuario [usuario=" + usuario + ", dni=" + dni + ", tipoUsuario=" + tipoUsuario + ", contraseña="
				+ contraseña + ", estado=" + estado + "]";
	}
	
}
