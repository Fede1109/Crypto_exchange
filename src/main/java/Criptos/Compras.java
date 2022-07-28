package Criptos;

import java.sql.Date;

public class Compras {
	private int id_compra;
	private int id_cliente;
	private int id_criptomoneda;
	private double unidades;
	private double valor_en_euros;
	private Date fecha_hora;
	public Compras() {
		super();
	}
	public Compras(int id_compra, int id_cliente, int id_criptomoneda, double unidades, double valor_en_euros,
			Date fecha_hora) {
		super();
		this.id_compra = id_compra;
		this.id_cliente = id_cliente;
		this.id_criptomoneda = id_criptomoneda;
		this.unidades = unidades;
		this.valor_en_euros = valor_en_euros;
		this.fecha_hora = fecha_hora;
	}
	public int getId_compra() {
		return id_compra;
	}
	public void setId_compra(int id_compra) {
		this.id_compra = id_compra;
	}
	public int getId_cliente() {
		return id_cliente;
	}
	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}
	public int getId_criptomoneda() {
		return id_criptomoneda;
	}
	public void setId_criptomoneda(int id_criptomoneda) {
		this.id_criptomoneda = id_criptomoneda;
	}
	public double getUnidades() {
		return unidades;
	}
	public void setUnidades(double unidades) {
		this.unidades = unidades;
	}
	public double getValor_en_euros() {
		return valor_en_euros;
	}
	public void setValor_en_euros(double valor_en_euros) {
		this.valor_en_euros = valor_en_euros;
	}
	public Date getFecha_hora() {
		return fecha_hora;
	}
	public void setFecha_hora(Date fecha_hora) {
		this.fecha_hora = fecha_hora;
	}
	@Override
	public String toString() {
		return "Compras [id_compra=" + id_compra + ", id_cliente=" + id_cliente + ", id_criptomoneda=" + id_criptomoneda
				+ ", unidades=" + unidades + ", valor_en_euros=" + valor_en_euros + ", fecha_hora=" + fecha_hora + "]";
	}
	

}
