/* global firebase */
//INGRESAR A LA APLICACIÓN
var btnLogin = document.getElementById('btnLogin');
var inputEmail = document.getElementById('inputEmail');
var inputPassword = document.getElementById('inputPassword');
var auth = firebase.auth();
btnLogin.addEventListener('click', function () {
    firebase.auth().signInWithEmailAndPassword(inputEmail.value, inputPassword.value).then(function (result) {
//        alert("Usuario Conectado!");
////        var user = firebase.auth().currentUser;
////        var f = user.uid;
////        console.log(f);
//        window.location.replace('opciones.jsp');
    }).catch(function (error) {
        auth.sendPasswordResetEmail(inputEmail.value).then(function () {
            alert("A su correo fue enviado un enlace para cambiar contraseña y además se cerrara la sesión para validar nuevamente sus datos.... Gracias");
            window.location.replace('index.jsp');
        }).catch(function (error) {
            alert("El correo escrito, no esta registrado o no existe");
        });
    });
});

