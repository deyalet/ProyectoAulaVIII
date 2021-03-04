<%-- 
    Document   : agenda
    Created on : 01-feb-2020, 9:17:44
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
        <link href="Principal/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

        <!-- LIBRERÍAS NORMALES -->
        <script src="lib/js/jquery.min.js"></script>
        <script src="lib/js/moment.min.js"></script>

        <!-- RELOJ -->
        <link href="lib/css/jquery-clockpicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="lib/js/jquery-clockpicker.min.js" type="text/javascript"></script>

        <!-- NECESARIO PARA EL MODAL -->
        <link rel="stylesheet" href="lib/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

        <!-- FULL CALENDAR -->
        <link rel="stylesheet" href="lib/css/fullcalendar.min.css">
        <script src="lib/js/fullcalendar.min.js"></script>
        <script src="lib/js/es.js" type="text/javascript"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

    </head>
    <body class="is-preload">
        <header id="header" style="">
            <a class="logo" href="Principal.jsp">
                <img style="margin-top:8px"src="img/circled_left_30px.png" title="Ir a la página anterior" alt="logo">
            </a>
        </header>
        <script language="javascript">
            function doSearch() {
                var tableReg = document.getElementById('contentTableA');
                var searchText = document.getElementById('searchTerm').value.toLowerCase();
                for (var i = 1; i < tableReg.rows.length; i++) {
                    var cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
                    var found = false;
                    for (var j = 0; j < cellsOfRow.length && !found; j++) {
                        var compareWith = cellsOfRow[j].innerHTML.toLowerCase();
                        if (searchText.length == 0 || (compareWith.indexOf(searchText) > -1)) {
                            found = true;
                        }
                    }
                    if (found) {
                        tableReg.rows[i].style.display = '';
                    } else {
                        tableReg.rows[i].style.display = 'none';
                    }
                }
            }
        </script>
        <br/>
        <div class="container">
            <br/>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">MAC address</span>
                </div>
                <input type="text" class="form-control" style="background: #ffffff;" id="txtMac">
            </div>
            <br/> <br/>
            <button id="btnVisualizar" type="button" onclick="getActividades()">Visualize</button>
            <button id="btnLimpiar" type="button" onclick="eliminarFilaA()">Clean up</button>
            <button id="btnPDF" type="button" onclick='getPDFA()'>Download pdf</button>
            <button type="button" data-toggle="modal" data-target="#eventoModal" onclick="getDestinatario()">Registrar</button><br><br>
        </div>

        <div class="container" id="invoice">
            <br/> <br/>
            <table class="table" id="contentTableA">
                <thead>
                    <tr>
                        <th scope="col">Number</th>
                        <th scope="col">Date</th>
                        <th scope="col">Hour</th>
                        <th scope="col">Message</th>
                        <th scope="col">Patient</th>
                        <th scope="col">MAC</th>
                        <th scope="col">Alias</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="eventoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="tituloEvento"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">DATOS GENERALES</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">CONFIGURACIÓN</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <input type="hidden" name="txtId" id="txtId" value="0">
                                <input type="hidden" id="txtCreador">
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label>Destinatario:</label>
                                        <select id="txtDestinatario" class="form-control" required>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label>Dispositivo:</label>
                                        <select id="txtDispositivo" class="form-control" required>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label>Mensaje:</label>
                                        <textarea id="txtMensaje" class="form-control" rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>Fecha:</label>
                                        <div class="input-group">
                                            <input type="date" id="txtFecha" class="form-control" placeholder="aaaa-mm-dd">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Hora a recordar:</label>
                                        <div class="input-group clockpicker" data-autoclose="true">
                                            <input type="text" id="txtHora" class="form-control" maxlength="5">
                                            <span class="input-group-addon">
                                                <i class="fa fa-clock-o fa-fw fa-2x"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="btnAgregarRecordatorio" class="button primary">Agregar</button>
                    </div>
                </div>
            </div>
        </div>        

        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase-auth.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase-database.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
        <script src="js/app.js" type="text/javascript"></script>
        <script src="js/recordatorio.js" type="text/javascript"></script>
    </body>
</html>