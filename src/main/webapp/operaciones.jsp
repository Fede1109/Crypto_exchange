<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="Criptos.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>HTML5 Admin Template</title>

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700"
	rel="stylesheet">

<!-- Template Styles -->
<link rel="stylesheet" href="assets/css/font-awesome.min.css">

<!-- CSS Reset -->
<link rel="stylesheet" href="assets/css/normalize.css">

<!-- Milligram CSS minified -->
<link rel="stylesheet" href="assets/css/milligram.min.css">

<!-- Main Styles -->
<link rel="stylesheet" href="assets/css/styles.css">

<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>

<body>
	<div class="navbar">
		<div class="row">
			<%
			//variables globales

			BDController BDCont = new BDController();
			String nombre = request.getParameter("nombre");
			String apellidos = request.getParameter("apellidos");
			String edad = request.getParameter("edad");
			String dni = request.getParameter("dni");
			String cp = request.getParameter("CP");
			String direccion = request.getParameter("direccion");
			String provincia = request.getParameter("provincia");
			String tipo = request.getParameter("tipo");
			String id_cliente = request.getParameter("cliente");
			String id_cripto = request.getParameter("cripto");
			String id_billetera = request.getParameter("billetera");
			String nombreCripto = request.getParameter("nombreCripto");
			String descripcion = request.getParameter("descripcion");
			String valor_en_euros = request.getParameter("euros");
			String capitalizacion = request.getParameter("capitalizacion");
			String l_billetera = request.getParameter("l_billetera");
			String codCriptoLB = request.getParameter("criptoLB");
			String codBilleteraLB = request.getParameter("billeteraLB");
			String cantidadLB = request.getParameter("cantidadCriptos");
			String idClienteCompra = request.getParameter("clienteCompra");
			String idCriptoCompra = request.getParameter("clienteCripto");
			String fechaCompra = request.getParameter("dateField");
			String horaCompra = request.getParameter("hourField");
			String valorCompra = request.getParameter("valorField");
			String idCompra = request.getParameter("compra");
			String idClienteCompraVisual = request.getParameter("idCompraCliente");
			String idCriptoCompraClienteVisual = request.getParameter("idCompraCripto");
			String cantidadCriptosCompra = request.getParameter("cantidadCriptosCompra");
			String nombreModifica = request.getParameter("nombreModifica");
			String apellidosModifica = request.getParameter("apellidosModifica");
			String edadModifica = request.getParameter("edadModifica");
			String dniModifica = request.getParameter("dniModifica");
			String cpModifica = request.getParameter("CPModifica");
			String direccionModifica = request.getParameter("direccionModifica");
			String provinciaModifica = request.getParameter("provinciaModifica");
			String id_clienteModifica = request.getParameter("id_clienteModifica");
			String nombreCriptoModifica = request.getParameter("nombreCriptoModifica");
			String descripcionModifica = request.getParameter("descripcionModifica");
			String valor_en_eurosModifica = request.getParameter("eurosModifica");
			String capitalizacionModifica = request.getParameter("capitalizacionModifica");
			String id_criptoModifica = request.getParameter("id_criptoModifica");
			String criptoModifica = request.getParameter("clienteCriptoModificado");
			String unidadesCriptoModifica = request.getParameter("unidadesModifica");
			String codClienteLB = request.getParameter("codClienteLB");
			String clienteCompraModificado = request.getParameter("clienteCompraModificado");
			String clienteCriptoModificado = request.getParameter("clienteCriptoModificado");
			String valorFieldModifica = request.getParameter("valorFieldModifica");
			String idCompraModifica = request.getParameter("idCompraModifica");
			
			String color = "";
			String mensaje = "";
			//ALTA CLIENTE
			if (tipo.equalsIgnoreCase("altacliente")) {
				
				if (BDCont.existeClienteDNI(dni) == false) {					
					BDCont.altaCliente(BDCont.maxCodCliente(), dni, nombre, apellidos, direccion, Integer.parseInt(cp), provincia);
					BDCont.altaBilletera(BDCont.maxCodBilletera(),BDCont.maxCodBilletera());					
					response.sendRedirect("index.jsp?mensaje=ok");
				}
			} else if (tipo.equalsIgnoreCase("bajacliente")) {
				if (BDCont.existeClienteID(Integer.parseInt(id_cliente))) {
					BDCont.eliminarLineaBilleterasCliente(Integer.parseInt(id_cliente));
					BDCont.eliminarComprasCliente(Integer.parseInt(id_cliente));
					BDCont.eliminarBilleterasCliente(Integer.parseInt(id_cliente));
					BDCont.eliminarCliente(Integer.parseInt(id_cliente));					
					response.sendRedirect("index.jsp?mensaje=ok");

				} else if (BDCont.existeClienteID(Integer.parseInt(id_cliente)) == false) {
					
				}
			} else if (tipo.equalsIgnoreCase("bajacripto")) {
				if (BDCont.existeCriptomoneda(Integer.parseInt(id_cripto))) {
					BDCont.eliminarLBilleteraCripto(Integer.parseInt(id_cripto));
					BDCont.eliminarComprasCripto(Integer.parseInt(id_cripto));
					BDCont.eliminarCripto(Integer.parseInt(id_cripto));
					response.sendRedirect("index.jsp?mensaje=ok");

				} else if (BDCont.existeCriptomoneda(Integer.parseInt(id_cripto)) == false) {
					
				}
			} else if (tipo.equalsIgnoreCase("bajaBilletera")) {
				if (BDCont.existeBilletera(Integer.parseInt(id_billetera))) {
					BDCont.eliminarLineaBilleterasBill(Integer.parseInt(id_billetera));					
					response.sendRedirect("index.jsp?mensaje=ok");

				} else if (BDCont.existeBilletera(Integer.parseInt(id_billetera)) == false) {
					response.sendRedirect("index.jsp?error=ok");
				}

			} else if (tipo.equalsIgnoreCase("altacripto")) {
				if (BDCont.existeCriptomonedaNombre(BDCont.maxCodCripto(), nombre) == false) {
					BDCont.altaCripto(BDCont.maxCodCripto(), nombreCripto, descripcion, Double.parseDouble(valor_en_euros),
					Double.parseDouble(capitalizacion));
					response.sendRedirect("index.jsp?mensaje=ok");
				} else if ((BDCont.existeCriptomonedaNombre(BDCont.maxCodCripto(), nombre))) {
					response.sendRedirect("index.jsp?error=ok");
				}
			} else if (tipo.equalsIgnoreCase("bajalBilletera")) {
				String[] partes = l_billetera.split("-");
				int idBilleteraLB = Integer.parseInt(partes[0]);
				int idCriptoLB = Integer.parseInt(partes[1]);
				if (BDCont.existeLBilletera(idCriptoLB, idBilleteraLB) == false) {
					response.sendRedirect("index.jsp?error=ok");
					
				} else if (BDCont.existeLBilletera(idCriptoLB, idBilleteraLB)) {
					BDCont.eliminarLBilletera(idCriptoLB, idBilleteraLB);
					response.sendRedirect("index.jsp?mensaje=ok");
				}
			} else if (tipo.equalsIgnoreCase("altaBilleteraLB")) {
				if (BDCont.existeLBilletera(Integer.parseInt(codCriptoLB), Integer.parseInt(codBilleteraLB))) {
					response.sendRedirect("index.jsp?error=ok");
					
				} else if (BDCont.existeLBilletera(Integer.parseInt(codCriptoLB), Integer.parseInt(codBilleteraLB)) == false) {
					BDCont.altaLBilletera(Integer.parseInt(codBilleteraLB), Integer.parseInt(codCriptoLB),
					Integer.parseInt(cantidadLB));
					response.sendRedirect("index.jsp?mensaje=ok");
				}
			} else if (tipo.equalsIgnoreCase("altacompra")) {
				double unidadesCompra = 0;
				Criptomoneda cripto = BDCont.dameCripto(Integer.parseInt(idCriptoCompra));
				double valorCripto = cripto.getValor_en_euros();
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
				String fechaActual = dtf.format(LocalDateTime.now());
				String fecha = fechaCompra + " " + horaCompra;
				unidadesCompra = Double.parseDouble(valorCompra) / valorCripto;
				 if (BDCont.existeCompra(BDCont.maxCodCompra())) {
					 response.sendRedirect("index.jsp?error=ok");
					 
				}else if (BDCont.existeCompra(BDCont.maxCodCompra())==false) {
				BDCont.altaCompra(BDCont.maxCodCompra(), Integer.parseInt(idClienteCompra),
						Integer.parseInt(idCriptoCompra), unidadesCompra, Double.parseDouble(valorCompra), fechaActual);
				if(BDCont.existeLBilletera(Integer.parseInt(idCriptoCompra), Integer.parseInt(idClienteCompra))){
					BDCont.updateLBilletera(Integer.parseInt(idCriptoCompra),Integer.parseInt(idClienteCompra),unidadesCompra);					
				}else if(BDCont.existeLBilletera(Integer.parseInt(idCriptoCompra), Integer.parseInt(idClienteCompra))==false){
					BDCont.altaLBilletera(Integer.parseInt(idClienteCompra), Integer.parseInt(idCriptoCompra), unidadesCompra);
				}
				response.sendRedirect("index.jsp?mensaje=ok");					
				}
			} else if (tipo.equalsIgnoreCase("bajacompra")) {
				if (BDCont.existeCompra(Integer.parseInt(idCompra))) {
					BDCont.bajaCompra(Integer.parseInt(idCompra));
					response.sendRedirect("index.jsp?mensaje=ok");
				} else if (BDCont.existeCompra(Integer.parseInt(idCompra)) == false) {
					response.sendRedirect("index.jsp?error=ok");
				}
			} else if (tipo.equalsIgnoreCase("compraCriptoVisual")) {
				Criptomoneda cripto = new Criptomoneda();
				cripto = BDCont.dameCripto(Integer.parseInt(idCriptoCompraClienteVisual));
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
				String fechaActual = dtf.format(LocalDateTime.now());
				if (BDCont.existeLBilletera(Integer.parseInt(idCriptoCompraClienteVisual),
				Integer.parseInt(idClienteCompraVisual))) {
					BDCont.updateLBilletera(Integer.parseInt(idCriptoCompraClienteVisual), Integer.parseInt(idClienteCompraVisual),
					Double.parseDouble(cantidadCriptosCompra));
					BDCont.altaCompra(BDCont.maxCodCompra(), Integer.parseInt(idClienteCompraVisual),
					Integer.parseInt(idCriptoCompraClienteVisual), Double.parseDouble(cantidadCriptosCompra),
					(Double.parseDouble(cantidadCriptosCompra) * cripto.getValor_en_euros()), fechaActual);
					response.sendRedirect("indexUsuario.jsp?mensaje=ok");
				} else if (BDCont.existeLBilletera(Integer.parseInt(idCriptoCompraClienteVisual),
				Integer.parseInt(idClienteCompraVisual)) == false) {
					BDCont.altaLBilletera(Integer.parseInt(idClienteCompraVisual), Integer.parseInt(idCriptoCompraClienteVisual),
					Double.parseDouble(cantidadCriptosCompra));
					BDCont.altaCompra(BDCont.maxCodCompra(), Integer.parseInt(idClienteCompraVisual),
					Integer.parseInt(idCriptoCompraClienteVisual), Double.parseDouble(cantidadCriptosCompra),
					(Double.parseDouble(cantidadCriptosCompra) * cripto.getValor_en_euros()), fechaActual);
					response.sendRedirect("indexUsuario.jsp?mensaje=ok");
				}

			}else if(tipo.equalsIgnoreCase("modificacliente")){
				BDCont.updateCliente(Integer.parseInt(id_clienteModifica), dniModifica, nombreModifica, apellidosModifica, direccionModifica, Integer.parseInt(cpModifica), provinciaModifica);
				response.sendRedirect("index.jsp?mensaje=ok");
				
			}else if(tipo.equalsIgnoreCase("modificacripto")){
					BDCont.updateCriptomoneda(Integer.parseInt(id_criptoModifica), nombreCriptoModifica, descripcionModifica, Double.parseDouble(valor_en_eurosModifica), Double.parseDouble(capitalizacionModifica));
					response.sendRedirect("index.jsp?mensaje=ok");								
			}else if(tipo.equalsIgnoreCase("modificaLBilletera")){				
					BDCont.updateLBilleteraIndex(Integer.parseInt(criptoModifica), Integer.parseInt(codClienteLB), Double.parseDouble(unidadesCriptoModifica));
					response.sendRedirect("index.jsp?mensaje=ok");
				
			}else if (tipo.equalsIgnoreCase("pdf_clientes")) {
				BDCont.crearPDFClientes();
				response.sendRedirect("indexUsuario.jsp?mensajePDF=Pdfcreado&pag=0");
			}else if(tipo.equalsIgnoreCase("pdf_criptos")){
				BDCont.crearPDFCriptos();
				response.sendRedirect("indexUsuario.jsp?mensajePDF=Pdfcreado&pag=0");
			}else if(tipo.equalsIgnoreCase("altacompraModifica")){
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
				String fechaActual = dtf.format(LocalDateTime.now());
				double unidadesCompraMod = 0;
				Criptomoneda cripto = BDCont.dameCripto(Integer.parseInt(clienteCriptoModificado));
				double valorCripto = cripto.getValor_en_euros();
				unidadesCompraMod = Double.parseDouble(valorFieldModifica) / valorCripto;
				BDCont.updateCompra(Integer.parseInt(clienteCriptoModificado), unidadesCompraMod, Double.parseDouble(valorFieldModifica),Integer.parseInt(idCompraModifica) ,Integer.parseInt(clienteCompraModificado));
				response.sendRedirect("index.jsp?mensaje=ok");
			}
			%>
			<div class="column column-30 col-site-title">
				<a href="#" class="site-title float-left">Medialoot</a>
			</div>
			<div class="column column-40 col-search">
				<a href="#" class="search-btn fa fa-search"></a> <input type="text"
					name="" value="" placeholder="Search..." />
			</div>
			<div class="column column-30">
				<div class="user-section">
					<a href="#"> <img src="http://via.placeholder.com/50x50"
						alt="profile photo" class="circle float-left profile-photo"
						width="50" height="auto">
						<div class="username">
							<h4>Jane Donovan</h4>
							<p>Administrator</p>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div id="sidebar" class="column">
			<h5>Menu</h5>
			<ul>
				<li><a href="#"><em class="fa fa-home"></em> Alta Cliente</a></li>
				<li><a href="#charts"><em class="fa fa-bar-chart"></em>
						Alta Billetera</a></li>
				<li><a href="#widgets"><em class="fa fa fa-clone"></em>
						Alta criptomoneda</a></li>
				<li><a href="#forms"><em class="fa fa-pencil-square-o"></em>Alta
						l_billetera</a></li>
				<li><a href="#alerts"><em class="fa fa-warning"></em> Baja
						Cliente</a></li>
				<li><a href="#buttons"><em class="fa fa-hand-o-up"></em>
						Baja Billetera</a></li>
				<li><a href="#tables"><em class="fa fa-table"></em> Baja
						criptomoneda</a></li>
				<li><a href="#grid"><em class="fa fa-columns"></em> Baja
						l_billetera</a></li>
			</ul>
		</div>
		<section id="main-content" class="column column-offset-20">
			<div class="row grid-responsive">
				<div class="column page-heading">
					<div class="large-card">
						<h1>Bievenido</h1>

						<h3 style="font-size: 20px; color:<%=color%>"><%=mensaje%></h3>



						</p>
					</div>
				</div>
			</div>

		</section>
	</div>

	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script>
		window.onload = function() {
			var chart1 = document.getElementById("line-chart").getContext("2d");
			window.myLine = new Chart(chart1).Line(lineChartData, {
				responsive : true,
				scaleLineColor : "rgba(0,0,0,.2)",
				scaleGridLineColor : "rgba(0,0,0,.05)",
				scaleFontColor : "#c5c7cc"
			});
			var chart2 = document.getElementById("bar-chart").getContext("2d");
			window.myBar = new Chart(chart2).Bar(barChartData, {
				responsive : true,
				scaleLineColor : "rgba(0,0,0,.2)",
				scaleGridLineColor : "rgba(0,0,0,.05)",
				scaleFontColor : "#c5c7cc"
			});
			var chart4 = document.getElementById("pie-chart").getContext("2d");
			window.myPie = new Chart(chart4).Pie(pieData, {
				responsive : true,
				segmentShowStroke : false
			});
			var chart5 = document.getElementById("radar-chart")
					.getContext("2d");
			window.myRadarChart = new Chart(chart5).Radar(radarData, {
				responsive : true,
				scaleLineColor : "rgba(0,0,0,.05)",
				angleLineColor : "rgba(0,0,0,.2)"
			});
			var chart6 = document.getElementById("polar-area-chart")
					.getContext("2d");
			window.myPolarAreaChart = new Chart(chart6).PolarArea(polarData, {
				responsive : true,
				scaleLineColor : "rgba(0,0,0,.2)",
				segmentShowStroke : false
			});
		};
	</script>

</body>
</html>
