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
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700" rel="stylesheet">
	
	<!-- Template Styles -->
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	
	<!-- CSS Reset -->
	<link rel="stylesheet" href="assets/css/normalize.css">
	
	<!-- Milligram CSS minified -->
	<link rel="stylesheet" href="assets/css/milligram.min.css">
	
	<!-- Main Styles -->
	<link rel="stylesheet" href="assets/css/styles.css">
	<link rel="shortcut icon" href="assets/images/favicon.ico" type="image/x-icon">
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>

<body>
	<div class="navbar">
		<div class="row">
			<div class="column column-30 col-site-title"><a href="index.jsp" class="site-title float-left">Medialoot</a></div>
			<div class="column column-40 col-search"><a href="#" class="search-btn fa fa-search"></a>
				<input type="text" name="" value="" placeholder="Search..." />
			</div>
			<div class="column column-30">
				<div class="user-section"><a href="#">
					<img src="assets/images/avatars/4.png" alt="profile photo" class="circle float-left profile-photo" width="50" height="auto">
					<div class="username">
						<h4>Jane Donovan</h4>
						<p>Administrator</p>
					</div>
				</a></div>
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
						<h1>Modificar Criptomoneda</h1>
						<p class="text-large">Aquí podra realizar la modificacion de la criptomoneda</p>
					</div>
			<div class="row grid-responsive">
				<div class="column ">
					<div class="card">
						<div class="card-title">
							<h3>Modificar Criptomoneda</h3>
							<%
							BDController BDCont = new BDController();
							Criptomoneda cripto = new Criptomoneda();
							String id_cripto = request.getParameter("id_cripto");
							cripto = BDCont.dameCripto(Integer.parseInt(id_cripto));
							%>
						</div>
						<div class="card-block">
							<form action="operaciones.jsp?tipo=modificacripto&id_criptoModifica=<%=cripto.getId_crypto()%>" method="post" id="formularioCompleto">
								<fieldset id ="bloque">
								<div class = "datos">
								<div class = "elementosDerecha" style="width: 45%">
									<label for="nameField">Nombre</label>
									<input type="text" maxlength="20" name = "nombreCriptoModifica"value="<%=cripto.getNombre() %>" id="nameField">
									<label for="apellidoField">Descripcion</label>
									<input type="text" maxlength="500" name = "descripcionModifica" value="<%=cripto.getDescription() %>" id="descripcionField">									
									</div>
									<div class = "elementosIzquierda" style="width: 45%">
									<label for="ageRangeField">Valor en Euros</label>
									<input type="text" maxlength="12" name = "eurosModifica" value="<%=cripto.getValor_en_euros() %>"  id="eurosField">
									<label for="apellidoField">Capitalizacion</label>
									<input type="text" maxlength="12" name = "capitalizacionModifica" value="<%=cripto.getCapitalizacion() %>" id="dniField">
									<input class="button-primary" type="submit" id= "botonOperaciones" value="Actualizar">											
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
	

</body>
</html> 