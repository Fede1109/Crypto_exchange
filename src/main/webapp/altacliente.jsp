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
						<h1>Alta Cliente</h1>
						<p class="text-large">Aquí podra realizar el alta de los nuevos clientes</p>
					</div>
			<div class="row grid-responsive">
				<div class="column ">
					<div class="card">
						<div class="card-title">
							<h3>Nuevo Usuario</h3>
						</div>
						<div class="card-block">
							<form action="operaciones.jsp?tipo=altacliente" method="post" id="formularioCompleto">
								<fieldset id ="bloque">
								<div class = "datos" style="gap: 5rem">
								<div class = "elementosDerecha" style="width: 45%;">
									<label for="nameField">Nombre</label>
									<input type="text" required maxlength="20"  name = "nombre"placeholder="Introduzca su nombre" id="nameField">
									<label for="apellidoField">Apellidos</label>
									<input type="text"  required  maxlength="20" name = "apellidos" placeholder="Introduzca sus apellidos" id="apellidoField">
									
									<label for="apellidoField">DNI</label>
									<input type="text" required name = "dni" placeholder="Introduzca su dni" maxlength="9" id="dniField">
									</div>
									<div class = "elementosIzquierda" style="width: 45%">
									<label for="direccionField">Direccion</label>
									<input type="text" required maxlength="30" placeholder="Introduzca sus direccion" id="direccionField"  name ="direccion">
									<label for="CPField">Código Postal</label>
									<input type="number" required placeholder="Introduzca su CP" id="CPField" name ="CP" maxlength="5">
									<label for="provinciaField">Provincia</label>
									<input type="text" required maxlength="20" placeholder="Introduzca su Provincia" id="provinciaField" name ="provincia">	
									<input class="button-primary" type="submit" id= "botonOperaciones" value="Dar Alta">											
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