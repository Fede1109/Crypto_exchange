<%@page import="java.text.DecimalFormat"%>
<%@ page import="Criptos.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-15"
    pageEncoding="utf-8"%>
      	<%@ page import="java.io.*,java.util.*"%>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>COINEX | Responsive Bootstrap 5 Admin Dashboard Template</title>
      <!-- Favicon -->
      <link rel="shortcut icon" href="assets/images/favicon.ico" />
      <link rel="stylesheet" href="assets/css/libs.min.css">
      <link rel="stylesheet" href="assets/css/coinex.css?v=1.0.0">  </head>
  <body class=" ">
    <!-- loader Start -->
    <%
    BDController BDCont = new BDController();
    String id_cliente = request.getParameter("id_cliente");
    Cliente cli = new Cliente();
    cli = BDCont.dameCliente(Integer.parseInt(id_cliente));
    ArrayList<Criptomoneda> rankingCriptos = BDCont.Top3Criptos();
    ArrayList<Criptomoneda> top8Criptos = BDCont.Top8Criptos();
    %>
    <div id="loading">
      <div class="loader simple-loader">
          <div class="loader-body"></div>
      </div>    </div>
    <!-- loader END -->
    <aside class="sidebar sidebar-default navs-rounded ">
        <div class="sidebar-header d-flex align-items-center justify-content-start">
            <a href="indexUsuario.jsp" class="navbar-brand dis-none align-items-center justify-content-center">
                <svg width="36" class="text-primary" viewBox="0 0 128 150" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g>
                        <path d="M117.348 105.33C117.594 105.476 117.669 105.799 117.508 106.036C110.26 116.759 99.5876 125.042 87.0232 129.687C74.2883 134.395 60.2849 135.117 47.0817 131.745C33.8785 128.372 22.1759 121.086 13.7027 110.961C5.22957 100.836 0.43531 88.4101 0.0282348 75.5189C-0.37884 62.6276 3.62286 49.9548 11.4421 39.3726C19.2614 28.7905 30.4835 20.8602 43.4505 16.7536C56.4176 12.6469 70.4417 12.5815 83.4512 16.5672C96.2865 20.4995 107.462 28.1693 115.375 38.4663C115.55 38.6939 115.495 39.0214 115.256 39.1813L97.3742 51.176C97.1539 51.3238 96.8567 51.2735 96.6942 51.0637C91.6372 44.53 84.5205 39.6627 76.3537 37.1606C68.031 34.6109 59.0591 34.6527 50.7636 37.2799C42.468 39.9071 35.2888 44.9804 30.2865 51.7502C25.2842 58.5201 22.7241 66.6274 22.9846 74.8745C23.245 83.1215 26.3121 91.0709 31.7327 97.5482C37.1533 104.025 44.64 108.687 53.0866 110.844C61.5332 113.002 70.4918 112.54 78.6389 109.528C86.6324 106.573 93.4288 101.316 98.0645 94.5111C98.2142 94.2913 98.5086 94.2233 98.7376 94.3583L117.348 105.33Z" fill="#FF971D"></path>
                        <path d="M53.2837 0.5C53.2837 0.223858 53.5075 0 53.7837 0H75.6195C75.8957 0 76.1195 0.223858 76.1195 0.5V26.25H53.2837V0.5Z" fill="#FF971D"></path>
                        <path d="M53.2837 123.75H76.1195V149.5C76.1195 149.776 75.8957 150 75.6195 150H53.7837C53.5075 150 53.2837 149.776 53.2837 149.5V123.75Z" fill="#FF971D"></path>
                    </g>
                </svg>            <h4 class="logo-title m-0">OINEX</h4>
            </a>
            <div class="sidebar-toggle" data-toggle="sidebar" data-active="true">
                <i class="icon">
                    <svg width="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M4.25 12.2744L19.25 12.2744" stroke="currentColor" stroke-width="1.5"></path>
                        <path d="M10.2998 18.2988L4.2498 12.2748L10.2998 6.24976" stroke="currentColor" stroke-width="1.5"></path>
                    </svg>
                </i>
            </div>
        </div>
        <div class="sidebar-body p-0 data-scrollbar">
            <div class="collapse navbar-collapse pe-3" id="sidebar">
                <ul class="navbar-nav iq-main-menu">
                    <li class="nav-item ">
                        <a class="nav-link " aria-current="page" href="indexUsuario.jsp">
                            <i class="icon">
                            <svg width="22" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M9.15722 20.7714V17.7047C9.1572 16.9246 9.79312 16.2908 10.581 16.2856H13.4671C14.2587 16.2856 14.9005 16.9209 14.9005 17.7047V17.7047V20.7809C14.9003 21.4432 15.4343 21.9845 16.103 22H18.0271C19.9451 22 21.5 20.4607 21.5 18.5618V18.5618V9.83784C21.4898 9.09083 21.1355 8.38935 20.538 7.93303L13.9577 2.6853C12.8049 1.77157 11.1662 1.77157 10.0134 2.6853L3.46203 7.94256C2.86226 8.39702 2.50739 9.09967 2.5 9.84736V18.5618C2.5 20.4607 4.05488 22 5.97291 22H7.89696C8.58235 22 9.13797 21.4499 9.13797 20.7714V20.7714" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg>                            
                            </i>
                            <span class="item-name">Inicio</span>
                        </a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="collapse" href="#sidebar-user" role="button" aria-expanded="false" aria-controls="sidebar-user">
                            <i class="icon">
                            <svg width="22" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M11.9849 15.3462C8.11731 15.3462 4.81445 15.931 4.81445 18.2729C4.81445 20.6148 8.09636 21.2205 11.9849 21.2205C15.8525 21.2205 19.1545 20.6348 19.1545 18.2938C19.1545 15.9529 15.8735 15.3462 11.9849 15.3462Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M11.9849 12.0059C14.523 12.0059 16.5801 9.94779 16.5801 7.40969C16.5801 4.8716 14.523 2.81445 11.9849 2.81445C9.44679 2.81445 7.3887 4.8716 7.3887 7.40969C7.38013 9.93922 9.42394 11.9973 11.9525 12.0059H11.9849Z" stroke="currentColor" stroke-width="1.42857" stroke-linecap="round" stroke-linejoin="round"></path> </svg>                            
                            </i>
                            <span class="item-name">Usuarios</span>
                            <i class="right-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="18" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                                </svg>
                            </i>
                        </a>
                        <ul class="sub-nav collapse" id="sidebar-user" data-bs-parent="#sidebar">
                            <li class="nav-item">
                                <a class="nav-link " href="userList.jsp">
                                    <i class="icon">
                                        <svg width="10" viewBox="0 0 12 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <rect x="0.5" y="1" width="11" height="11" stroke="currentcolor"/>
                                        </svg> 
                                    </i>
                                    <i class="sidenav-mini-icon"> U </i>
                                    <span class="item-name">Listado de Usuarios</span>
                                </a>
                            </li>
                        </ul>
                    </li>
            </div>
        </div>
    </aside>    <main class="main-content">
      <div class="position-relative">
        <!--Nav Start-->
        <nav class="nav navbar navbar-expand-lg navbar-light iq-navbar border-bottom">
          <div class="container-fluid navbar-inner">
            <a href="dashboard/index.html" class="navbar-brand">
            </a>
            <div class="sidebar-toggle" data-toggle="sidebar" data-active="true">
                <i class="icon">
                 <svg width="20px" height="20px" viewBox="0 0 24 24">
                    <path fill="currentColor" d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z" />
                </svg>
                </i>
            </div>
              <h4 class="title">
                Dashboard
              </h4>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon">
                  <span class="navbar-toggler-bar bar1 mt-2"></span>
                  <span class="navbar-toggler-bar bar2"></span>
                  <span class="navbar-toggler-bar bar3"></span>
                </span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav ms-auto navbar-list mb-2 mb-lg-0 align-items-center">
                <li class="nav-item dropdown">
                  <a href="#"  class="nav-link" id="notification-drop" data-bs-toggle="dropdown" >
                    <svg width="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M12 17.8476C17.6392 17.8476 20.2481 17.1242 20.5 14.2205C20.5 11.3188 18.6812 11.5054 18.6812 7.94511C18.6812 5.16414 16.0452 2 12 2C7.95477 2 5.31885 5.16414 5.31885 7.94511C5.31885 11.5054 3.5 11.3188 3.5 14.2205C3.75295 17.1352 6.36177 17.8476 12 17.8476Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path><path d="M14.3889 20.8572C13.0247 22.3719 10.8967 22.3899 9.51953 20.8572" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg>                            
                    <span class="bg-danger dots"></span>
                  </a>
                  <div class="sub-drop dropdown-menu iq-noti dropdown-menu-end p-0" aria-labelledby="notification-drop">
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
                                  <img src="assets/images/utilities/05.png" class="img-fluid avatar avatar-30 avatar-rounded" alt="img51"><div class="ms-3 w-100">
                                    <h6 class="mb-0 ">Successfull transaction og 0.01 BTC</h6>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <p class="mb-0">15 mins ago</p>
                                        </div>
                                  </div>
                              </div>
                            </a>
                            <a href="#" class="iq-sub-card">
                              <div class="d-flex align-items-center">
                                  <div class="">
                                    <img src="assets/images/utilities/03.png" class="img-fluid avatar avatar-30 avatar-rounded" alt="img52">
                                  </div>
                                  <div class="ms-3 w-100">
                                    <h6 class="mb-0 ">4 of Pending Transactions!</h6>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <p class="mb-0">30 mins ago</p>
                                        
                                    </div>
                                  </div>
                              </div>
                            </a>
                            <a href="#" class="iq-sub-card">
                              <div class="d-flex align-items-center">
                                  <img src="assets/images/utilities/04.png" class="img-fluid avatar avatar-30 avatar-rounded" alt="img53"><div class="ms-3 w-100">
                                    <h6 class="mb-0 ">Cancelled order of 2000 ICO</h6>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <p class="mb-0">55 mins ago</p>
                                        
                                    </div>
                                  </div>
                              </div>
                            </a>
                            <a href="#" class="iq-sub-card">
                              <div class="d-flex align-items-center">
                                  <img src="assets/images/utilities/05.png" class="img-fluid avatar avatar-30 avatar-rounded" alt="img54"><div class="w-100 ms-3">
                                    <h6 class="mb-0 ">Great speed notify of 1.34 LTC</h6>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <p class="mb-0">14 Mar</p>
                                        
                                    </div>
                                  </div>
                              </div>
                            </a>
                        </div>
                      </div>
                  </div>
                </li>
                <li class="nav-item dropdown" >
                  <a href="#" class="nav-link" id="mail-drop" data-bs-toggle="dropdown"  aria-haspopup="true" aria-expanded="false">
                    <svg width="22" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M17.9028 8.85107L13.4596 12.4641C12.6201 13.1301 11.4389 13.1301 10.5994 12.4641L6.11865 8.85107" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M16.9089 21C19.9502 21.0084 22 18.5095 22 15.4384V8.57001C22 5.49883 19.9502 3 16.9089 3H7.09114C4.04979 3 2 5.49883 2 8.57001V15.4384C2 18.5095 4.04979 21.0084 7.09114 21H16.9089Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg>                            
                    <span class="bg-primary count-mail"></span>
                  </a>
                  <div class="sub-drop dropdown-menu dropdown-menu-end p-0" aria-labelledby="mail-drop">
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
                                    <img src="assets/images/coins/02.png" class="img-fluid avatar avatar-50 avatar-rounded" alt="img55">
                                  </div>
                                  <div class=" w-100 ms-3">
                                    <h6 class="mb-0 ">Bitcoin</h6>
                                    <small class="float-left font-size-12">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </small>
                                  </div>
                              </div>
                            </a>
                            <a href="#" class="iq-sub-card">
                              <div class="d-flex">
                                  <div class="">
                                    <img src="assets/images/coins/03.png" class="img-fluid avatar avatar-50 avatar-rounded" alt="img56">
                                  </div>
                                  <div class="ms-3">
                                    <h6 class="mb-0 ">Ethereum</h6>
                                    <small class="float-left font-size-12">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </small>
                                  </div>
                              </div>
                            </a>
                            <a href="#" class="iq-sub-card">
                              <div class="d-flex">
                                  <div class="">
                                    <img src="assets/images/coins/06.png" class="img-fluid avatar avatar-50 avatar-rounded" alt="img57">
                                  </div>
                                  <div class="ms-3">
                                    <h6 class="mb-0 ">Litecoin</h6>
                                    <small class="float-left font-size-12">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</small>
                                  </div>
                              </div>
                            </a>
                        </div>
                      </div>
                  </div>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link py-0 d-flex align-items-center" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="assets/images/avatars/1.png" alt="User-Profile" class="img-fluid avatar avatar-50 avatar-rounded">
                    <div class="caption ms-3 ">
                        <h6 class="mb-0 caption-title">Wade Warren</h6>
                        <p class="mb-0 caption-sub-title">Super Admin</p>
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">                    
                    <li class="border-0"><a class="dropdown-item" href="index.jsp">Acceder a Administrador</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </nav>        <!--Nav End-->
      </div>
      <div class="container-fluid content-inner pb-0">
      <div class="row">
          <div class="col-lg-12">
             <div class="card">
               <div class="iq-header-img bg-soft-secondary" style="height: 576px;">
                  <img src="assets/images/pages/02-page.png" alt="header" class="img-fluid w-100 h-100" style="object-fit: contain;">
               </div>
                  <div class="card-body mt-n6">
                     <div class="d-flex align-items-center justify-content-between">
                        <div class="d-flex flex-wrap align-items-center">
                           <div class="profile-img position-relative me-3 mb-3 mb-lg-0">
                              <img src="assets/images/avatars/<%=cli.getId_cliente()%>.png" class="img-fluid avatar avatar-100 avatar-rounded" alt="profile-image">
                           </div>
                           <div class="d-flex align-items-center mb-3 mb-sm-0">
                              <div>
                                 <h6 class="me-2 text-warning"><%=cli.getNombre()+" "+cli.getApellidos() %></h6>
                                 <p><%=cli.getProvincia() %></p>
                              </div>
                              <div class="ms-3">
                                 <h6 class="me-2"><%=cli.getNombre().toLowerCase().replace(" ", "") %>@gmail.com</h6>
                                 <p>Email</p>
                              </div> 
                           </div>
                        </div>
                     </div>
                  </div>
             </div>
          </div>
      </div>
      <div class="row">
         <div class="col-md-12">
            <div class="row">
               <div class="col-lg-3">
             <div class="card">
               <div class="card-header">
                  <div class="header-title">
                     <h4 class="card-title text-primary">News</h4>
                  </div>
               </div>
               <div class="card-body">
                  <ul class="list-inline m-0 p-0">
                     <li class="d-flex mb-2">
                        <div class="news-icon me-3">
                           <svg width="20" viewBox="0 0 24 24">
                              <path fill="currentColor" d="M20,2H4A2,2 0 0,0 2,4V22L6,18H20A2,2 0 0,0 22,16V4C22,2.89 21.1,2 20,2Z" />
                           </svg>
                        </div>
                        <p class="news-detail mb-0">The global crypto market cap jumped to $1.60 trillion<a href="#">see details</a></p>
                     </li>
                     <li class="d-flex">
                        <div class="news-icon me-3">
                           <svg width="20" viewBox="0 0 24 24">
                              <path fill="currentColor" d="M20,2H4A2,2 0 0,0 2,4V22L6,18H20A2,2 0 0,0 22,16V4C22,2.89 21.1,2 20,2Z" />
                           </svg>
                        </div>
                        <p class="news-detail mb-0">Bitcoin, Etheruem and Uniswap gain up to 10%</p>
                     </li>
                  </ul>
               </div>
             </div>
             <div class="card">
               <div class="card-header d-flex align-items-center justify-content-between">
                  <div class="header-title">
                     <h4 class="card-title text-primary">Interest</h4>
                  </div>
               </div>
               <div class="card-body">
                  <div class="d-grid gap-card grid-cols-3">
                     <a data-fslightbox="Interset" href="assets/images/coins/04.png">
                        <img src="assets/images/coins/04.png" class="img-fluid  rounded" alt="profile-image">
                     </a>
                     <a data-fslightbox="Interset" href="assets/images/coins/01.png">
                        <img src="assets/images/coins/01.png" class="img-fluid rounded" alt="profile-image">
                     </a>
                     <a data-fslightbox="Interset" href="assets/images/coins/12.png">
                        <img src="assets/images/coins/12.png" class="img-fluid rounded" alt="profile-image">
                     </a>
                     <a data-fslightbox="Interset" href="assets/images/coins/09.png">
                        <img src="assets/images/coins/09.png" class="img-fluid rounded" alt="profile-image">
                     </a>
                     <a data-fslightbox="Interset" href="assets/images/coins/10.png">
                        <img src="assets/images/coins/10.png" class="img-fluid rounded" alt="profile-image">
                     </a>
                     <a data-fslightbox="Interset" href="assets/images/coins/13.png">
                        <img src="assets/images/coins/13.png" class="img-fluid rounded" alt="profile-image">
                     </a>
                  </div>
               </div>
             </div>
             <div class="card">
               <div class="card-header">
                  <div class="header-title">
                     <h4 class="card-title text-primary">Our Letest News</h4>
                  </div>
               </div>
               <div class="card-body">
                  <div class="twit-feed">
                     <div class="d-flex align-items-center mb-2">
                        <img class="rounded-pill img-fluid avatar-50 me-3   ps-2" src="assets/images/coins/01.png" alt="">
                        <div class="media-support-info">
                           <h6 class="mb-0">Bitcoin</h6>
                           <p class="mb-0">Bitcoin Price 
                              <span class="text-primary">
                                 <svg width="15" viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M10,17L5,12L6.41,10.58L10,14.17L17.59,6.58L19,8M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                                 </svg>
                              </span>
                           </p>
                        </div>
                     </div>
                     <div class="media-support-body">
                        <p class="mb-0">           
                           <p class="mb-0">The total market value of cryptocurrencies rose above $2 trillion again as Bitcoin</p></p>
                        <div class="twit-date">07 Jan 2021</div>
                     </div>
                  </div>
                  <hr class="my-3">
                  <div class="twit-feed">
                     <div class="d-flex align-items-center mb-2">
                        <img class="rounded-pill img-fluid avatar-50 me-3" src="assets/images/coins/04.png" alt="">
                        <div class="media-support-info">
                           <h6 class="mb-0">LiteCoin</h6>
                           <p class="mb-0">Litecoin Price
                              <span class="text-primary">
                                 <svg width="15" viewBox="0 0 24 24">
                                    <path fill="currentColor" d="M10,17L5,12L6.41,10.58L10,14.17L17.59,6.58L19,8M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
                                 </svg>
                              </span>
                           </p>
                        </div>
                     </div>
                     <div class="media-support-body">
                        <p class="mb-0">Cryptocurrency market has been less volatile of late but major digital tokens are down by a third this month</p>
                        <div class="twit-date mt-2">18 Feb 2021</div>
                     </div>
                  </div>
               </div>
            </div>
          </div>
               <div class="col-lg-6">
                  <div class="profile-content tab-content">
               <div id="profile-feed" class="tab-pane fade active show">
                  <div class="card">
                     <div class="card-header d-flex align-items-center justify-content-between pb-4">
                        <div class="header-title">
                           <div class="d-flex flex-wrap">
                              <div class="media-support-user-img me-3">
                                 <img class="rounded-pill img-fluid avatar-60 bg-soft-danger " src="assets/images/avatars/2.png" alt="">
                              </div>
                              <div class="media-support-info mt-2">
                                 <h5 class="mb-0">Anna Sthesia</h5>
                                 <p class="mb-0 text-primary">Amigos</p>
                              </div>
                           </div>
                        </div>                        
                        <div class="dropdown">
                           <span class="dropdown-toggle" id="dropdownMenuButton7" data-bs-toggle="dropdown" aria-expanded="false" role="button">
                           29 mins 
                           </span>
                           <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton7">
                              <a class="dropdown-item " href="javascript:void(0);">Action</a>
                              <a class="dropdown-item " href="javascript:void(0);">Another action</a>
                              <a class="dropdown-item " href="javascript:void(0);">Something else here</a>
                           </div>
                        </div>
                     </div>
                     <div class="card-body p-0">
                        <div class="user-post">
                           <a href="javascript:void(0);"><img src="assets/images/pages/01-page.png" alt="post-image" class="img-fluid"></a>
                        </div>
                        <div class="comment-area p-3">
                           <div class="d-flex flex-wrap justify-content-between align-items-center">
                              <div class="d-flex align-items-center">
                                 <div class="d-flex align-items-center message-icon me-3">                                          
                                    <svg width="20" height="20" viewBox="0 0 24 24">
                                       <path fill="currentColor" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
                                    </svg>
                                    <span class="ms-1"><%
                                    		int numeroMG =(int)(Math.random()*200+1);
											 out.print(numeroMG);
                                    %></span>
                                 </div>
                                 <div class="d-flex align-items-center feather-icon">
                                    <svg width="20" height="20" viewBox="0 0 24 24">
                                       <path fill="currentColor" d="M9,22A1,1 0 0,1 8,21V18H4A2,2 0 0,1 2,16V4C2,2.89 2.9,2 4,2H20A2,2 0 0,1 22,4V16A2,2 0 0,1 20,18H13.9L10.2,21.71C10,21.9 9.75,22 9.5,22V22H9M10,16V19.08L13.08,16H20V4H4V16H10Z" />
                                    </svg>
                                    <span class="ms-1"><%
                                    		int numeroRep =(int)(Math.random()*80+1);
											 out.print(numeroRep);
                                    %></span>
                                 </div>
                              </div>
                              <div class="share-block d-flex align-items-center feather-icon">
                                 <a href="javascript:void(0);" data-bs-toggle="offcanvas" data-bs-target="#share-btn" aria-controls="share-btn">
                                 <span class="ms-1">
                                       <svg width="18" class="me-1" viewBox="0 0 24 24">
                                          <path fill="currentColor" d="M18 16.08C17.24 16.08 16.56 16.38 16.04 16.85L8.91 12.7C8.96 12.47 9 12.24 9 12S8.96 11.53 8.91 11.3L15.96 7.19C16.5 7.69 17.21 8 18 8C19.66 8 21 6.66 21 5S19.66 2 18 2 15 3.34 15 5C15 5.24 15.04 5.47 15.09 5.7L8.04 9.81C7.5 9.31 6.79 9 6 9C4.34 9 3 10.34 3 12S4.34 15 6 15C6.79 15 7.5 14.69 8.04 14.19L15.16 18.34C15.11 18.55 15.08 18.77 15.08 19C15.08 20.61 16.39 21.91 18 21.91S20.92 20.61 20.92 19C20.92 17.39 19.61 16.08 18 16.08M18 4C18.55 4 19 4.45 19 5S18.55 6 18 6 17 5.55 17 5 17.45 4 18 4M6 13C5.45 13 5 12.55 5 12S5.45 11 6 11 7 11.45 7 12 6.55 13 6 13M18 20C17.45 20 17 19.55 17 19S17.45 18 18 18 19 18.45 19 19 18.55 20 18 20Z"></path>
                                       </svg>
                                       99 Share</span></a>
                              </div>
                           </div>
                           <hr>
                           <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nulla dolor, ornare at commodo non, feugiat non nisi. Phasellus faucibus mollis pharetra. Proin blandit ac massa sed rhoncus</p>
                           <hr>
                           <ul class="list-inline p-0 m-0">
                              <li class="mb-2">
                                 <div class="d-flex">
                                    <img src="assets/images/avatars/3.png" alt="userimg" class="avatar-50  rounded-pill img-fluid">
                                    <div class="ms-3">
                                       <h6 class="mb-1">Monty Carlo</h6>
                                       <p class="mb-1">Lorem ipsum dolor sit amet</p>
                                       <div class="d-flex flex-wrap align-items-center mb-1">
                                          <a href="javascript:void(0);" class="me-3">
                                             <svg width="20" height="20" class="text-body me-1" viewBox="0 0 24 24">
                                                <path fill="currentColor" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
                                             </svg>
                                             like
                                          </a>
                                          <a href="javascript:void(0);" class="me-3">
                                             <svg width="20" height="20" class="me-1" viewBox="0 0 24 24">
                                                <path fill="currentColor" d="M8,9.8V10.7L9.7,11C12.3,11.4 14.2,12.4 15.6,13.7C13.9,13.2 12.1,12.9 10,12.9H8V14.2L5.8,12L8,9.8M10,5L3,12L10,19V14.9C15,14.9 18.5,16.5 21,20C20,15 17,10 10,9" />
                                             </svg>
                                             reply
                                          </a>
                                          <a href="javascript:void(0);" class="me-3">translate</a>
                                          <span> 5 min </span>
                                       </div>
                                    </div>
                                 </div>
                              </li>
                              <li>
                                 <div class="d-flex">
                                    <img src="assets/images/avatars/4.png" alt="userimg" class="avatar-50  rounded-pill img-fluid">
                                    <div class="ms-3">
                                       <h6 class="mb-1">Paul Molive</h6>
                                       <p class="mb-1">Lorem ipsum dolor sit amet</p>
                                       <div class="d-flex flex-wrap align-items-center">
                                          <a href="javascript:void(0);" class="me-3">
                                             <svg width="20" height="20" class="text-body me-1" viewBox="0 0 24 24">
                                                <path fill="currentColor" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
                                             </svg>
                                             like
                                          </a>
                                          <a href="javascript:void(0);" class="me-3">
                                             <svg width="20" height="20" class="me-1" viewBox="0 0 24 24">
                                                <path fill="currentColor" d="M8,9.8V10.7L9.7,11C12.3,11.4 14.2,12.4 15.6,13.7C13.9,13.2 12.1,12.9 10,12.9H8V14.2L5.8,12L8,9.8M10,5L3,12L10,19V14.9C15,14.9 18.5,16.5 21,20C20,15 17,10 10,9" />
                                             </svg>
                                             reply
                                          </a>
                                          <a href="javascript:void(0);" class="me-3">translate</a>
                                          <span> 5 min </span>
                                       </div>
                                    </div>
                                 </div>
                              </li>
                           </ul>
                           <form class="comment-text d-flex align-items-center mt-3" action="javascript:void(0);">
                              <input type="text" class="form-control rounded" placeholder="Lovely!">
                              <div class="comment-attagement d-flex">
                                    <a href="javascript:void(0);" class="me-2 text-body">
                                       <svg width="20" height="20" viewBox="0 0 24 24">
                                          <path fill="currentColor" d="M20,12A8,8 0 0,0 12,4A8,8 0 0,0 4,12A8,8 0 0,0 12,20A8,8 0 0,0 20,12M22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2A10,10 0 0,1 22,12M10,9.5C10,10.3 9.3,11 8.5,11C7.7,11 7,10.3 7,9.5C7,8.7 7.7,8 8.5,8C9.3,8 10,8.7 10,9.5M17,9.5C17,10.3 16.3,11 15.5,11C14.7,11 14,10.3 14,9.5C14,8.7 14.7,8 15.5,8C16.3,8 17,8.7 17,9.5M12,17.23C10.25,17.23 8.71,16.5 7.81,15.42L9.23,14C9.68,14.72 10.75,15.23 12,15.23C13.25,15.23 14.32,14.72 14.77,14L16.19,15.42C15.29,16.5 13.75,17.23 12,17.23Z" />
                                       </svg>
                                    </a>
                                    <a href="javascript:void(0);" class="text-body">
                                       <svg width="20" height="20" viewBox="0 0 24 24">
                                          <path fill="currentColor" d="M20,4H16.83L15,2H9L7.17,4H4A2,2 0 0,0 2,6V18A2,2 0 0,0 4,20H20A2,2 0 0,0 22,18V6A2,2 0 0,0 20,4M20,18H4V6H8.05L9.88,4H14.12L15.95,6H20V18M12,7A5,5 0 0,0 7,12A5,5 0 0,0 12,17A5,5 0 0,0 17,12A5,5 0 0,0 12,7M12,15A3,3 0 0,1 9,12A3,3 0 0,1 12,9A3,3 0 0,1 15,12A3,3 0 0,1 12,15Z" />
                                       </svg>
                                    </a>
                              </div>
                           </form>
                        </div>                              
                     </div>
                  </div>
                  <div class="card">
                     <div class="card-header d-flex align-items-center justify-content-between pb-4">
                        <div class="header-title">
                           <div class="d-flex flex-wrap">
                              <div class="media-support-user-img me-3">
                                 <img class="rounded-pill img-fluid avatar-60 " src="assets/images/avatars/5.png" alt="">
                              </div>
                              <div class="media-support-info mt-2">
                                 <h5 class="mb-0">Wade Warren</h5>
                                 <p class="mb-0 text-primary">Amigos</p>
                              </div>
                           </div>
                        </div>                        
                        <div class="dropdown">
                           <span class="dropdown-toggle" id="dropdownMenuButton07" data-bs-toggle="dropdown" aria-expanded="false" role="button">
                           1 Hr
                           </span>
                           <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton07">
                              <a class="dropdown-item " href="javascript:void(0);">Action</a>
                              <a class="dropdown-item " href="javascript:void(0);">Another action</a>
                              <a class="dropdown-item " href="javascript:void(0);">Something else here</a>
                           </div>
                        </div>
                     </div>
                     <div class="card-body p-0">
                           <p class="p-3 mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nulla dolor, ornare at commodo non, feugiat non nisi. Phasellus faucibus mollis pharetra. Proin blandit ac massa sed rhoncus</p>
                           <div class="comment-area p-3"><hr class="mt-0">
                           <div class="d-flex flex-wrap justify-content-between align-items-center">
                              <div class="d-flex align-items-center">
                                 <div class="d-flex align-items-center message-icon me-3">                                          
                                    <svg width="20" height="20" viewBox="0 0 24 24">
                                       <path fill="currentColor" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
                                    </svg>
                                    <span class="ms-1"><%
                                    		
											 out.print(numeroMG);
                                    %></span>
                                 </div>
                                 <div class="d-flex align-items-center feather-icon">
                                    <svg width="20" height="20" viewBox="0 0 24 24">
                                       <path fill="currentColor" d="M9,22A1,1 0 0,1 8,21V18H4A2,2 0 0,1 2,16V4C2,2.89 2.9,2 4,2H20A2,2 0 0,1 22,4V16A2,2 0 0,1 20,18H13.9L10.2,21.71C10,21.9 9.75,22 9.5,22V22H9M10,16V19.08L13.08,16H20V4H4V16H10Z" />
                                    </svg>
                                    <span class="ms-1"><%
                                    		
											 out.print(numeroRep);
                                    %></span>
                                 </div>
                              </div>
                              <div class="share-block d-flex align-items-center feather-icon">
                                 <a href="javascript:void(0);" data-bs-toggle="offcanvas" data-bs-target="#share-btn" aria-controls="share-btn">
                                    <span class="ms-1">
                                       <svg width="18" class="me-1" viewBox="0 0 24 24">
                                          <path fill="currentColor" d="M18 16.08C17.24 16.08 16.56 16.38 16.04 16.85L8.91 12.7C8.96 12.47 9 12.24 9 12S8.96 11.53 8.91 11.3L15.96 7.19C16.5 7.69 17.21 8 18 8C19.66 8 21 6.66 21 5S19.66 2 18 2 15 3.34 15 5C15 5.24 15.04 5.47 15.09 5.7L8.04 9.81C7.5 9.31 6.79 9 6 9C4.34 9 3 10.34 3 12S4.34 15 6 15C6.79 15 7.5 14.69 8.04 14.19L15.16 18.34C15.11 18.55 15.08 18.77 15.08 19C15.08 20.61 16.39 21.91 18 21.91S20.92 20.61 20.92 19C20.92 17.39 19.61 16.08 18 16.08M18 4C18.55 4 19 4.45 19 5S18.55 6 18 6 17 5.55 17 5 17.45 4 18 4M6 13C5.45 13 5 12.55 5 12S5.45 11 6 11 7 11.45 7 12 6.55 13 6 13M18 20C17.45 20 17 19.55 17 19S17.45 18 18 18 19 18.45 19 19 18.55 20 18 20Z"></path>
                                       </svg>
                                       99 Share
                                    </span>
                                 </a>
                              </div>
                           </div>
                           <form class="comment-text d-flex align-items-center mt-3" action="javascript:void(0);">
                              <input type="text" class="form-control rounded" placeholder="Lovely!">
                              <div class="comment-attagement d-flex">
                                 <a href="javascript:void(0);" class="me-2 text-body">
                                    <svg width="20" height="20" viewBox="0 0 24 24">
                                       <path fill="currentColor" d="M20,12A8,8 0 0,0 12,4A8,8 0 0,0 4,12A8,8 0 0,0 12,20A8,8 0 0,0 20,12M22,12A10,10 0 0,1 12,22A10,10 0 0,1 2,12A10,10 0 0,1 12,2A10,10 0 0,1 22,12M10,9.5C10,10.3 9.3,11 8.5,11C7.7,11 7,10.3 7,9.5C7,8.7 7.7,8 8.5,8C9.3,8 10,8.7 10,9.5M17,9.5C17,10.3 16.3,11 15.5,11C14.7,11 14,10.3 14,9.5C14,8.7 14.7,8 15.5,8C16.3,8 17,8.7 17,9.5M12,17.23C10.25,17.23 8.71,16.5 7.81,15.42L9.23,14C9.68,14.72 10.75,15.23 12,15.23C13.25,15.23 14.32,14.72 14.77,14L16.19,15.42C15.29,16.5 13.75,17.23 12,17.23Z" />
                                    </svg>
                                 </a>
                                 <a href="javascript:void(0);" class="text-body">
                                    <svg width="20" height="20" viewBox="0 0 24 24">
                                       <path fill="currentColor" d="M20,4H16.83L15,2H9L7.17,4H4A2,2 0 0,0 2,6V18A2,2 0 0,0 4,20H20A2,2 0 0,0 22,18V6A2,2 0 0,0 20,4M20,18H4V6H8.05L9.88,4H14.12L15.95,6H20V18M12,7A5,5 0 0,0 7,12A5,5 0 0,0 12,17A5,5 0 0,0 17,12A5,5 0 0,0 12,7M12,15A3,3 0 0,1 9,12A3,3 0 0,1 12,9A3,3 0 0,1 15,12A3,3 0 0,1 12,15Z" />
                                    </svg>
                                 </a>
                              </div>
                           </form>
                        </div>                              
                           </div>
                        </div>                              
                     </div>
                  </div>
               </div>
                <div class="col-lg-3">
                  <div class="card">
                     <div class="card-header">
                        <div class="header-title">
                           <h4 class="card-title">Compras</h4>
                        </div>
                     </div>
                      <div class="card-body">
                        <ul class="list-inline m-0 p-0">
                        
                          <%
                          ArrayList<Compras> comprasCliente = new ArrayList<Compras>();
                          comprasCliente = BDCont.comprasClientes(cli.getId_cliente());
                          for(int i = 0;i<comprasCliente.size();i++){
                        	  Criptomoneda criptoCliente = new Criptomoneda();
                        	  criptoCliente = BDCont.dameCripto(comprasCliente.get(i).getId_criptomoneda());
								%>
                           <li class="d-flex align-items-center">
                              <img src="assets/images/criptos/<%=comprasCliente.get(i).getId_criptomoneda()%>.png" alt="story-img" class="rounded-pill avatar-40  img-fluid">
                              <div class="ms-3">
                                 <h5><%=criptoCliente.getNombre() %></h5>
                                 <p class="mb-0"><%=comprasCliente.get(i).getUnidades() %> unidades</p>
                              </div>
                           </li>
                           <% } %>
                        </ul>
                     </div>
                  </div>
                  <div class="card">
                     <div class="card-header">
                        <div class="header-title">
                           <h4 class="card-title">Market Cap</h4>
                        </div>
                     </div>
                     <div class="card-body">
                        <ul class="list-inline m-0 p-0">
                        
                          <%DecimalFormat formato1 = new DecimalFormat("#.00"); 
                          for(int i = 0;i<rankingCriptos.size();i++){
								%>
                           <li class="d-flex align-items-center">
                              <img src="assets/images/criptos/<%=rankingCriptos.get(i).getId_crypto()%>.png" alt="story-img" class="rounded-pill avatar-40  img-fluid">
                              <div class="ms-3">
                                 <h5><%=rankingCriptos.get(i).getNombre() %></h5>
                                 <p class="mb-0"><%=formato1.format(rankingCriptos.get(i).getCapitalizacion()) %>€</p>
                              </div>
                           </li>
                           <% } %>
                        </ul>
                     </div>
                  </div>
                  <div class="card">
                     <div class="card-header">
                        <div class="header-title">
                           <h4 class="card-title">Lineas de Billetera</h4>
                        </div>
                     </div>
                     <div class="card-body">
                        <ul class="list-inline m-0 p-0">
                        <%              
                        ArrayList<L_billetera> lineas = BDCont.dameLBCliente(cli.getId_cliente());
                        for(int i = 0;i<lineas.size();i++){
                        Criptomoneda cripto= new Criptomoneda();
                        cripto = BDCont.dameCripto(lineas.get(i).getId_criptomoneda());
                        %>
                           <li class="d-flex mb-4 align-items-center">
                              <div class="img-fluid rounded-pill"><img src="images/criptos/<%=lineas.get(i).getId_criptomoneda()%>.png" alt="story-img" class="rounded-pill avatar-40"></div>
                              <div class="ms-3 flex-grow-1">
                                 <h6><%="" %></h6>
                                 <p class="mb-0"><%=lineas.get(i).getUnidades()+" "+cripto.getNombre()%></p>
                              </div>
                           </li>    
                                       <% } %>              
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
          
      <div class="offcanvas offcanvas-bottom share-offcanvas" tabindex="-1" id="share-btn" aria-labelledby="shareBottomLabel">
         <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="shareBottomLabel">Share</h5>
            <button type="button" class="btn-close text-reset text-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
         </div>
         <div class="offcanvas-body small">
            <div class="d-flex flex-wrap align-items-center">
               <div class="text-center me-3 mb-3">
                  <img src="assets/images/brands/02.png" class="img-fluid rounded mb-2" alt="">
                  <h6>Facebook</h6>
               </div>
               <div class="text-center me-3 mb-3">
                  <img src="assets/images/brands/03.png" class="img-fluid rounded mb-2" alt="">
                  <h6>Instagram</h6>
               </div>
               <div class="text-center me-3 mb-3">
                  <img src="assets/images/brands/06.png" class="img-fluid rounded mb-2" alt="">
                  <h6>Google Plus</h6>
               </div>
               <div class="text-center me-3 mb-3">
                  <img src="assets/images/brands/04.png" class="img-fluid rounded mb-2" alt="">
                  <h6>linkedin</h6>
               </div>
                <div class="text-center me-3 mb-3">
                  <img src="assets/images/brands/05.png" class="img-fluid rounded mb-2" alt="">
                  <h6>twitter</h6>
               </div>
            </div>
         </div>
      </div>      </div>
      <footer class="footer">
          <div class="footer-body">
              <ul class="left-panel list-inline mb-0 p-0">
                  <li class="list-inline-item"><a href="dashboard/extra/privacy-policy.html" class="text-white">Privacy Policy</a></li>
                  <li class="list-inline-item"><a href="dashboard/extra/terms-of-service.html" class="text-white">Terms of Use</a></li>
              </ul>
              <div class="right-panel">
                  ©<script>document.write(new Date().getFullYear())</script> COINEX, Made with
                  <span class="text-gray">
                      <svg width="15" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path fill-rule="evenodd" clip-rule="evenodd" d="M15.85 2.50065C16.481 2.50065 17.111 2.58965 17.71 2.79065C21.401 3.99065 22.731 8.04065 21.62 11.5806C20.99 13.3896 19.96 15.0406 18.611 16.3896C16.68 18.2596 14.561 19.9196 12.28 21.3496L12.03 21.5006L11.77 21.3396C9.48102 19.9196 7.35002 18.2596 5.40102 16.3796C4.06102 15.0306 3.03002 13.3896 2.39002 11.5806C1.26002 8.04065 2.59002 3.99065 6.32102 2.76965C6.61102 2.66965 6.91002 2.59965 7.21002 2.56065H7.33002C7.61102 2.51965 7.89002 2.50065 8.17002 2.50065H8.28002C8.91002 2.51965 9.52002 2.62965 10.111 2.83065H10.17C10.21 2.84965 10.24 2.87065 10.26 2.88965C10.481 2.96065 10.69 3.04065 10.89 3.15065L11.27 3.32065C11.3618 3.36962 11.4649 3.44445 11.554 3.50912C11.6104 3.55009 11.6612 3.58699 11.7 3.61065C11.7163 3.62028 11.7329 3.62996 11.7496 3.63972C11.8354 3.68977 11.9247 3.74191 12 3.79965C13.111 2.95065 14.46 2.49065 15.85 2.50065ZM18.51 9.70065C18.92 9.68965 19.27 9.36065 19.3 8.93965V8.82065C19.33 7.41965 18.481 6.15065 17.19 5.66065C16.78 5.51965 16.33 5.74065 16.18 6.16065C16.04 6.58065 16.26 7.04065 16.68 7.18965C17.321 7.42965 17.75 8.06065 17.75 8.75965V8.79065C17.731 9.01965 17.8 9.24065 17.94 9.41065C18.08 9.58065 18.29 9.67965 18.51 9.70065Z" fill="currentColor"></path>
                      </svg>
                  </span> by <a href="https://iqonic.design/">IQONIC Design</a>.
              </div>
          </div>
      </footer>    </main>
     
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
  </body>
</html>