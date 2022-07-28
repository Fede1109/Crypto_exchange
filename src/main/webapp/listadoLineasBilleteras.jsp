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
String id_billetera = request.getParameter("id_billetera");
Cliente cli = new Cliente();
cli = BDCont.dameCliente(Integer.parseInt(id_billetera));%>

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
						<h1>Listado Lineas Billeteras</h1>
						<p class="text-large">Linea(s) de billetera de <%=cli.getNombre() %></p>
					</div>
					<div class="row grid-responsive">
						<div class="column ">
							<div class="card">
								<div class="card-title">
									
								</div>
								<div class="row grid-responsive">
				<div class="column ">
					<div class="card">
						<div class="card-title">
							<h3>Lineas Billeteras</h3>
						</div>
						<div class="card-block">
							<table style="background: white;">
								<thead>
									<tr>
										<th></th>
										<th>CRIPTOMONEDA</th>
										<th>UNIDADES</th>									
									</tr>
								</thead>
								<tbody>
								<%
							
								Billetera bill = new Billetera();
								int posicionLBilletera = 0;
								bill = BDCont.dameBilleteraCliente(Integer.parseInt(id_billetera));
								ArrayList<L_billetera> Lbilleteras = new ArrayList<L_billetera>();
								Lbilleteras = BDCont.todasLineasBilleteras();
								ArrayList<L_billetera> lineasBilleteraPaginadas = new ArrayList<L_billetera>();
								lineasBilleteraPaginadas = BDCont.dameLineasbilleteraBilleteraPaginadas(Integer.parseInt(id_billetera), posicionLBilletera);
								Criptomoneda cripto = new Criptomoneda();																																																			
								int pagAcutal = 1;
								ArrayList<L_billetera> todasLBilleteras = new ArrayList<L_billetera>();
								todasLBilleteras = BDCont.todasLineasBilleteras();
								if (request.getParameter("posicionCLientePara") == null) {
									posicionLBilletera = 0;
								} else {
									posicionLBilletera = Integer.parseInt(request.getParameter("posicionCLientePara"));
								}													
								

								if (request.getParameter("paginaActual") == null) {
								} else {
									pagAcutal = Integer.parseInt(request.getParameter("paginaActual"));
								}
								for (int i = 0; i < lineasBilleteraPaginadas.size(); i++) {	
									cripto = BDCont.dameCripto(lineasBilleteraPaginadas.get(i).getId_criptomoneda());
									%>
									<tr data-href = "perfilLBilletera.jsp?id_LBilletera=<%=lineasBilleteraPaginadas.get(i).getId_billetera()%>&id_LCriptomoneda=<%=lineasBilleteraPaginadas.get(i).getId_criptomoneda()%>">
										<td><img src="images/criptos/<%=cripto.getId_crypto() %>.png" class="img-fluid avatar avatar-30 avatar-rounded" alt="img53"></td>
										<td><%=cripto.getNombre() %></td>
										<td><%=lineasBilleteraPaginadas.get(i).getUnidades() %></td>										
										
									</tr>						
								<% }
								%>
									
								</tbody>							
								
							</table>
							
							<%
												double lbilleteras = lineasBilleteraPaginadas.size();
												int paginas = (int) Math.ceil(lbilleteras / 5);

												if (lbilleteras > 5) {
												%>
												<div class="paginator">
													<%
													if (pagAcutal > 1 && pagAcutal <= paginas) {
													%>
													<a style="margin-bottom: 0; font-size: 1.5rem;"
														class="button"
														href="listadoLineasBilleteras.jsp?posicionCLientePara=<%=posicionLBilletera - 5%>&paginaActual=<%=pagAcutal - 1%>"><</a>
													<%
													} else {
													%>
													<a
														style="margin-bottom: 0; font-size: 1.5rem; visibility: hidden;"
														class="button"
														href="listadoLineasBilleteras.jsp?posicionCLientePara=<%=posicionLBilletera - 5%>&paginaActual=<%=pagAcutal - 1%>"><</a>
													<%
													}
													%>
													<span>Página <%=pagAcutal%> de <%=paginas%></span>
													<%
													if (pagAcutal < paginas) {
													%>
													<a style="margin-bottom: 0; font-size: 1.5rem;"
														class="button"
														href="listadoLineasBilleteras.jsp?posicionCLientePara=<%=posicionLBilletera + 5%>&paginaActual=<%=pagAcutal + 1%>">&gt;</a>
													<%
													} else {
													%>
													<a
														style="margin-bottom: 0; font-size: 1.5rem; visibility: hidden;"
														class="button"
														href="listadoLineasBilleteras.jsp?posicionCLientePara=<%=posicionLBilletera + 5%>&paginaActual=<%=pagAcutal + 1%>">&gt;</a>
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
