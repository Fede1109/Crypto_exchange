package Criptos;

public class Criptomoneda {
	private int id_crypto;
	private String nombre;
	private String description;
	private double valor_en_euros;
	private double capitalizacion;
	public Criptomoneda() {
		super();
	}
	public Criptomoneda(int id_crypto, String nombre, String description, double valor_en_euros,
			double capitalizacion) {
		super();
		this.id_crypto = id_crypto;
		this.nombre = nombre;
		this.description = description;
		this.valor_en_euros = valor_en_euros;
		this.capitalizacion = capitalizacion;
	}
	public int getId_crypto() {
		return id_crypto;
	}
	public void setId_crypto(int id_crypto) {
		this.id_crypto = id_crypto;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getValor_en_euros() {
		return valor_en_euros;
	}
	public void setValor_en_euros(double valor_en_euros) {
		this.valor_en_euros = valor_en_euros;
	}
	public double getCapitalizacion() {
		return capitalizacion;
	}
	public void setCapitalizacion(double capitalizacion) {
		this.capitalizacion = capitalizacion;
	}
	@Override
	public String toString() {
		return "Criptomoneda [id_crypto=" + id_crypto + ", nombre=" + nombre + ", description=" + description
				+ ", valor_en_euros=" + valor_en_euros + ", capitalizacion=" + capitalizacion + "]";
	}
	

}
