<%@page import="java.util.zip.CRC32"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="Criptos.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
	pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>COINEX</title>
<!-- Favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico" />
<link rel="stylesheet" href="assets/css/libs.min.css">
<link rel="stylesheet" href="assets/css/coinex.css?v=1.0.0">
<link rel="stylesheet" type="text/css" href="assets/css/flags.css?v=1.0" />
<link rel="stylesheet" href="assets/css/dd.css?v=4.0">
</head>
<body class=" ">
	<%
	
	BDController BDCont = new BDController();	
	
if(request.getParameter("mensajePDF") != null){%>
<script>
alert('PDF CREADO CON ÉXITO');
</script>
<%
}
if(request.getParameter("mensaje") != null){
	%>
	<script>
alert('OPERACION REALIZADA CON ÉXITO');
</script>
<%
}%>
	<!-- loader Start -->
	<div id="loading">
		<div class="loader simple-loader">
			<div class="loader-body"></div>
		</div>
	</div>
	<!-- loader END -->
	<aside class="sidebar sidebar-default navs-rounded ">
		<div
			class="sidebar-header d-flex align-items-center justify-content-start">
			<a href="#"
				class="navbar-brand dis-none align-items-center justify-content-center">
				<svg width="36" class="text-primary" viewBox="0 0 128 150"
					fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g>
                        <path
						d="M117.348 105.33C117.594 105.476 117.669 105.799 117.508 106.036C110.26 116.759 99.5876 125.042 87.0232 129.687C74.2883 134.395 60.2849 135.117 47.0817 131.745C33.8785 128.372 22.1759 121.086 13.7027 110.961C5.22957 100.836 0.43531 88.4101 0.0282348 75.5189C-0.37884 62.6276 3.62286 49.9548 11.4421 39.3726C19.2614 28.7905 30.4835 20.8602 43.4505 16.7536C56.4176 12.6469 70.4417 12.5815 83.4512 16.5672C96.2865 20.4995 107.462 28.1693 115.375 38.4663C115.55 38.6939 115.495 39.0214 115.256 39.1813L97.3742 51.176C97.1539 51.3238 96.8567 51.2735 96.6942 51.0637C91.6372 44.53 84.5205 39.6627 76.3537 37.1606C68.031 34.6109 59.0591 34.6527 50.7636 37.2799C42.468 39.9071 35.2888 44.9804 30.2865 51.7502C25.2842 58.5201 22.7241 66.6274 22.9846 74.8745C23.245 83.1215 26.3121 91.0709 31.7327 97.5482C37.1533 104.025 44.64 108.687 53.0866 110.844C61.5332 113.002 70.4918 112.54 78.6389 109.528C86.6324 106.573 93.4288 101.316 98.0645 94.5111C98.2142 94.2913 98.5086 94.2233 98.7376 94.3583L117.348 105.33Z"
						fill="#FF971D"></path>
                        <path
						d="M53.2837 0.5C53.2837 0.223858 53.5075 0 53.7837 0H75.6195C75.8957 0 76.1195 0.223858 76.1195 0.5V26.25H53.2837V0.5Z"
						fill="#FF971D"></path>
                        <path
						d="M53.2837 123.75H76.1195V149.5C76.1195 149.776 75.8957 150 75.6195 150H53.7837C53.5075 150 53.2837 149.776 53.2837 149.5V123.75Z"
						fill="#FF971D"></path>
                    </g>
                </svg>
				<h4 class="logo-title m-0">OINEX</h4>
			</a>
			<div class="sidebar-toggle" data-toggle="sidebar" data-active="true">
				<i class="icon"> <svg width="20" viewBox="0 0 24 24" fill="none"
						xmlns="http://www.w3.org/2000/svg">
                        <path d="M4.25 12.2744L19.25 12.2744"
							stroke="currentColor" stroke-width="1.5"></path>
                        <path
							d="M10.2998 18.2988L4.2498 12.2748L10.2998 6.24976"
							stroke="currentColor" stroke-width="1.5"></path>
                    </svg>
				</i>
			</div>
		</div>
		<div class="sidebar-body p-0 data-scrollbar">
			<div class="collapse navbar-collapse pe-3" id="sidebar">
				<ul class="navbar-nav iq-main-menu">
					<li class="nav-item "><a class="nav-link active"
						aria-current="page" href="#"> <i class="icon"> <svg
									width="22" viewBox="0 0 30 30" fill="none"
									xmlns="http://www.w3.org/2000/svg">
									<path
										d="M9.15722 20.7714V17.7047C9.1572 16.9246 9.79312 16.2908 10.581 16.2856H13.4671C14.2587 16.2856 14.9005 16.9209 14.9005 17.7047V17.7047V20.7809C14.9003 21.4432 15.4343 21.9845 16.103 22H18.0271C19.9451 22 21.5 20.4607 21.5 18.5618V18.5618V9.83784C21.4898 9.09083 21.1355 8.38935 20.538 7.93303L13.9577 2.6853C12.8049 1.77157 11.1662 1.77157 10.0134 2.6853L3.46203 7.94256C2.86226 8.39702 2.50739 9.09967 2.5 9.84736V18.5618C2.5 20.4607 4.05488 22 5.97291 22H7.89696C8.58235 22 9.13797 21.4499 9.13797 20.7714V20.7714"
										stroke="currentColor" stroke-width="1.5"
										stroke-linecap="round" stroke-linejoin="round"></path></svg>
						</i> <span class="item-name">Inicio</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-bs-toggle="collapse" href="#sidebar-user" role="button"
						aria-expanded="false" aria-controls="sidebar-user"> <i
							class="icon"> <svg width="22" viewBox="0 0 30 30" fill="none"
									xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M11.9849 15.3462C8.11731 15.3462 4.81445 15.931 4.81445 18.2729C4.81445 20.6148 8.09636 21.2205 11.9849 21.2205C15.8525 21.2205 19.1545 20.6348 19.1545 18.2938C19.1545 15.9529 15.8735 15.3462 11.9849 15.3462Z"
										stroke="currentColor" stroke-width="1.5"
										stroke-linecap="round" stroke-linejoin="round"></path>
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M11.9849 12.0059C14.523 12.0059 16.5801 9.94779 16.5801 7.40969C16.5801 4.8716 14.523 2.81445 11.9849 2.81445C9.44679 2.81445 7.3887 4.8716 7.3887 7.40969C7.38013 9.93922 9.42394 11.9973 11.9525 12.0059H11.9849Z"
										stroke="currentColor" stroke-width="1.42857"
										stroke-linecap="round" stroke-linejoin="round"></path> </svg>
						</i> <span class="item-name">Usuarios</span> <i class="right-icon">
								<svg xmlns="http://www.w3.org/2000/svg" width="18" fill="none"
									viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round"
										stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                                </svg>
						</i>
					</a>
						<ul class="sub-nav collapse" id="sidebar-user"
							data-bs-parent="#sidebar">
							<li class="nav-item"><a class="nav-link "
								href="userList.jsp"> <i class="icon"> <svg width="10"
											viewBox="0 0 12 13" fill="none"
											xmlns="http://www.w3.org/2000/svg">
                                        <rect x="0.5" y="1" width="11"
												height="11" stroke="currentcolor" />
                                        </svg>
								</i> <i class="sidenav-mini-icon"> U </i> <span class="item-name">Lista
										de Usuarios</span>
							</a></li>
						</ul></li>
					
				</ul>
			</div>
	</aside>
	<main class="main-content">
		<div class="position-relative">
			<!--Nav Start-->
			<nav
				class="nav navbar navbar-expand-lg navbar-light iq-navbar border-bottom">
				<div class="container-fluid navbar-inner">
					<a href="assets/index.html" class="navbar-brand"> </a>
					<div class="sidebar-toggle" data-toggle="sidebar"
						data-active="true">
						<i class="icon"> <svg width="20px" height="20px"
								viewBox="0 0 24 24">
                    <path fill="currentColor"
									d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z" />
                </svg>
						</i>
					</div>
					<h4 class="title">Inicio</h4>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"> <span
							class="navbar-toggler-bar bar1 mt-2"></span> <span
							class="navbar-toggler-bar bar2"></span> <span
							class="navbar-toggler-bar bar3"></span>
						</span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul
							class="navbar-nav ms-auto navbar-list mb-2 mb-lg-0 align-items-center">
							<li class="nav-item dropdown"><a href="#" class="nav-link"
								id="notification-drop" data-bs-toggle="dropdown"> <svg
										width="22" viewBox="0 0 22 22" fill="none"
										xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M12 17.8476C17.6392 17.8476 20.2481 17.1242 20.5 14.2205C20.5 11.3188 18.6812 11.5054 18.6812 7.94511C18.6812 5.16414 16.0452 2 12 2C7.95477 2 5.31885 5.16414 5.31885 7.94511C5.31885 11.5054 3.5 11.3188 3.5 14.2205C3.75295 17.1352 6.36177 17.8476 12 17.8476Z"
											stroke="currentColor" stroke-width="1.5"
											stroke-linecap="round" stroke-linejoin="round"></path>
										<path
											d="M14.3889 20.8572C13.0247 22.3719 10.8967 22.3899 9.51953 20.8572"
											stroke="currentColor" stroke-width="1.5"
											stroke-linecap="round" stroke-linejoin="round"></path></svg> <span
									class="bg-danger dots"></span>
							</a>
								<div
									class="sub-drop dropdown-menu iq-noti dropdown-menu-end p-0"
									aria-labelledby="notification-drop">
									<div class="card shadow-none m-0">
										<div class="card-header d-flex justify-content-between">
											<div class="header-title">
												<p class="fs-6 ">New notifications.</p>
											</div>
											<div class="header-title">
												<p class="fs-6">Mark all</p>
											</div>
										</div>
										<div class="card-body p-0">
											<a href="#" class="iq-sub-card">
												<div class="d-flex">
													<img src="assets/images/utilities/05.png"
														class="img-fluid avatar avatar-30 avatar-rounded"
														alt="img51">
													<div class="ms-3 w-100">
														<h6 class="mb-0 ">Successfull transaction og 0.01 BTC</h6>
														<div
															class="d-flex justify-content-between align-items-center">
															<p class="mb-0">15 mins ago</p>
														</div>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="d-flex align-items-center">
													<div class="">
														<img src="assets/images/utilities/03.png"
															class="img-fluid avatar avatar-30 avatar-rounded"
															alt="img52">
													</div>
													<div class="ms-3 w-100">
														<h6 class="mb-0 ">4 of Pending Transactions!</h6>
														<div
															class="d-flex justify-content-between align-items-center">
															<p class="mb-0">30 mins ago</p>

														</div>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="d-flex align-items-center">
													<img src="assets/images/utilities/04.png"
														class="img-fluid avatar avatar-30 avatar-rounded"
														alt="img53">
													<div class="ms-3 w-100">
														<h6 class="mb-0 ">Cancelled order of 2000 ICO</h6>
														<div
															class="d-flex justify-content-between align-items-center">
															<p class="mb-0">55 mins ago</p>

														</div>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="d-flex align-items-center">
													<img src="assets/images/utilities/05.png"
														class="img-fluid avatar avatar-30 avatar-rounded"
														alt="img54">
													<div class="w-100 ms-3">
														<h6 class="mb-0 ">Great speed notify of 1.34 LTC</h6>
														<div
															class="d-flex justify-content-between align-items-center">
															<p class="mb-0">14 Mar</p>

														</div>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div></li>
							<li class="nav-item dropdown"><a href="#" class="nav-link"
								id="mail-drop" data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <svg width="22" viewBox="0 0 24 24"
										fill="none" xmlns="http://www.w3.org/2000/svg">
										<path
											d="M17.9028 8.85107L13.4596 12.4641C12.6201 13.1301 11.4389 13.1301 10.5994 12.4641L6.11865 8.85107"
											stroke="currentColor" stroke-width="1.5"
											stroke-linecap="round" stroke-linejoin="round"></path>
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M16.9089 21C19.9502 21.0084 22 18.5095 22 15.4384V8.57001C22 5.49883 19.9502 3 16.9089 3H7.09114C4.04979 3 2 5.49883 2 8.57001V15.4384C2 18.5095 4.04979 21.0084 7.09114 21H16.9089Z"
											stroke="currentColor" stroke-width="1.5"
											stroke-linecap="round" stroke-linejoin="round"></path></svg> <span
									class="bg-primary count-mail"></span>
							</a>
								<div class="sub-drop dropdown-menu dropdown-menu-end p-0"
									aria-labelledby="mail-drop">
									<div class="card shadow-none m-0">
										<div class="card-header d-flex justify-content-between py-3">
											<div class="header-title">
												<p class="mb-0 text-white">Our Latest News</p>
											</div>
										</div>
										<div class="card-body p-0 ">
											<a href="#" class="iq-sub-card">
												<div class="d-flex ">
													<div class="">
														<img src="assets/images/coins/02.png"
															class="img-fluid avatar avatar-50 avatar-rounded"
															alt="img55">
													</div>
													<div class=" w-100 ms-3">
														<h6 class="mb-0 ">Bitcoin</h6>
														<small class="float-left font-size-12">Lorem Ipsum
															is simply dummy text of the printing and typesetting
															industry. </small>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="d-flex">
													<div class="">
														<img src="assets/images/coins/03.png"
															class="img-fluid avatar avatar-50 avatar-rounded"
															alt="img56">
													</div>
													<div class="ms-3">
														<h6 class="mb-0 ">Ethereum</h6>
														<small class="float-left font-size-12">Lorem Ipsum
															is simply dummy text of the printing and typesetting
															industry. </small>
													</div>
												</div>
											</a> <a href="#" class="iq-sub-card">
												<div class="d-flex">
													<div class="">
														<img src="assets/images/coins/06.png"
															class="img-fluid avatar avatar-50 avatar-rounded"
															alt="img57">
													</div>
													<div class="ms-3">
														<h6 class="mb-0 ">Litecoin</h6>
														<small class="float-left font-size-12">Lorem Ipsum
															is simply dummy text of the printing and typesetting
															industry.</small>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div></li>
							<li class="nav-item dropdown"><a
								class="nav-link py-0 d-flex align-items-center" href="#"
								id="navbarDropdown" role="button" data-bs-toggle="dropdown"
								aria-expanded="false"> <img
									src="assets/images/avatars/1.png" alt="User-Profile"
									class="img-fluid avatar avatar-50 avatar-rounded">
									<div class="caption ms-3 ">
										<h6 class="mb-0 caption-title">Wade Warren</h6>
										<p class="mb-0 caption-sub-title">Super Admin</p>
									</div>
							</a>
								<ul class="dropdown-menu dropdown-menu-end"
									aria-labelledby="navbarDropdown">
									<li class="border-0"><a class="dropdown-item" href="index.jsp">Accede a administrador</a></li>	
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>
			<!--Nav End-->
		</div>
		<div class="container-fluid content-inner pb-0">
		<div id="operacion" ></div>
			<div class="row">
				<div class="col-lg-12">
					<div class="row align-items-center mb-4">
						<div class="col-xl-12 d-none d-md-block">
							<div class="card mb-xl-0">
								<div class="card-body ">
									<div class="d-flex justify-content-between flex-wrap">
										<div class="d-flex">
											<div class="dropdown mt-2 ms-2">
												<a href="#" class="text-white" id="dropdownMenuButton4"
													data-bs-toggle="dropdown" aria-expanded="false"> <span
													class="mt-2" style="font-size: 30px">Top 3
														Criptomonedas </span>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8">
					<div class="row">
						<div class="col-lg-12">
							<div class="row">
								<%
								ArrayList<Criptomoneda> rankingCriptos = BDCont.Top3Criptos();
								for (int i = 0; i < rankingCriptos.size(); i++) {
								%>
								<div class="col-lg-4">
									<div class="card shining-card">
										<div class="card-body" ><a href ="coinProfile.jsp?id_cripto=<%=rankingCriptos.get(i).getId_crypto()%>">										
											<img
												src="images/criptos/<%=rankingCriptos.get(i).getId_crypto()%>.png"
												class="img-fluid avatar avatar-50 avatar-rounded"
												alt="img60"> <span class="fs-5 me-2"><%=rankingCriptos.get(i).getNombre()%></span>
											<svg width="36" height="35" viewBox="0 0 36 35" fill="none"
												xmlns="http://www.w3.org/2000/svg">
                        <path
													d="M3.86124 21.6224L11.2734 16.8577C11.6095 16.6417 12.041 16.6447 12.3718 16.8655L18.9661 21.2663C19.2968 21.4871 19.7283 21.4901 20.0644 21.2741L27.875 16.2534"
													stroke="#BFBFBF" stroke-linecap="round"
													stroke-linejoin="round" />
                        <path
													d="M26.7847 13.3246L31.6677 14.0197L30.4485 18.7565L26.7847 13.3246ZM30.2822 19.4024C30.2823 19.4023 30.2823 19.4021 30.2824 19.402L30.2822 19.4024ZM31.9991 14.0669L31.9995 14.0669L32.0418 13.7699L31.9995 14.0669C31.9994 14.0669 31.9993 14.0669 31.9991 14.0669Z"
													fill="#BFBFBF" stroke="#BFBFBF" />
                        </svg>
											<div class="pt-3">
												<h4 class="counter" style="visibility: visible;"><%=rankingCriptos.get(i).getValor_en_euros()%>
													€
												</h4>
												<div class="pt-3">
													<%
													double numero = (Math.random() * 30 + 1);
													DecimalFormat df = new DecimalFormat("#.00");
													%>
													<small>+<%=df.format(numero)%>%
													</small>
												</div>
											</div>
											</a>
										</div>									
									</div>
								</div>
								<%
								}
								%>
								<div class="col-lg-12">
									<div class="card">
										<div
											class="card-header d-flex justify-content-between flex-wrap">
											<div class="header-title ">
												<h4 class="card-title">Comprar</h4>
											</div>
																			
										</div>
										<div class="card-body">
											<form class="col-lg-12" action="operaciones.jsp?tipo=compraCriptoVisual"method="post">
												<div class="form-group mb-3">
													<div class="input-group pt-1">
														<select id="idCompraCripto" name = "idCompraCripto" is ="ms-dropdown" required style = "width: 400px" data-child-heigth = "400">
														<option value =""data-description="">Selecciona una criptomoneda</option>
														<%ArrayList<Criptomoneda> todasCriptos = new ArrayList<Criptomoneda>();
														todasCriptos = BDCont.todasCriptomonedas();
														for(int i = 0; i<todasCriptos.size();i++){
															%>
														<option value ="<%=todasCriptos.get(i).getId_crypto()%>"data-image="images/criptos/<%=todasCriptos.get(i).getId_crypto()%>.png"><%=todasCriptos.get(i).getNombre() %></option>
														<%}%>	</select>
													</div>
												</div>
									<div class="form-group mb-3">
													<div class="input-group pt-1">
														<select id="idCompraCliente" name = "idCompraCliente" is ="ms-dropdown" required style = "width: 400px" data-child-heigth = "400">
														<option value =""data-description="">Selecciona tu perfil</option>
														<%ArrayList<Cliente> todosClientes = new ArrayList<Cliente>();
														todosClientes = BDCont.todosClientes();
														for(int i = 0; i<todosClientes.size();i++){
															%>
														<option value ="<%=todosClientes.get(i).getId_cliente()%>"data-image="assets/images/avatars/<%=todosClientes.get(i).getId_cliente()%>.png"><%=todosClientes.get(i).getNombre() %></option>
														<%}%>	</select>
													</div>
												</div>
												<div class="form-group mb-3">
													<div class="input-group pt-2">
														<span class="input-group-text" id="basic-addon6">Cantidad</span>
														<input type="text" class="form-control col-lg-8" name="cantidadCriptosCompra" 
														id="cantidadCriptosCompra"
															placeholder="0,000000" aria-label="Recipient's username"
															aria-describedby="basic-addon3">
													</div>
												</div>
												<div class="">
													<div class="d-grid gap-card grid-cols-1">
														 <button type="submit" class="btn btn-success">COMPRAR
														</button>														
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>	
							</div>
						</div>
						<div class="col-lg-12">
							<div class="card">
								<div
									class="card-header d-flex justify-content-between flex-wrap">
									<div class="header-title">
										<h4 class="card-title mb-2">Market Overview</h4>
										<p class="mb-0">Pictorial monthly analytics of market.</p>
									</div>
									<div class="d-flex align-items-center align-self-center">
										<div class="d-flex align-items-center">
											<div class="form-check active">
												<input class="form-check-input" type="radio"
													name="flexRadioDefault" id="flexRadioDefault1" checked>
												<label class="form-check-label" for="flexRadioDefault1">ETH
												</label>
											</div>
										</div>
										<div class="d-flex align-items-center ms-3">
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="flexRadioDefault" id="flexRadioDefault2"> <label
													class="form-check-label" for="flexRadioDefault2">XMR
												</label>
											</div>
										</div>
										<div class="d-flex align-items-center ms-3">
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="flexRadioDefault" id="flexRadioDefault3"> <label
													class="form-check-label" for="flexRadioDefault3">LTC
												</label>
											</div>
										</div>
										<div class="d-flex align-items-center ms-3">
											<div class="form-check">
												<input class="form-check-input" type="radio"
													name="flexRadioDefault" id="flexRadioDefault4"> <label
													class="form-check-label" for="flexRadioDefault4">XMR
												</label>
											</div>
										</div>
									</div>
								</div>
								<div class="dropdown ms-4">
									<a class="btn btn-primary dropdown-toggle mt-2" href="#"
										role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
										aria-expanded="false"> Weekly (2022) </a>
								</div>
								<div class="card-body">
									<div id="apex-candlestick-chart"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="card card-block card-stretch custom-scroll">
								<div
									class="card-header d-flex flex-wrap justify-content-between align-items-center">
									<div class="caption">
										<h4 class="font-weight-bold mb-2">Listado de
											criptomonedas</h4>
										<p class="mb-0">Aqui puedes ver un listado de todas
											nuestras criptomonedas</p>
									</div>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table data-table mb-0">
											<thead>
												<tr>
													<th scope="col">Nombre</th>
													<th scope="col">Valor euros</th>
													<th scope="col">24h %</th>
													<th scope="col">7d %</th>
													<th scope="col">Capitalizacion</th>													
													<th scope="col">Circulando</th>
												</tr>
											</thead>
											<tbody>
																						<%
												
												
												DecimalFormat formato1 = new DecimalFormat("#.00");
												DecimalFormat formato2 = new DecimalFormat("#");
												int posicionCripto = 0;
												int pagAcutal = 1;
												ArrayList<Criptomoneda> toyalCriptos = new ArrayList<Criptomoneda>();
												todasCriptos = BDCont.todasCriptomonedas();
												if (request.getParameter("posicionCLientePara") == null) {
													posicionCripto = 0;
												} else {
													posicionCripto = Integer.parseInt(request.getParameter("posicionCLientePara"));
												}													
												ArrayList<Criptomoneda> criptosPaginadas = BDCont.dameTodosCriptossPaginados(posicionCripto);

												if (request.getParameter("paginaActual") == null) {
												} else {
													pagAcutal = Integer.parseInt(request.getParameter("paginaActual"));
												}
												for (int i = 0; i < criptosPaginadas.size(); i++) {												
												%>
												<tr class="white-space-no-wrap" data-href ="coinProfile.jsp?id_cripto=<%=criptosPaginadas.get(i).getId_crypto()%>">
													<td><img src="images/criptos/<%=criptosPaginadas.get(i).getId_crypto()%>.png"
														class="img-fluid avatar avatar-30 avatar-rounded"
														alt="img23" /><%=criptosPaginadas.get(i).getNombre() %>
													</td>
													<td class="pe-2"><%=criptosPaginadas.get(i).getValor_en_euros()%>€</td>
													<td class="text-danger"><svg width="10" height="8"
															viewBox="0 0 8 5" fill="none"
															xmlns="http://www.w3.org/2000/svg">
                                    <path
																d="M4 4.5L0.535898 0L7.4641 0L4 4.5Z" fill="#FF2E2E" />
                                    </svg> 6.93%</td>
													<td class="text-success"><svg width="10" height="8"
															viewBox="0 0 8 5" fill="none"
															xmlns="http://www.w3.org/2000/svg">
                                    <path
																d="M4 0.5L7.4641 5H0.535898L4 0.5Z" fill="#00EC42" />
                                    </svg> 4.58%</td>
													<td><%=formato2.format(criptosPaginadas.get(i).getCapitalizacion())%>€</td>													
													<td class="ms-5"><%=formato2.format(criptosPaginadas.get(i).getCapitalizacion()/1235)%>€</td>										
												</tr>
												<%
												}
												%>


											</tbody>
										</table>
										<%
												double clientes = todasCriptos.size();
												int paginas = (int) Math.ceil(clientes / 8);

												if (clientes > 8) {
												%>
												<div class="paginator">
													<%
													if (pagAcutal > 1 && pagAcutal <= paginas) {
													%>
													<a style="margin-bottom: 0; font-size: 1.5rem;"
														class="button"
														href="indexUsuario.jsp?posicionCLientePara=<%=posicionCripto - 8%>&paginaActual=<%=pagAcutal - 1%>"><</a>
													<%
													} else {
													%>
													<a
														style="margin-bottom: 0; font-size: 1.5rem; visibility: hidden;"
														class="button"
														href="indexUsuario.jsp?posicionCLientePara=<%=posicionCripto - 8%>&paginaActual=<%=pagAcutal - 1%>"><</a>
													<%
													}
													%>
													<span>Página <%=pagAcutal%> de <%=paginas%></span>
													<%
													if (pagAcutal < paginas) {
													%>
													<a style="margin-bottom: 0; font-size: 1.5rem;"
														class="button"
														href="indexUsuario.jsp?posicionCLientePara=<%=posicionCripto + 8%>&paginaActual=<%=pagAcutal + 1%>">&gt;</a>
													<%
													} else {
													%>
													<a
														style="margin-bottom: 0; font-size: 1.5rem; visibility: hidden;"
														class="button"
														href="indexUsuario.jsp?posicionCLientePara=<%=posicionCripto + 8%>&paginaActual=<%=pagAcutal + 1%>">&gt;</a>
													<%
													}
													%>
												</div>

												<%}%>
										<a href="operaciones.jsp?tipo=pdf_criptos"
													style="color: white" margin-top;>Generar PDF Criptomonedas</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-header">
									<div class="input-group search-input">
										<input type="search" class="form-control form-control-lg"
											placeholder="Search BTS/ETH">
									</div>
								</div>
								<div
									class="card-body d-flex align-items-center justify-content-center">
									<img src="assets/images/coins/14.png"
										class="img-fluid p-0 w-75" alt="img60">
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="card">
								<div class="card-header">
									<div class="header-title">
										<h4 class="card-title">Ranking clientes</h4>
									</div>
								</div>
								<div class="card-body">
									<ul class="list-inline m-0 p-0">
										<%
										ArrayList<Compras> topComprasClientes = BDCont.rankingClientesCompras();
										for (int i = 0; i < topComprasClientes.size(); i++) {
											Cliente cli = new Cliente();
											cli = BDCont.dameCliente(topComprasClientes.get(i).getId_cliente());
											double compras = BDCont.maxCompra(cli.getId_cliente());
											int cantidad = BDCont.cantidadCompra(cli.getId_cliente());
										%>
										<li class="d-flex  align-items-center pt-3">										
											<div class="d-flex justify-content-between rounded-pill">
											<a href = "userProfile.jsp?id_cliente=<%=cli.getId_cliente()%>">
												<img
													src="assets/images/avatars/<%=cli.getId_cliente()%>.png"
													class="img-fluid avatar avatar-40 avatar-rounded"
													alt="img6">
												<div class="ms-3 flex-grow-1">
													<h5 class="mb-2"><%=cli.getNombre() + " " + cli.getApellidos()%></h5></a>
													<p class=" text-success mb-2"></p>
													<p class="fs-6"><%=cli.getNombre() + " es nuestr@ cliente número " + (i + 1) + ". Ha realizado un total de " + cantidad
		+ " compra(s). El valor de su máxima compra ha sido de " + compras%>
														€.
													</p>
												</div>
												<div class="">
													<p><%=cli.getProvincia()%></p>
												</div>
												
										</div>
											
										</li>
										<%
										}
										%>


									</ul>
								</div>
							</div>
						</div>
					</div>
					<footer class="footer">
						<div class="footer-body">
							<ul class="left-panel list-inline mb-0 p-0">
								<li class="list-inline-item"><a
									href="assets/extra/privacy-policy.html" class="text-white">Privacy
										Policy</a></li>
								<li class="list-inline-item"><a
									href="assets/extra/terms-of-service.html" class="text-white">Terms
										of Use</a></li>
							</ul>
							<div class="right-panel">
								©
								<script>
									document.write(new Date().getFullYear())
								</script>
								COINEX, Made with <span class="text-gray"> <svg
										width="15" viewBox="0 0 24 24" fill="none"
										xmlns="http://www.w3.org/2000/svg">
                          <path fill-rule="evenodd" clip-rule="evenodd"
											d="M15.85 2.50065C16.481 2.50065 17.111 2.58965 17.71 2.79065C21.401 3.99065 22.731 8.04065 21.62 11.5806C20.99 13.3896 19.96 15.0406 18.611 16.3896C16.68 18.2596 14.561 19.9196 12.28 21.3496L12.03 21.5006L11.77 21.3396C9.48102 19.9196 7.35002 18.2596 5.40102 16.3796C4.06102 15.0306 3.03002 13.3896 2.39002 11.5806C1.26002 8.04065 2.59002 3.99065 6.32102 2.76965C6.61102 2.66965 6.91002 2.59965 7.21002 2.56065H7.33002C7.61102 2.51965 7.89002 2.50065 8.17002 2.50065H8.28002C8.91002 2.51965 9.52002 2.62965 10.111 2.83065H10.17C10.21 2.84965 10.24 2.87065 10.26 2.88965C10.481 2.96065 10.69 3.04065 10.89 3.15065L11.27 3.32065C11.3618 3.36962 11.4649 3.44445 11.554 3.50912C11.6104 3.55009 11.6612 3.58699 11.7 3.61065C11.7163 3.62028 11.7329 3.62996 11.7496 3.63972C11.8354 3.68977 11.9247 3.74191 12 3.79965C13.111 2.95065 14.46 2.49065 15.85 2.50065ZM18.51 9.70065C18.92 9.68965 19.27 9.36065 19.3 8.93965V8.82065C19.33 7.41965 18.481 6.15065 17.19 5.66065C16.78 5.51965 16.33 5.74065 16.18 6.16065C16.04 6.58065 16.26 7.04065 16.68 7.18965C17.321 7.42965 17.75 8.06065 17.75 8.75965V8.79065C17.731 9.01965 17.8 9.24065 17.94 9.41065C18.08 9.58065 18.29 9.67965 18.51 9.70065Z"
											fill="currentColor"></path>
                      </svg>
								</span> by <a href="https://iqonic.design/">IQONIC Design</a>.
							</div>
						</div>
					</footer>
	</main>

	<!-- Wrapper End-->
	<!-- offcanvas start -->

	<!-- Backend Bundle JavaScript -->
	<script src="assets/js/libs.min.js"></script>
	<!-- widgetchart JavaScript -->
	<script src="assets/js/charts/widgetcharts.js"></script>
	<!-- fslightbox JavaScript -->
	<script src="assets/js/fslightbox.js"></script>
	<!-- app JavaScript -->
	<script src="assets/js/app.js"></script>
	<!-- apexchart JavaScript -->
	<script src="assets/js/charts/apexcharts.js"></script>
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