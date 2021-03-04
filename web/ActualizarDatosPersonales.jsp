<%-- 
    Document   : usuariosB
    Created on : 11-feb-2020, 11:07:03
    Author     : sinchijr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="img/logoblancod.ico" href="img/logoblancod.ico"/>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link rel="stylesheet" href="Principal/css/main.css" />
        <script src="lib/js/jquery.min.js" type="text/javascript"></script>
        <link href="materialize/css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="materialize/css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <title>Agregar Pacientes</title>
    </head>
    <body class="is-preload">
        <header id="header" style="">
            <a class="logo" href="Principal.jsp">
                <img style="margin-top:8px"src="img/circled_left_30px.png" title="Ir a la página anterior" alt="logo">
            </a>
            <a class="logo center-align textgrueso " id="ulUserData"style="padding-top:6px; text-align:center; width:100%; font-size:20px; color:#707070" href="Principal.jsp">UPDATE PERSONAL DATA</a>
        </header>
        <form class="col s12">
            <div class="row">
                <div class="input-field col s6" style="margin-left:380px ; width: 350px">
                    <input  id="nombre" type="text" class="validate" placeholder="Name" onkeypress="return validar(event)">
                    <label for="nombre"></label>
                </div>
                <div class="input-field col s6" style="width: 350px; margin-left:20px">
                    <input id="apellido" type="text" class="validate" placeholder="Last Name" onkeypress="return validar(event)">
                    <label for="Apellido"></label>
                </div>

                <div class="row">
                    <div class="input-field col s12" style="margin-left:350px; width: 350px;">
                        <input maxlength="10" onblur="validar1()" id="cedula" type="text" class="validate" placeholder="Identification" onkeypress='return validaNumericos(event)'>
                        <label for="cedula"></label>
                    </div>
                    <div class="input-field col s6" style="width: 350px; margin-left:20px" >
                        <input id="fecha_nacimiento" type="date" class="validate" placeholder="Fecha de nacimiento">
                        <label for="Fecha de Nacimiento:"></label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12" style="width: 350px; margin-left:350px">
                        <input id="direccion" type="text" class="validate" placeholder="Direction">
                        <label for="Dirección"></label>
                    </div>

                    <div class="input-field col s6" style="width: 350px; margin-left:20px" >
                        <input id="celular" type="text" class="validate" placeholder="Phone" onkeypress='return validaNumericos(event)'>
                        <label for="Celular"></label>
                    </div>
                </div>
            </div>
        </form>
        <div id="contenido">
        </div>
        <button onclick="Actualizar()" class="btn btn-primary btn-user btn-block" style="height:50px; width:100px; position: absolute;left:44%">Send</button><br><br>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
        <script src="js/app.js"></script>
        <script src="js/ActualizarDatosPersonales.js"></script>
        <script src="js/TraerDatosPersonales.js"></script>
        
        <script type="text/javascript">
            function validar(e) { // 1
                tecla = (document.all) ? e.keyCode : e.which; // 2
                if (tecla == 8)
                    return true; // 3
                patron = /[A-Za-z\s]/; // 4
                te = String.fromCharCode(tecla); // 5
                return patron.test(te); // 6
            }
            function validaNumericos(event) {
                if (event.charCode >= 48 && event.charCode <= 57) {
                    return true;
                }
                return false;
            }
            function validar1() {
                var cad = document.getElementById("cedula").value.trim();
                var total = 0;
                var longitud = cad.length;
                var longcheck = longitud - 1;

                if (cad !== "" && longitud === 10) {
                    for (i = 0; i < longcheck; i++) {
                        if (i % 2 === 0) {
                            var aux = cad.charAt(i) * 2;
                            if (aux > 9)
                                aux -= 9;
                            total += aux;
                        } else {
                            total += parseInt(cad.charAt(i)); // parseInt o concatenará en lugar de sumar
                        }
                    }
                    total = total % 10 ? 10 - total % 10 : 0;

                    if (cad.charAt(longitud - 1) == total) {
                        //alert("cedula valida");
                        //document.getElementById("salida").innerHTML = ("Cedula Válida");
                    } else {
                        alert("cedula invalida");
                        document.getElementById("cedula").value = "";
                        //document.getElementById("salida").innerHTML = ("Cedula Inválida");
                    }
                }
            }
        </script>
    </body>
</html>