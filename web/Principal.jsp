<%-- 
    Document   : Principal
    Created on : 11-nov-2019, 13:23:47
    Author     : Mayra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Proyecto VI - Remenber me</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="img/logoblancod.ico" href="img/logoblancod.ico"/>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link rel="stylesheet" href="Principal/css/main.css" />
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    </head>
    <body class="is-preload">    
        <!-- Encabezado -->
        <header id="header" style="">           
            <a class="logo" id="ulUserData" href="index.html">${sessionScope.nombre}</a>
            <nav>
                <a href="#menu" style="color:white" >Setting</a>
            </nav>
        </header>
        <!-- Nav -->
        <nav id="menu"  style="color:white">
            <ul class="links">
                <li><a href="ReporteKi.jsp" style="" id="Reports" >Reports</a></li>
                <li><a href="ReporteKiAduMayor.jsp" style="" id="esd" >Reports1</a></li>
                <li><a href="dispositivo.jsp" style=""id="AssignDevice"  >Assign Device</a></li>
                <li><a href="recordatorios.jsp" style=""id="Device"  >Device</a></li>
                <li><a href="ActualizarDatosPersonales.jsp" style=""id="UpdatePersonalData"  >Update Personal Data</a></li>
                <li><a href="ActualizarDatosPacientes.jsp" style=""id="UpdatePatientData"  >Update Patient Data</a></li>
                <li><a href="AgregarPaciente.jsp" style=""id="AddPatient"  >Add Patient</a></li>
                <li><a href="CambiarClave.jsp" style=""id="changePassword"  >change Password</a></li>
                <li><a href="#" onclick="cerrar()"id="Signoff" >Sign off</a></li>
                <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
                <script src="js/app.js"></script>
                <script src="js/CerrarConexion.js"></script>
            </ul>
        </nav>
        <!-- container principal -->
        <section class="wrapper">
            <div class="inner">
                <div class="highlights">
                    <!-- PRIMER MODULO -->
                    <section>
                        <div class="content" id="Reminders">
                            <header>
                                <a href="recordatorios.jsp">
                                    <img alt="" src="img/recordar.png">
                                    <span class="label"></span></a>
                                <h3 style="color:#f37870; font-weight: bold">Reminders</h3>
                            </header>
                            <p>Add, Modify, Delete, your reminders</p>
                            <a href="recordatorios.jsp" class="button primary">To access</a>
                        </div>
                    </section>
                    <!-- SEGUNDO MODULO -->
                    <section>
                        <div class="content" id="Reports1">
                            <header>
                                <a href="#" >
                                    <img alt="" src="img/analyze_60px.png">
                                    <span class="label"></span></a>
                                <h3 style="color:#f37870; font-weight: bold" >Reports</h3>
                            </header>
                            <p>Show the detail of the assigned activities</p>
                            <a href="#" class="button primary">To access</a>
                        </div>
                    </section>

                    <!-- TERCER MODULO -->
                    <section>
                        <div class="content" id="Developers">
                            <header>
                                <a href="InformacionP.jsp" >
                                    <img alt="" src="img/des.png">
                                    <span class="label"></span></a>
                                <h3 style="color:#f37870; font-weight: bold" >Developers</h3>
                            </header>
                            <p>information about application developers</p>
                            <a href="InformacionP.jsp" class="button primary">To access</a>
                        </div>
                    </section>

                </div>
            </div>
        </section>

        <!-- Scripts -->
        <script src="Principal/js/jquery.min.js"></script>
        <script src="Principal/js/browser.min.js"></script>
        <script src="Principal/js/breakpoints.min.js"></script>
        <script src="Principal/js/util.js"></script>
        <script src="Principal/js/main.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase-auth.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase-database.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
        <script src="js/app.js"></script>
        <script src="js/Role.js"></script>

    </body>
</html>