
/* global firebase */
$(document).ready(getRole);
var db = firebase.database();
var c = 0;
var user = firebase.auth().currentUser;
var name;
function getRole()
{
    try
    {
        firebase.auth().onAuthStateChanged(function (user) {
            if (user) {
                var f = user.uid;
                let mac = f;
                var x1 = document.getElementById("Reports");
                var x2 = document.getElementById("AssignDevice");
                var x3 = document.getElementById("Device");
                var x4 = document.getElementById("UpdatePersonalData");
                var x5 = document.getElementById("UpdatePatientData");
                var x6 = document.getElementById("AddPatient");
                var x7 = document.getElementById("Signoff");
                var x8 = document.getElementById("Reminders");
                var x9 = document.getElementById("Reports1");
                var x10 = document.getElementById("Developers");
                var x11 = document.getElementById("changePassword");
                var x12 = document.getElementById("esd");
                db.ref('usuario/' + mac).once('value').then((snapshot) => {
                    name = snapshot.child("rol").val();
                });
            }
            if (name === "enfermero")
            {
                x1.style.display = "block";
                x2.style.display = "block";
                x3.style.display = "block";
                x4.style.display = "block";
                x5.style.display = "none";
                x6.style.display = "block";
                x7.style.display = "block";
                x8.style.display = "block";
                x9.style.display = "block";
                x10.style.display = "block";
                x11.style.display = "block";
                x12.style.display = "none";
            }
            if (name === "AdultoMayor")
            {
                x1.style.display = "none";
                x2.style.display = "none";
                x3.style.display = "none";
                x4.style.display = "none";
                x5.style.display = "block";
                x6.style.display = "none";
                x7.style.display = "block";
                x8.style.display = "none";
                x9.style.display = "block";
                x10.style.display = "block";
                x11.style.display = "block";
                x12.style.display = "block";
            }
        }).catch(function (error) {
            console.log("Got an error: ", error);
        }
        );

    } catch (error)
    {

    }
}




