package Criptos;

public class Cliente {
	private int id_cliente;
	private String dni;
	private String nombre;
	private String apellidos;
	private String direccion;
	private int Codigo_Postal;
	private String provincia;
	public Cliente() {
		super();
	}
	public Cliente(int id_cliente, String dni, String nombre, String apellidos, String direccion, int codigo_Postal,
			String provincia) {
		super();
		this.id_cliente = id_cliente;
		this.dni = dni;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.direccion = direccion;
		Codigo_Postal = codigo_Postal;
		this.provincia = provincia;
	}
	public int getId_cliente() {
		return id_cliente;
	}
	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public int getCodigo_Postal() {
		return Codigo_Postal;
	}
	public void setCodigo_Postal(int codigo_Postal) {
		Codigo_Postal = codigo_Postal;
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	@Override
	public String toString() {
		return "Cliente [id_cliente=" + id_cliente + ", dni=" + dni + ", nombre=" + nombre + ", apellidos=" + apellidos
				+ ", direccion=" + direccion + ", Codigo_Postal=" + Codigo_Postal + ", provincia=" + provincia + "]";
	}
	

}
