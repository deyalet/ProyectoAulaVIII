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
        <link href="lib/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="lib/js/jquery.min.js" type="text/javascript"></script>
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
                var tableReg = document.getElementById('contentTable');
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
        <div class="container">
            <br/>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">MAC address</span>
                </div>
                <input type="text" class="form-control" style="background: #ffffff;" id="txtMac">
            </div>
            <br/> <br/>
            <button id="btnVisualizar" type="button" onclick="getRecordatorio()">Visualize</button>
            <button id="btnLimpiar" type="button" onclick="eliminarFila()">Clean up</button>
            <button id="btnPDF" type="button" onclick='getPDF()'>Download pdf</button><br><br>
            SEARCH:  <input id="searchTerm" type="text" onkeyup="doSearch()" placeholder="Search" style="width : 300px;heigth: 40px" />

        </div>
        <div class="container" id='invoice'>
            <br/> <br/>
            <table class="table" id="contentTable">
                <thead>
                    <tr>
                        <th scope="col">Number</th>
                        <th scope="col">Date</th>
                        <th scope="col">Hour</th>
                        <th scope="col">Message</th>
                        <th scope="col">State</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>        
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase-auth.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase-database.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.8.5/firebase.js"></script>
        <script src="js/app.js" type="text/javascript"></script>
        <script src="js/reporteAduMayor.js" type="text/javascript"></script>
    </body>
</html>