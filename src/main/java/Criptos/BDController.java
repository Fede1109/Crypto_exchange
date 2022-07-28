package Criptos;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;

import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Text;


public class BDController {
	private Connection conexion;
	public BDController() {
		super();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			this.conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/criptomonedas", "root", "");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en la conexión del Constructor vacío del BDController");
		}
	}

	public Connection getConexion() {
		return conexion;
	}


	/**
	 * @param conexion the conexion to set
	 */
	public void setConexion(Connection conexion) {
		this.conexion = conexion;
	}

	public boolean existeClienteDNI(String dni) {
		boolean existe = false;
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM clientes where dni = '" + dni +"'");
			while(rs.next()==true) {
				existe = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método existeCliente");
		}

		return existe;
	}

	public boolean existeClienteID(int cod) {
		boolean existe = false;
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM clientes where id_cliente = '" + cod +"'");
			while(rs.next()==true) {
				existe = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método existeCliente");
		}

		return existe;
	}
	public boolean existeBilletera(int cod) {
		boolean existe = false;
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM billetera where id_billetera = '" + cod +"'");
			while(rs.next()==true) {
				existe = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método existeBilletera");
		}

		return existe;
	}
	public boolean existeCompra(int cod) {
		boolean existe = false;
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM compras where id_compra = '" + cod +"'");
			while(rs.next()==true) {
				existe = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método existeCompras");
		}

		return existe;
	}
	public boolean existeCriptomoneda(int cod) {
		boolean existe = false;
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM criptomoneda where id_criptomoneda = '" + cod +"'");
			while(rs.next()==true) {
				existe = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método existeCriptomoneda");
		}

		return existe;
	}

	public boolean existeCriptomonedaNombre(int cod, String nombre) {
		boolean existe = false;
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM criptomoneda where id_criptomoneda = '" + cod +"' and nombre like '"+nombre+"'");
			while(rs.next()==true) {
				existe = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método existeCriptomoneda");
		}

		return existe;
	}
	public boolean existeLBilletera(int codCripto, int codBilletera) {
		boolean existe = false;
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM l_billetera where id_criptomoneda = '" + codCripto +"' and id_billetera = '"+codBilletera+"'");
			while(rs.next()==true) {
				existe = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método existeLBilletera");
		}

		return existe;
	}
	public ArrayList<Billetera> todasBilleteras() {
		ArrayList<Billetera> billeteras = new ArrayList<Billetera>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM billetera");

			while (rs.next() == true) {
				Billetera bill = new Billetera(rs.getInt("id_cliente"), rs.getInt("id_billetera"));
				billeteras.add(bill);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método todasBilleteras");
		}
		return billeteras;
	}
	public ArrayList<Cliente> todosClientes() {
		ArrayList<Cliente> clientes = new ArrayList<Cliente>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM clientes");

			while (rs.next() == true) {
				Cliente cli = new Cliente(rs.getInt("id_cliente"),rs.getString("dni"),rs.getString("nombre"),rs.getString("apellidos"),rs.getString("direccion") ,rs.getInt("CP"),rs.getString("provincia"));
				clientes.add(cli);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método todosClientes");
		}
		return clientes;
	}
	public ArrayList<Compras> todasCompras() {
		ArrayList<Compras> compras = new ArrayList<Compras>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM compras");

			while (rs.next() == true) {
				Compras com = new Compras(rs.getInt("id_compra"),rs.getInt("id_cliente"),rs.getInt("id_criptomoneda"),rs.getDouble("unidades"),rs.getDouble("valor_en_euros"),rs.getDate("fecha_hora"));
				compras.add(com);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método todasCompras");
		}
		return compras;
	}
	public ArrayList<Criptomoneda> todasCriptomonedas() {
		ArrayList<Criptomoneda> criptomonedas = new ArrayList<Criptomoneda>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM criptomoneda");

			while (rs.next() == true) {
				Criptomoneda cripto = new Criptomoneda(rs.getInt("id_criptomoneda"),rs.getString("nombre"),rs.getString("descripcion"),rs.getDouble("valor_en_euros"),rs.getDouble("capitalizacion"));
				criptomonedas.add(cripto);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método todasCriptomonedas");
		}
		return criptomonedas;
	}
	public ArrayList<L_billetera> todasLineasBilleteras() {
		ArrayList<L_billetera> l_billeteras = new ArrayList<L_billetera>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM l_billetera");

			while (rs.next() == true) {
				L_billetera L_bill = new L_billetera(rs.getInt("id_billetera"), rs.getInt("id_criptomoneda"), rs.getDouble("unidades"));
				l_billeteras.add(L_bill);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método todasLineasBilleteras");
		}
		return l_billeteras;
	}
	public Billetera dameBilletera(int codCripto, int codBill){
		Billetera bill = new Billetera();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM billetera where id_billetera = '" + codBill +"' and id_criptomoneda = '"+codCripto+"'");
			while(rs.next()==true) {
				bill = new Billetera(rs.getInt("id_cliente"), rs.getInt("id_billetera"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método dameBilletera");
		}
		return bill;
	}
	public Cliente dameCliente(int cod){
		Cliente cli = new Cliente();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM clientes where id_cliente = '" + cod +"'");
			while(rs.next()==true) {
				cli = new Cliente(rs.getInt("id_cliente"),rs.getString("dni"),rs.getString("nombre"),rs.getString("apellidos"),rs.getString("direccion") ,rs.getInt("CP"),rs.getString("provincia"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método dameCliente");
		}
		return cli;
	}

	public Cliente dameClienteBilletera(int cod){
		Cliente cli = new Cliente();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from clientes, billetera WHERE billetera.id_cliente = clientes.id_cliente and clientes.id_cliente = '" + cod +"'");
			while(rs.next()==true) {
				cli = new Cliente(rs.getInt("id_cliente"),rs.getString("dni"),rs.getString("nombre"),rs.getString("apellidos"),rs.getString("direccion") ,rs.getInt("CP"),rs.getString("provincia"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método dameClienteBilletera");
		}
		return cli;
	}
	public Compras dameCompra(int cod){
		Compras comp = new Compras();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM compras where id_compra = '" + cod +"'");
			while(rs.next()==true) {
				comp = new Compras(rs.getInt("id_compra"),rs.getInt("id_cliente"),rs.getInt("id_criptomoneda"),rs.getDouble("unidades"),rs.getDouble("valor_en_euros"),rs.getDate("fecha_hora"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método dameCompra");
		}
		return comp;
	}

	public Criptomoneda dameCripto(int cod){
		Criptomoneda cripto = new Criptomoneda();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM criptomoneda where id_criptomoneda = '" + cod +"'");
			while(rs.next()==true) {
				cripto = new Criptomoneda(rs.getInt("id_criptomoneda"),rs.getString("nombre"),rs.getString("descripcion"),rs.getDouble("valor_en_euros"),rs.getDouble("capitalizacion"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método dameCripto");
		}
		return cripto;
	}
	public L_billetera dameLineabilletera(int codCripto,  int idBilletera){
		L_billetera l_bill = new L_billetera();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM l_billetera where id_criptomoneda = '" + codCripto +"' and id_billetera = '"+idBilletera+"'");
			while(rs.next()==true) {
				l_bill = new L_billetera(rs.getInt("id_billetera"), rs.getInt("id_criptomoneda"), rs.getDouble("unidades"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método dameLineabilletera");
		}
		return l_bill;
	}
	public Billetera dameBilleteraCliente(int cod){
		Billetera bill = new Billetera();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM billetera where id_cliente = '" + cod +"'");
			while(rs.next()==true) {
				bill = new Billetera(rs.getInt("id_cliente"), rs.getInt("id_billetera"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método dameBilleteraCliente");
		}
		return bill;
	}
	public Compras dameCompraCliente(int cod){
		Compras comp = new Compras();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM compras where id_cliente = '" + cod +"'");
			while(rs.next()==true) {
				comp = new Compras(rs.getInt("id_compra"),rs.getInt("id_cliente"),rs.getInt("id_criptomoneda"),rs.getDouble("unidades"),rs.getDouble("valor_en_euros"),rs.getDate("fecha_hora"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método dameCompraCliente");
		}
		return comp;
	}
	public ArrayList<L_billetera> dameLineasbilleteraBilleteraPaginadas(int cod, int elementoActual){
		ArrayList<L_billetera> l_billeteras = new ArrayList<L_billetera>();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM l_billetera where id_billetera = '" + cod +"' limit "+elementoActual+","+ 5 + ";");
			while(rs.next()==true) {
				L_billetera l_bill = new L_billetera(rs.getInt("id_billetera"), rs.getInt("id_criptomoneda"), rs.getDouble("unidades"));
				l_billeteras.add(l_bill);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método dameLineabilletera");
		}
		return l_billeteras;
	}

	public int maxCodCliente() {
		int cod = 0;
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select max(id_cliente) from clientes");
			while(rs.next() == true) {
				cod = rs.getInt("max(id_cliente)");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cod = cod+1;
		return cod;
	}

	public void altaCliente(int codigo,String DNI, String nombre, String apellidos, String direccion, int cp, String provincia) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Insert into clientes (id_cliente, dni, nombre, apellidos, direccion,CP, provincia)"
					+ "values ('" + codigo  + "','" + DNI + "','" + nombre + "' ,'" + apellidos
					+ "','" + direccion + "','" + cp + "','" + provincia + "')";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en consulta altaClienter en BDController");
		}
	}
	public void eliminarCliente(int codigo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Delete from clientes where id_cliente = " + codigo + "";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en consulta eliminarCliente en BDController");
		}
	}
	public void eliminarComprasCliente(int codigo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Delete from compras where id_cliente = " + codigo + "";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en consulta eliminarComprasCliente en BDController");
		}
	}
	public void eliminarBilleterasCliente(int codigo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Delete  from l_billetera where id_cliente = " + codigo + "";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en consulta eliminarBilleterasCliente en BDController");
		}
	}
	public void eliminarLineaBilleterasCliente(int codigo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena =("Delete  l_billetera from l_billetera, billetera, clientes where  l_billetera.id_billetera=billetera.id_billetera and billetera.id_cliente= clientes.id_cliente and clientes.id_cliente='"+codigo+"'");
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en consulta eliminarLineaBilleterasCliente en BDController");
		}
	}

	public void eliminarLineaBilleterasBill(int codigo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena =("Delete  l_billetera from l_billetera, billetera where l_billetera.id_billetera=billetera.id_billetera and billetera.id_billetera ='"+codigo+"'");
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en consulta eliminarLineaBilleterasBill en BDController");
		}
	}
	public void eliminarCripto(int codigo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Delete from criptomoneda where id_criptomoneda = " + codigo + "";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en consulta eliminarCripto en BDController");
		}
	}
	public void eliminarComprasCripto(int codigo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Delete from compras where id_criptomoneda = " + codigo + "";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en consulta eliminarComprasCripto en BDController");
		}
	}
	public void eliminarLBilleteraCripto(int codigo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Delete from l_billetera where id_criptomoneda = " + codigo + "";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en consulta eliminarLBilleteraCripto en BDController");
		}
	}
	public void eliminarLBilletera(int codigoCripto, int codigoBilletera) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Delete from l_billetera where id_criptomoneda = " + codigoCripto + " and id_billetera = '"+codigoBilletera+"'";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en consulta eliminarLBilleteraCripto en BDController");
		}
	}
	public void eliminarBilletera(int codigo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Delete from billetera where id_billetera = " + codigo + "";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en consulta eliminarBilletera en BDController");
		}
	}
	public  int maxCodCripto() {
		int cod = 0;
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select max(id_criptomoneda) from criptomoneda");
			while(rs.next() == true) {
				cod = rs.getInt("max(id_criptomoneda)");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cod = cod+1;
		return cod;
	}
	public void altaCripto(int cod, String nombre, String descripcion, double valor_en_euros, double capitalizacion){
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Insert into criptomoneda (id_criptomoneda, nombre, descripcion, valor_en_euros, capitalizacion)"
					+ "values ('" + cod  + "','" + nombre + "','" + descripcion + "' ,'" + valor_en_euros
					+ "','" + capitalizacion + "')";
			miStatement.executeUpdate(cadena);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método altaCripto");
		}
	}
	public Billetera dameBilleteraslBilletera(int cod){
		Billetera bill = new Billetera();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM l_billetera where id_billetera = '" + cod +"'");
			while(rs.next()==true) {
				bill = new Billetera(rs.getInt("id_cliente"), rs.getInt("id_billetera"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método dameBilleteralBilletera");
		}
		return bill;
	}
	public void altaLBilletera(int codBilletera, int codCripto, double cantidadCripto){
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena ="Insert into l_billetera(id_billetera, id_criptomoneda, unidades) values ('"+codBilletera+"', '"+codCripto+"', '"+cantidadCripto+"')"; 
			miStatement.executeUpdate(cadena);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método altaLBilletera");
		}
	}
	public  int maxCodCompra() {
		int cod = 0;
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select max(id_compra) from compras");
			while(rs.next() == true) {
				cod = rs.getInt("max(id_compra)");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cod = cod+1;
		return cod;
	}
	public void altaCompra(int idCompra,int codCliente, int id_criptomoneda, double unidades, double valor_en_euros, String fecha){
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			String cadena =  "Insert into compras(id_compra, id_cliente, id_criptomoneda, unidades, valor_en_euros, fecha_hora) values ('"+idCompra+"','"+codCliente+"', '"+id_criptomoneda+"', '"+unidades+"', '"+valor_en_euros+"', +'"+fecha+"') ";
			miStatement.executeUpdate(cadena);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método altaCompra");
		}
	}
	public void bajaCompra(int cod) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String cadena = "Delete from compras where id_compra = "+ cod+"";
			miStatement.executeUpdate(cadena);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en consulta bajaCompra en BDController");
		}
	}


	public ArrayList<Criptomoneda> Top3Criptos(){
		ArrayList<Criptomoneda> criptomonedas = new ArrayList<Criptomoneda>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM `criptomoneda` ORDER BY `criptomoneda`.`valor_en_euros` DESC limit 3");

			while (rs.next() == true) {
				Criptomoneda cripto = new Criptomoneda(rs.getInt("id_criptomoneda"),rs.getString("nombre"),rs.getString("descripcion"),rs.getDouble("valor_en_euros"),rs.getDouble("capitalizacion"));
				criptomonedas.add(cripto);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método Top3Criptos");
		}
		return criptomonedas;

	}

	public ArrayList<Compras> rankingClientesCompras() {
		ArrayList<Compras> topCompras = new ArrayList<Compras>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from compras GROUP by id_cliente order by COUNT(id_cliente) DESC, valor_en_euros DESC limit 3");
			while (rs.next() == true) {
				Compras compr = new Compras(rs.getInt("id_compra"),rs.getInt("id_cliente"),rs.getInt("id_criptomoneda"),rs.getDouble("unidades"),rs.getDouble("valor_en_euros"),rs.getDate("fecha_hora"));;
				topCompras.add(compr);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método rankingClientesCompras");
		}
		return topCompras;
	}

	public double maxCompra(int idCliente) {		
		double maxCompra = 0;
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select max(valor_en_euros) from compras where id_cliente = '"+idCliente+"'");
			while(rs.next() == true) {
				maxCompra = rs.getInt("max(valor_en_euros)");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return maxCompra;
	}

	public int cantidadCompra(int idCliente) {
		int cantidadCompra = 0;
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select count(id_cliente) from compras where id_cliente = '"+idCliente+"'");
			while(rs.next() == true) {
				cantidadCompra = rs.getInt("count(id_cliente)");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cantidadCompra;
	}



	public ArrayList<Criptomoneda> Top8Criptos(){
		ArrayList<Criptomoneda> criptomonedas = new ArrayList<Criptomoneda>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM `criptomoneda` order by id_criptomoneda limit 8; ");

			while (rs.next() == true) {
				Criptomoneda cripto = new Criptomoneda(rs.getInt("id_criptomoneda"),rs.getString("nombre"),rs.getString("descripcion"),rs.getDouble("valor_en_euros"),rs.getDouble("capitalizacion"));
				criptomonedas.add(cripto);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método Top3Criptos");
		}
		return criptomonedas;
	}


	public ArrayList<L_billetera> dameLBCliente(int cod){
		ArrayList<L_billetera> l_billeteras = new ArrayList<L_billetera>();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from l_billetera where id_billetera = (SELECT id_billetera from billetera where id_cliente = (SELECT id_cliente from clientes where id_cliente = '"+cod+"')); ");
			while(rs.next()==true) {
				L_billetera l_bill = new L_billetera(rs.getInt("id_billetera"), rs.getInt("id_criptomoneda"), rs.getDouble("unidades"));
				l_billeteras.add(l_bill);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método dameLBCliente");
		}
		return l_billeteras;
	}



	public ArrayList<Compras> comprasClientes(int cod) {
		ArrayList<Compras> topCompras = new ArrayList<Compras>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM `compras` WHERE compras.id_cliente = '"+cod+"'");
			while (rs.next() == true) {
				Compras compr = new Compras(rs.getInt("id_compra"),rs.getInt("id_cliente"),rs.getInt("id_criptomoneda"),rs.getDouble("unidades"),rs.getDouble("valor_en_euros"),rs.getDate("fecha_hora"));;
				topCompras.add(compr);
			}
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método comprasClientes");
		}
		return topCompras;
	}

	public void updateLBilletera(int codCripto, int codBilletera, double unidades) {	
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();			
			miStatement.executeUpdate("UPDATE l_billetera set unidades= unidades +'"+unidades+"' where id_billetera = '"+codBilletera+"' and id_criptomoneda = '"+codCripto+"'; ");			
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método updateLBilletera");
		}	
	}
	public void updateLBilleteraIndex(int codCripto, int codBilletera, double unidades) {	
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();			
			miStatement.executeUpdate("UPDATE l_billetera set unidades= '"+unidades+"' where id_billetera = '"+codBilletera+"' and id_criptomoneda = '"+codCripto+"'; ");			
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método updateLBilletera");
		}	
	}

	public void updateCliente(int codCliente,String dni,String nombre, String apellidos,String direccion, int CP, String provincia) {	
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();			
			miStatement.executeUpdate("UPDATE clientes set dni= '"+dni+"', nombre = '"+nombre+"', apellidos = '"+apellidos+"', cp = '"+CP+"', direccion = '"+direccion+"',provincia = '"+provincia+"' where id_cliente= '"+codCliente+"'");			
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método updateCliente");
		}	
	}
	public void updateCriptomoneda(int id_cripto,String nombre,String descripcion, double valor_en_euros,double capitalizacion) {	
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();			
			miStatement.executeUpdate("UPDATE criptomoneda set nombre = '"+nombre+"', descripcion = '"+descripcion+"', valor_en_euros = '"+valor_en_euros+"', capitalizacion = '"+capitalizacion+"'where id_criptomoneda = '"+id_cripto+"'");

			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método updateCriptomoneda");
		}	
	}

	public void updateCompra(int id_cripto,double unidades, double valor_en_euros, int idCompra, int idCliente) {	
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			
			miStatement.executeUpdate("UPDATE compras set id_criptomoneda = '"+id_cripto+"', unidades = '"+unidades+"', valor_en_euros = '"+valor_en_euros+"', id_cliente = '"+idCliente+"' where id_compra = '"+idCompra+"'");
			
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método updateCompra");
		}	
	}

	public Cliente dameClienteDNI(int cod){
		Cliente cli = new Cliente();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM clientes where dni = '" + cod +"'");
			while(rs.next()==true) {
				cli = new Cliente(rs.getInt("id_cliente"),rs.getString("dni"),rs.getString("nombre"),rs.getString("apellidos"),rs.getString("direccion") ,rs.getInt("CP"),rs.getString("provincia"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método dameClienteDNI");
		}
		return cli;
	}


	public Hashtable<Integer, Cliente> todosClientesHasht() {
		Cliente cli = new Cliente();
		Hashtable<Integer, Cliente> clientes = new Hashtable<Integer, Cliente>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from clientes;");
			while (rs.next()) {
				cli = new Cliente(rs.getInt("id_cliente"),rs.getString("dni"),rs.getString("nombre"),rs.getString("apellidos"),rs.getString("direccion") ,rs.getInt("CP"),rs.getString("provincia"));
				clientes.put(rs.getInt("id_cliente"), cli);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error en todosClientesHasht en BDController");
		}

		return clientes;

	}

	public Hashtable<Integer, Criptomoneda> todasCriptosHasht() {
		Criptomoneda cripto = new Criptomoneda();
		Hashtable<Integer, Criptomoneda> criptomonedas = new Hashtable<Integer, Criptomoneda>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from criptomoneda;");
			while (rs.next()) {
				cripto = new Criptomoneda(rs.getInt("id_criptomoneda"),rs.getString("nombre"),rs.getString("descripcion"),rs.getDouble("valor_en_euros"),rs.getDouble("capitalizacion"));
				criptomonedas.put(rs.getInt("id_criptomoneda"), cripto);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error en todasCriptosHasht en BDController");
		}

		return criptomonedas;

	}


	public void crearPDFClientes() {
		File fichero = new File ("C:\\Users\\fdiaz\\Desktop/Clientes.pdf");
		try {
			PdfWriter pdfWritter = new PdfWriter(fichero);
			PdfDocument pdf = new PdfDocument(pdfWritter);
			Document document  = new Document(pdf,PageSize.A4);
			Paragraph tittle = new Paragraph();
			tittle.add(new Text("Listado de Clientes").setFontSize(20));

			document.add(tittle);
			Hashtable<Integer, Cliente> clientes = todosClientesHasht();

			Enumeration eCli = clientes.elements();
			while(eCli.hasMoreElements()) {
				Cliente aux = (Cliente) eCli.nextElement();
				String ruta_img ="C:\\Users\\fdiaz\\eclipse-workspace\\ProyectoWebFinalCriptos\\src\\main\\webapp\\assets\\images\\avatars\\"+ aux.getId_cliente() + ".png";
				Image imagenes = new Image(ImageDataFactory.create(ruta_img));
				PdfFont font =  PdfFontFactory.createFont(StandardFonts.TIMES_ROMAN);
				Paragraph p = new Paragraph();
				p.add(imagenes.setHeight(100).setWidth(100));
				p.add(new Text("\n" + aux.getNombre()));  
				p.add(new Text("\n Apellidos: "));
				p.add(new Text(aux.getApellidos()));
				p.add(new Text("\n Dni: "));
				p.add(new Text(aux.getDni()));
				p.add(new Text("\n Direccion: "));
				p.add(new Text(aux.getDireccion()));
				p.add(new Text("\n Provincia: "));
				p.add(new Text(aux.getProvincia()));
				document.add(p);
			}
			document.close();
			pdf.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void crearPDFCriptos() {
		File fichero = new File ("C:\\Users\\fdiaz\\Desktop/Criptos.pdf");
		try {
			PdfWriter pdfWritter = new PdfWriter(fichero);
			PdfDocument pdf = new PdfDocument(pdfWritter);
			Document document  = new Document(pdf,PageSize.A4);
			Paragraph tittle = new Paragraph();
			tittle.add(new Text("Listado de criptomonedas").setFontSize(20));

			document.add(tittle);
			Hashtable<Integer, Criptomoneda> criptos = todasCriptosHasht();

			Enumeration eCripto = criptos.elements();
			while(eCripto.hasMoreElements()) {
				Criptomoneda aux = (Criptomoneda) eCripto.nextElement();
				String ruta_img ="C:\\Users\\fdiaz\\eclipse-workspace\\ProyectoWebFinalCriptos\\src\\main\\webapp\\images\\criptos\\"+ aux.getId_crypto() + ".png";
				Image imagenes = new Image(ImageDataFactory.create(ruta_img));
				PdfFont font =  PdfFontFactory.createFont(StandardFonts.TIMES_ROMAN);
				Paragraph p = new Paragraph();
				p.add(imagenes.setHeight(100).setWidth(100));
				p.add(new Text("\n" + aux.getNombre()));  
				p.add(new Text("\n Nombre: "));
				p.add(new Text(aux.getNombre()));
				p.add(new Text("\n Descripcion: "));
				p.add(new Text(aux.getDescription()));
				p.add(new Text("\n Capitalización: "));
				p.add(new Text(Double.toString(aux.getCapitalizacion())));
				p.add(new Text("\n Valor en Euros: "));
				p.add(new Text(Double.toString(aux.getValor_en_euros())));
				document.add(p);
			}
			document.close();
			pdf.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<Cliente> dameTodosClientesPaginados(int elementoActual) {
		ArrayList<Cliente> clientesEncontrados = new ArrayList<Cliente>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from clientes limit " + elementoActual+","+ 8 + ";");
			while (rs.next()==true) {
				Cliente cliEncontrado = new Cliente(rs.getInt("id_cliente"),rs.getString("dni"),rs.getString("nombre"),rs.getString("apellidos"),rs.getString("direccion") ,rs.getInt("CP"),rs.getString("provincia"));
				clientesEncontrados.add(cliEncontrado);
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameTodosClientesPaginados en BDController");
		}
		return clientesEncontrados;
	}
	
	public ArrayList<Criptomoneda> dameTodosCriptossPaginados(int elementoActual) {
		ArrayList<Criptomoneda> criptos = new ArrayList<Criptomoneda>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from criptomoneda limit " + elementoActual+","+ 8 + ";");
			while (rs.next()==true) {
				Criptomoneda cripto = new Criptomoneda(rs.getInt("id_criptomoneda"),rs.getString("nombre"),rs.getString("descripcion"),rs.getDouble("valor_en_euros"),rs.getDouble("capitalizacion"));
				criptos.add(cripto);
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameTodosClientesPaginados en BDController");
		}
		return criptos;
	}

	public ArrayList<Billetera> dameTodosBilleterasPaginados(int elementoActual) {
		ArrayList<Billetera> billeteras = new ArrayList<Billetera>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from billetera limit " + elementoActual+","+ 5 + ";");
			while (rs.next()==true) {
				Billetera bill = new Billetera(rs.getInt("id_cliente"), rs.getInt("id_billetera"));
				billeteras.add(bill);
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameTodosBilleterasPaginados en BDController");
		}
		return billeteras;
	}
	

	public ArrayList<Compras> dameTodosComprasPaginados(int elementoActual) {
		ArrayList<Compras> compras = new ArrayList<Compras>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from compras limit " + elementoActual+","+ 5 + ";");
			while (rs.next()==true) {
				Compras com = new Compras(rs.getInt("id_compra"),rs.getInt("id_cliente"),rs.getInt("id_criptomoneda"),rs.getDouble("unidades"),rs.getDouble("valor_en_euros"),rs.getDate("fecha_hora"));
				compras.add(com);
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameTodosComprasPaginados en BDController");
		}
		return compras;
	}
	
	public ArrayList<L_billetera> dameTodosLineaBilleterasPaginados(int elementoActual) {
		ArrayList<L_billetera> l_billeteras = new ArrayList<L_billetera>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select * from l_billetera limit " + elementoActual+","+ 5 + ";");
			while (rs.next()==true) {
				L_billetera L_bill = new L_billetera(rs.getInt("id_billetera"), rs.getInt("id_criptomoneda"), rs.getDouble("unidades"));
				l_billeteras.add(L_bill);
			}
			rs.close();
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en bdcontroller en metodo dameTodosLineaBilleterasPaginados en BDController");
		}
		return l_billeteras;
	}
	
	
	public void altaBilletera(int codCLiente, int codBilletera) {
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			String cadena =  "Insert into billetera (id_cliente,id_billetera) values ('"+codCLiente+"','"+codBilletera+"')";
			miStatement.executeUpdate(cadena);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en BDController en método altaBilletera");
		}
	}
	public int maxCodBilletera() {
		int cod = 0;
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("Select max(id_billetera) from billetera");
			while(rs.next() == true) {
				cod = rs.getInt("max(id_billetera)");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cod = cod+1;
		return cod;
	}

}

