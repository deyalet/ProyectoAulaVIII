
/* global firebase, nombre */

$(document).ready(getRole);
var db = firebase.database();
function getRole()
{
    try
    {
        firebase.auth().onAuthStateChanged(function (user) {
            if (user) {
                var user = firebase.auth().currentUser;
                var f = user.uid;
                let mac = f;
                console.log(mac);
                db.ref('usuario/' + mac).once('value').then((snapshot) => {
                    var nombre1 = snapshot.child("nombre").val();
                    var apellido1 = snapshot.child("apellido").val();
                    var cedula1 = snapshot.child("cedula").val();
                    var celular1 = snapshot.child("celular").val();
                    var direccion1 = snapshot.child("direccion").val();
                    var fechaNacimiento = snapshot.child("fecha_nacimiento").val();
                    document.getElementById("nombre").value = nombre1;
                    document.getElementById("apellido").value = apellido1;
                    document.getElementById("cedula").value = cedula1;
                    document.getElementById("celular").value = celular1;
                    document.getElementById("direccion").value = direccion1;
                    document.getElementById("fecha_nacimiento").value = fechaNacimiento;
                });
            }
        }).catch(function (error) {
            console.log("Got an error: ", error);
        }
        );
    } catch (error)
    {

    }
}




