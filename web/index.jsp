<%-- 
    Document   : index
    Created on : 10-nov-2019, 10:28:21
    Author     : Mayra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<!DOCTYPE html>

<head>
    <title>Proyecto VI - Remenber me</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="icon" type="img/logoblancod.ico" href="img/logoblancod.ico"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="css/colores.css" rel="stylesheet" type="text/css"/>
    <link href="css/materialize.css" rel="stylesheet" type="text/css"/>
    <script src="js/materialize.js" type="text/javascript"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
</head>
<%
    HttpSession s = request.getSession();
    //variables de session
%>

<body>
    <form id="form1" action="Login1" name="frm1"  autocomplete="off">
        <!--Div del fondo colorido-->
        <div id="fondocolors" style="background-color:black">
            <!--Div para el logotipo-->
            <div id="divlogo">
                <div id="logotipo" style="display: inline-block">
                    <img src="img/logoblancod.png" alt="Alternate Text">
                    <p>REMEMBER ME</p>
                </div>
            </div>

            <!--Div para el título y subtítulo-->
            <div id="divtitulo">
                <div id="divsubt" style="opacity: 0">
                    <div style="display: inline-block;">
                        <p class="textgrueso">welcome to the new age</p>
                        <p class="textdelgado">Control patient follow-up</p>
                    </div>
                </div>
                <!--Div de inicio de sesión-->
                <div class="divforlog">
                    <!--Panel blanco inicio de sesión-->
                    <div id="divlogin" style="display: inline-block">
                        <!--Títulos-->
                        <p class="textgrueso" style="padding-top:30px; text-align:center; width:100%; font-size:20px; color:#707070">LOG IN</p>
                        <img src="img/users.gif" alt="" style="height:150px; width: 180px; margin:auto; text-align:center; margin-top:5px"/>

                        <!--Nombre de usuario-->
                        <div class="input-field col s6" style="margin-left:0px; margin-right:10px; margin-top:-1px; height:30px;">
                            <img alt="" src="img/icons8_User_Male_30px.png" style="position:absolute; margin-left: 0px; margin-top:15px"/>
                            <input id="inputEmail" name="usuario" class="validate" type="text" style="width:240px; margin-left:40px; margin-top:2px">
                            <label for="UserName" style="width:270px; margin-left:78px;">
                                Username</label>
                        </div>
                        <!--Contraseña-->
                        <div class="input-field col s6" style="margin-left:0px; margin-right:10px; margin-top:55px; height:30px; top: 0px; left: 0px;">
                            <img alt="" src="img/icons8_Lock_2_30px.png" style="position:absolute; margin-left: 0px; margin-top:15px"/>
                            <input id="inputPassword" class="validate" type="password"  name="clave" style="width:240px; margin-left:40px; margin-top:2px">
                            <label for="clave" style="width:270px; margin-left:78px;">
                                Password</label>
                        </div>
                        <div style="position: absolute; width: 370px; margin-top:-10px; margin-left:3px;">
                            <p style="color:black; background-color:white; font-family:sans-serif; font-size:11px; text-align:center">

                                <span>

                                </span>
                            </p>

                            <p style="color:black; background-color:white; font-family:sans-serif; font-size:11px; text-align:center; margin-top:3px; left: 4%;position: relative;top: 60px">
                                <a id="LinkButton1" class="waves-effect waves-light btn modal-trigger" href="usuariosB.jsp">
                                    <strong>Create new account</strong>
                                </a>
                            </p>
                            <p style="color:black; background-color:white; font-family:sans-serif; font-size:11px; text-align:center; margin-top:3px; left: 4%;position: relative;top: 60px">
                                <a id="LinkButton1" class="waves-effect waves-light btn modal-trigger" href="RecuperarContrasenia.jsp">
                                    <strong>Forgot password</strong>
                                </a>
                            </p>
                        </div>
                        <!--Final panel blanco inicio de sesión-->
                    </div>
                    <!--Final div inicio de sesión-->
                </div>
            </div>

            <div id="diviconos">
                <!--Párrafo con centrado vertical-->                                
                <p id="paricons">
                    <img src="img/estruc.png" alt="Alternate Text" style="height:18px; width:18px; margin-left:-20px" />
                    <strong>&nbsp&nbsp MODULES OF THIS VERSION</strong>
                </p>

                <div>
                    <img src="img/recordar.png" alt="" style="display:block; margin:auto; text-align:center"/>
                    <p style="color:#f37870; font-size:16px" class="textgrueso">Reminders</p>
                    <p>Add, Modify, Delete, your reminders</p>
                </div>

                <div>
                    <img src="img/analyze_60px.png" alt="" style="display:block; margin:auto; text-align:center"/>
                    <p style="color:#f37870; font-size:16px" class="textgrueso">Reports</p>
                    <p>Show the detail of the assigned activities</p>
                </div>
                <div>
                    <img src="img/des.png" alt="" style="display:block; margin:auto; text-align:center"/>
                    <p style="color:#f37870; font-size:16px" class="textgrueso">Developers</p>
                    <p>information about application developers</p>
                </div>
            </div>
        </div>
    </div>
    <!--REGISTRAR MODAL-->   
    <div id="modal1" class="modal">
        <div class="modal-content">
            <h4>cvbnmk,l</h4>
            <p>cvbnm,./</p>
        </div>
        <div class="modal-footer">
            <a href="#!" class=" btn modal-close ">Cerrar</a>
        </div>
    </div>
</div>
</form>
<button class="btn btn-primary btn-user btn-block" id="btnLogin" style="height:30px; width:100px; position: relative;left:73%; top: 100px;" >Log In</button>
<script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
<script src="js/app.js"></script>
<script src="js/authentication.js"></script>


</body>
</form>





