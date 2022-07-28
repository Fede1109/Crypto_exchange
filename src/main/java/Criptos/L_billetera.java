package Criptos;

public class L_billetera {
	private int id_billetera;
	private int id_criptomoneda;
	private double unidades;
	public L_billetera() {
		super();
	}
	public L_billetera(int id_billetera, int id_criptomoneda, double unidades) {
		super();
		this.id_billetera = id_billetera;
		this.id_criptomoneda = id_criptomoneda;
		this.unidades = unidades;
	}
	public int getId_billetera() {
		return id_billetera;
	}
	public void setId_billetera(int id_billetera) {
		this.id_billetera = id_billetera;
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
	@Override
	public String toString() {
		return "L_billetera [id_billetera=" + id_billetera + ", id_criptomoneda=" + id_criptomoneda + ", unidades="
				+ unidades + "]";
	}
	

}
