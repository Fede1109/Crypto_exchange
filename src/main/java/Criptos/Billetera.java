package Criptos;

public class Billetera {
	private int id_billetera;
	private int id_cliente;
	public Billetera() {
		super();
	}
	public Billetera(int id_cliente,int id_billetera ) {
		super();
		this.id_billetera = id_billetera;
		this.id_cliente = id_cliente;
	}
	public int getId_billetera() {
		return id_billetera;
	}
	public void setId_billetera(int id_billetera) {
		this.id_billetera = id_billetera;
	}
	public int getId_cliente() {
		return id_cliente;
	}
	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}
	@Override
	public String toString() {
		return "Billetera [id_billetera=" + id_billetera + ", id_cliente=" + id_cliente + "]";
	}
	

}
