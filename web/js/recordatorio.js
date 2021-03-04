/* global html2pdf, firebase */

var db = firebase.database();

$('.clockpicker').clockpicker({'default': 'now'});

function getDestinatario() {
    limpiarFormario();
    $('#txtDestinatario').empty();
    let arrayKeysUser = [];
    let objStructura;
    firebase.auth().onAuthStateChanged(function (user) {
        if (user) {
            var user = firebase.auth().currentUser;
            var f = user.uid;
            db.ref('registro/' + f).once('value').then((snapshot) => {
                objStructura = (snapshot.val());
                arrayKeysUser = Object.keys(objStructura);
                for (let i = 0; i < arrayKeysUser.length; i++) {
                    getDestinatarioInfo(arrayKeysUser[i]);
                    getDispositivoDestinatario(arrayKeysUser[i]);
                }
            });
        }
    }).catch(function (error) {
        console.log("Got an error: ", error);
    });
}
;
function getDestinatarioInfo(datoBuscar) {
    db.ref('usuario/' + datoBuscar).once('value').then((snapshot) => {
        console.log(datoBuscar);
        var $newOpt = $("<option>").attr("value", datoBuscar).text(snapshot.val().cedula + " - " + snapshot.val().apellido + " " + snapshot.val().nombre);
        $("#txtDestinatario").append($newOpt);
        $("#txtDestinatario").trigger('contentChanged');
    });
}
;

document.querySelector('#txtDestinatario').addEventListener('change', (event) => {
    console.log(event.target.value);
    $('#txtDispositivo').empty();
    getDispositivoDestinatario(event.target.value);
});

function getDispositivoDestinatario(parameters) {
    let ref = db.ref("dispositivos");
    ref.orderByChild("id_usuario").equalTo(parameters).on("child_added", function (snapshot) {
        console.log(snapshot.val());
        var $newOpt = $("<option>").attr("value", snapshot.val().mac).text(snapshot.val().alias);
        $("#txtDispositivo").append($newOpt);
        $("#txtDispositivo").trigger('contentChanged');
    });
}
;

function limpiarFormario() {
    $('#txtId').val('0');
    $('#txtMensaje').val('');
    $('#txtDestinatario').val('');
    $('#txtDispositivo').val('');
    $('#txtFecha').val('');
    $('#txtHora').val('');
    $('#txtDestinatario').empty();
    $('#txtDispositivo').empty();
}
;

$('#btnAgregarRecordatorio').click(function () {
    let mac = $('#txtDispositivo').val();
    let estado = 'activo';
    let fecha = moment($('#txtFecha').val()).format('DD-MM-YYYY');
    console.log(fecha);
    let hora = $('#txtHora').val();
    let mensaje = $('#txtMensaje').val();
    let idrecordatorio = firebase.database().ref("recordatorios/" + mac).push().getKey();
    firebase.database().ref('datos/recordatorios/' + mac + '/' + idrecordatorio).set({
        estado: estado,
        fecha: fecha,
        hora: hora,
        mensaje: mensaje
    });
    alert('Recordatorio registrado exitosamente');
    window.location.replace('Principal.jsp');
});
$('#btnBorrar').click(function () {
    let mac = $('#txtDispositivo').val();
    let estado = 'activo';
    let fecha = $('#txtFecha').val();
    let hora = $('#txtHora').val();
    let mensaje = $('#txtMensaje').val();
    let idrecordatorio = firebase.database().ref("recordatorios/" + mac).push().getKey();
    firebase.database().ref('datos/recordatorios/' + mac + '/' + idrecordatorio).update({
        estado: estado,
        fecha: fecha,
        hora: hora,
        mensaje: mensaje
    });
    alert('Recordatorio registrado exitosamente');
    window.location.replace('Principal.jsp');
});

$('#btnModificar').click(function () {
    let mac = $('#txtDispositivo').val();
    let estado = 'activo';
    let fecha = $('#txtFecha').val();
    let hora = $('#txtHora').val();
    let mensaje = $('#txtMensaje').val();
    let idrecordatorio = firebase.database().ref("recordatorios/" + mac).push().getKey();
    firebase.database().ref('datos/recordatorios/' + mac + '/' + idrecordatorio).update({
        estado: estado,
        fecha: fecha,
        hora: hora,
        mensaje: mensaje
    });
    alert('Recordatorio registrado exitosamente');
    window.location.replace('Principal.jsp');
});

function getSubSubActivity(fecha, hora, mensaje, mac, alias, id_usuario, i) {
    db.ref('usuario/' + id_usuario).once('value').then((snapshot) => {
        $("#contentTableA > tbody").append('<tr><th scope="row">' + (i + 1) + '</th><td>' + fecha + '</td><td>' + hora + '</td><td>' + mensaje + '</td><td>' + snapshot.val().apellido + ' ' + snapshot.val().nombre + '</td><td>' + mac + '</td><td>' + alias + '</td></tr>');
    });
}
;

function getSubActividades(fecha, hora, mensaje, mac, i) {
    let ref = db.ref("dispositivos");
    let alias;
    let id_usuario;
    ref.orderByChild("mac").equalTo(mac).on("child_added", function (snapshot) {
        console.log(snapshot.val().alias);
        console.log(snapshot.val().id_usuario);
        console.log('*--*');
        alias = snapshot.val().alias;
        id_usuario = snapshot.val().id_usuario;
        getSubSubActivity(fecha, hora, mensaje, mac, alias, id_usuario, i);
    });
}
;

function getActividades() {
    $('#contentTableA tbody tr').remove();
    let arrayKeysData = [];
    let objStructura;
    let mac = $('#txtMac').val();
    db.ref('datos/recordatorios/' + mac).once('value').then((snapshot) => {
        console.log(snapshot.val());
        objStructura = (snapshot.val());
        arrayKeysData = Object.keys(objStructura);
        console.log(arrayKeysData);
        for (let i = 0; i < arrayKeysData.length; i++) {
            name(arrayKeysData[i], mac, i);
        }
    });
}
;

function name(param, mac, i) {
    let fecha;
    let hora;
    let mensaje;
    db.ref('datos/recordatorios/' + mac + '/' + param).once('value').then((snapshot) => {
        console.log(snapshot.val().fecha);
        console.log(snapshot.val().hora);
        console.log(snapshot.val().estado);
        console.log(snapshot.val().mensaje);
        fecha = snapshot.val().fecha;
        hora = snapshot.val().hora;
        mensaje = snapshot.val().mensaje;
        getSubActividades(fecha, hora, mensaje, mac, i);
    });
}
;

function eliminarFilaA() {
    $('#contentTableA tbody tr').remove();
}
;

function getPDFA() {
    const invoice = this.document.getElementById("invoice");
    console.log(invoice);
    console.log(window);
    html2pdf().from(invoice).save();
}
;