<%@page import="java.text.DecimalFormat"%>
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
      <link rel="stylesheet" href="assets/css/libs.min.css">
      <link rel="stylesheet" href="assets/css/coinex.css?v=1.0.0">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="./assets/css/main.css" />
<link rel="stylesheet" href="assets/css/dd.css?v=4.0">

<!-- CSS Reset -->
<link rel="stylesheet" href="assets/css/normalize.css">

<!-- Milligram CSS minified -->
<link rel="stylesheet" href="assets/css/milligram.min.css">

<!-- Main Styles -->
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="shortcut icon" href="assets/images/favicon.ico"
	type="image/x-icon">

<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>

<body>
	<%
	BDController controladorBD = new BDController();
	ArrayList<Criptomoneda> criptos = controladorBD.todasCriptomonedas();
	%>
	<div class="navbar">
		<div class="row">
			<div class="column column-30 col-site-title">
				<a href="index.jsp" class="site-title float-left">Medialoot</a>
			</div>
			<div class="column column-40 col-search">			
			</div>
			<div class="column column-30">
				<div class="user-section">
					
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
						<h1>Listado Criptomonedas</h1>
						<p class="text-large">Selecciona la criptomoneda que deseas modificar</p>
					</div>
					<div class="row grid-responsive">
						<div class="column ">
							<div class="card">
								<div class="card-title">
									<h3>Lista Criptos</h3>
								</div>
								<div class="row grid-responsive">
				<div class="column ">
					<div class="card">
						<div class="card-title">
							<h3>Current Members</h3>
						</div>
						<div class="card-block">
							<table style="background: white;">
								<thead>
									<tr>
										<th></th>
										<th>NOMBRE</th>
										<th>CAPITALIZACIÓN</th>
										<th>VALOR_EN_EUROS</th>								
									</tr>
								</thead>
								<tbody>
								<%
								BDController BDCont = new BDController();																
								DecimalFormat df = new DecimalFormat("#.00");						
								int posicionCripto = 0;
								int pagAcutal = 1;
								ArrayList<Criptomoneda> todasCriptos = new ArrayList<Criptomoneda>();
								todasCriptos = BDCont.todasCriptomonedas();
								if (request.getParameter("posicionCLientePara") == null) {
									posicionCripto = 0;
								} else {
									posicionCripto = Integer.parseInt(request.getParameter("posicionCLientePara"));
								}													
								ArrayList<Criptomoneda> criptosPaginadas = controladorBD.dameTodosCriptossPaginados(posicionCripto);

								if (request.getParameter("paginaActual") == null) {
								} else {
									pagAcutal = Integer.parseInt(request.getParameter("paginaActual"));
								}
								for (int i = 0; i < criptosPaginadas.size(); i++) {
								
									
									%>
									<tr data-href ="perfilCripto.jsp?id_cripto=<%=criptosPaginadas.get(i).getId_crypto()%>">
										<td><img src="images/criptos/<%=criptosPaginadas.get(i).getId_crypto() %>.png" class="img-fluid avatar avatar-30 avatar-rounded" alt="img53"></td>
										<td><%=criptosPaginadas.get(i).getNombre() %></td>
										<td><%=df.format(criptosPaginadas.get(i).getCapitalizacion()) %> €</td>
										<td><%=df.format(criptosPaginadas.get(i).getValor_en_euros()) %> €</td>																				
									</tr>						
								<% }
								%>
									
								</tbody>							
								
							</table>
							
												<%
												double clientes = todasCriptos.size();
												int paginas = (int) Math.ceil(clientes / 5);

												if (clientes > 5) {
												%>
												<div class="paginator">
													<%
													if (pagAcutal > 1 && pagAcutal <= paginas) {
													%>
													<a style="margin-bottom: 0; font-size: 1.5rem;"
														class="button"
														href="listadoCriptomonedas.jsp?posicionCLientePara=<%=posicionCripto - 5%>&paginaActual=<%=pagAcutal - 1%>"><</a>
													<%
													} else {
													%>
													<a
														style="margin-bottom: 0; font-size: 1.5rem; visibility: hidden;"
														class="button"
														href="listadoCriptomonedas.jsp?posicionCLientePara=<%=posicionCripto - 5%>&paginaActual=<%=pagAcutal - 1%>"><</a>
													<%
													}
													%>
													<span>Página <%=pagAcutal%> de <%=paginas%></span>
													<%
													if (pagAcutal < paginas) {
													%>
													<a style="margin-bottom: 0; font-size: 1.5rem;"
														class="button"
														href="listadoCriptomonedas.jsp?posicionCLientePara=<%=posicionCripto + 5%>&paginaActual=<%=pagAcutal + 1%>">&gt;</a>
													<%
													} else {
													%>
													<a
														style="margin-bottom: 0; font-size: 1.5rem; visibility: hidden;"
														class="button"
														href="listadoCriptomonedas.jsp?posicionCLientePara=<%=posicionCripto + 5%>&paginaActual=<%=pagAcutal + 1%>">&gt;</a>
													<%
													}
													%>
												</div>

												<%}%>
						</div>
					</div>
				</div>
			</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</section>
	</div>
<script>
    document.addEventListener("DOMContentLoaded",()=>{
        const rows = document.querySelectorAll("tr[data-href]");

        rows.forEach(row =>{
            row.addEventListener("click", ()=>{
                window.location.href = row.dataset.href;
            });
        });
    });
</script>
<script src="assets/js/dd.min.js?ver=4.0"></script>
</body>
</html>
