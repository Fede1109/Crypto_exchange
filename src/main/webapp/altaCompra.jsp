<%@ page import="Criptos.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*"%>
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
<link rel="stylesheet" href="./assets/css/main.css" />
<link rel="stylesheet" href="assets/css/dd.css?v=4.0">

<!-- CSS Reset -->
<link rel="stylesheet" href="assets/css/normalize.css">

<!-- Milligram CSS minified -->
<link rel="stylesheet" href="assets/css/milligram.min.css">

<!-- Main Styles -->
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="shortcut icon" href="assets/images/favicon.ico"type="image/x-icon">

<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>

<body>
	<%
	BDController BDCont = new BDController();
	ArrayList<Cliente> clientes = BDCont.todosClientes();
	ArrayList<Criptomoneda> criptos = BDCont.todasCriptomonedas();
	%>
	<div class="navbar">
		<div class="row">
			<div class="column column-30 col-site-title">
				<a href="index.jsp" class="site-title float-left">Medialoot</a>
			</div>
			<div class="column column-40 col-search">
				<a href="#" class="search-btn fa fa-search"></a> <input type="text"
					name="" value="" placeholder="Search..." />
			</div>
			<div class="column column-30">
				<div class="user-section">
					<a href="#"> <img src="assets/images/avatars/4.png"
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
			<h5>Navigation</h5>
			<ul>
				<li><a href="altacliente.jsp"><em class="fa fa-hand-o-up"></em> Alta Cliente</a></li>
				<li><a href="bajacliente.jsp"><em class="fa fa-warning"></em> Baja Cliente</a></li>
				<li><a href="listadoClientes.jsp"><em class="fa  fa-pencil-square-o"></em> Modificar Cliente</a></li>
				<li><a href="altaCriptomoneda.jsp"><em class="fa fa-hand-o-up"></em> Alta Criptomoneda</a></li>
				<li><a href="bajaCriptomoneda.jsp"><em class="fa fa-warning"></em> Baja Criptomoneda</a></li>
				<li><a href="listadoCriptomonedas.jsp"><em class="fa fa-pencil-square-o"></em> Modificar Criptomoneda</a></li>				
				<li><a href="bajaBilletera.jsp"><em class="fa fa-warning"></em> Baja Billetera</a></li>
				<li><a href="listadoBilleteras.jsp"><em class="fa fa-pencil-square-o"></em> Listado Billeteras</a></li>
				<li><a href="altaCompra.jsp"><em class="fa fa-hand-o-up"></em> Alta Compra</a></li>
				<li><a href="bajaCompra.jsp"><em class="fa fa-warning"></em> Baja Compra</a></li>
				<li><a href="listadoCompras.jsp	"><em class="fa fa-pencil-square-o"></em> Modificar Compra</a></li>
			</ul>
		</div>
		<section id="main-content" class="column column-offset-20">
			<div class="row grid-responsive">
				<div class="column page-heading">
					<div class="large-card">
						<h1>Alta Compra</h1>
						<p class="text-large">Aqu?? podra realizar el alta de las nuevas compras</p>
					</div>
					<div class="row grid-responsive">
						<div class="column ">
							<div class="card">
								<div class="card-title">
									<h3>Nueva Compra</h3>
								</div>
								<div class="card-block">
									<form action="operaciones.jsp?tipo=altacompra" method="post"
										id="formularioCompleto">
										<fieldset id="bloque">
											<div class="datos">
												<div class="elementosDerecha" style="width: 45%">
													<div class="dropdown"style="display: flex;flex-direction: column;gap: 2rem;">
														<select required id="clienteCompra" name="clienteCompra"
															is="ms-dropdown" style="width: 400px"
															data-child-height="400">
															<option value="">Seleccione un cliente</option>
															<%
															for (int i = 0; i < clientes.size(); i++) {
															%>

															<option value="<%=clientes.get(i).getId_cliente()%>"
																data-image="assets/images/avatars/<%=clientes.get(i).getId_cliente()%>.png"><%=clientes.get(i).getNombre()%></option>
															<%
															}
															%>
														</select> <select required id="clienteCripto" name="clienteCripto"
															is="ms-dropdown" style="width: 400px"
															data-child-height="400">
															<option value="">Seleccione una criptomoneda</option>
															<%
															for (int i = 0; i < criptos.size(); i++) {
															%>

															<option value="<%=criptos.get(i).getId_crypto()%>"
																data-image="images/criptos/<%=criptos.get(i).getId_crypto()%>.png"><%=criptos.get(i).getNombre()%></option>
															<%
															}
															%>
														</select> <label for="valorField">Valor</label> <input required
															type="number" maxlength="5" placeholder="Introduzca el valor en euros"
															id="valorField" name="valorField">
													</div>
													<div class="elementosIzquierda" style="width: 45%">
														 <input
															class="button-primary" type="submit"
															id="botonOperaciones" value="Dar Alta">
													</div>
												</div>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</section>
	</div>

	<script src="assets/js/dd.min.js?ver=4.0"></script>
</body>
</html>
