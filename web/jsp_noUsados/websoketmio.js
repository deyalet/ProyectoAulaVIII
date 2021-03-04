/* global WebSocket, websocket */

var webSocket;
var messages = document.getElementById("messages");
var rep = '100';
var control = parseInt('0');
//var objEvn = { id: <%=session.getAttribute("id")%> };

function openSocket() {
    control = parseInt('100');
    cont = -1;

    if (webSocket !== undefined && webSocket.readyState !== WebSocket.CLOSED) {
        console.log("Conexión con Websocket establecida");
        document.getElementById('Estado').innerHTML = 'Conectado';
        console.log(webSocket.protocol);
        return;
    };

    var ip = $('#txtip').val();
    console.log(ip);

    webSocket = new WebSocket('ws://' + ip + ':81/');

    webSocket.onopen = function (event) {
        if (event.data === undefined)
            return;
        console.log('Connected: ' + window.location.host);
    };

    webSocket.onmessage = function (event) {
        console.log(event.data);
        document.getElementById('ImaEjercicio').innerHTML = event.data;
        if(event.data === 'True') {
            console.log('Tarea cumplida');
        }
        $.ajax({
            type: "POST",
            url: 'consulta?a=' + <%=session.getAttribute("id")%>,
            data: {jdk: 56},
            success: function (data) {
                if (data.length > 0) {
                    webSocket.send(data);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("jqXHR : " + jqXHR + " text status : " + textStatus + " error : " + errorThrown);
            }
        });
    };

    webSocket.onerror = function (event) {
        console.log('WebSocket Error: ', event);
    };

    webSocket.onclose = function () {
        websocket.close();
        console.log('WebSocket connection closed');
        location.reload();
    };
}
;

function closeSocket() {
    webSocket.close(1000, "cerrado correctamente");
    console.log('Conexión Cerrada');
}
;