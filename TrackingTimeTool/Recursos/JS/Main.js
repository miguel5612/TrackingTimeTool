var time; var on = false; var seconds = 0; var minutes = 0; var hours = 0; var url = "/Work.aspx"; var datos = ""; var counting = false;
$(document).ready(function () {
    if (document.getElementsByClassName("time")[0].innerHTML == "Started") { on = true; }
});
var startTime = function(){
        seconds++;
        counter = setTimeout("startTime()",1000);
        if(seconds > 59)  {seconds = 0; minutes++;}
        if (minutes > 59) { minutes = 0; hours ++;}
        var time = hours + ":" + minutes + ":" + seconds;
        document.getElementById("spanTime").value = time;
       
}
function cargarFormularioInsercion(){
    time = new Date().toLocaleString();
    var titulo = document.getElementsByClassName("WorkTitle")[0].value;
    if (titulo.length <= 0) {
        titulo = null;
    }
    document.getElementById("HFCreationDate").value = time;
    document.getElementById("HFWorkDate").value = time;
    document.querySelectorAll("input[id*=IDUser]")[1].value = document.querySelector("input[id*=HFIDUser]").value;
    document.querySelector("input[id*=IDProyecto]").value = document.getElementById("Proyecto").value;
    document.querySelector("input[id*=WorkTitle]").value = titulo;
    document.querySelectorAll("input[id*=WorkDate]")[1].value = time;
    document.querySelectorAll("input[id*=CreationDate]")[1].value = time;
    document.querySelector("input[id*=Bemerkungen]").value = "";
    document.querySelector("input[id*=endDate]").value = "";
    //inicia a contar el tiempo
    deleteCounter();
    
        on = true; startTime();
}
function deleteCounter() {
    try {
        clearTimeout(counter);// limpio cualquier rastro
    }
    catch (err) {
    }

}
function cargarFormularioActualizacion(){

    // preparo el formulario 2 para el envio final :)
    var titulo = document.getElementsByClassName("WorkTitle")[0].value;
    time = new Date().toLocaleString();
    document.querySelectorAll("input[id*=WorkTitleTextBox]")[1].value = titulo;
    document.querySelectorAll("input[id*=endDateTextBox]")[1].value = time;
    document.querySelectorAll("input[id*=durationTextBox]")[1].value = document.getElementById("spanTime").value;

}

var stopStart = function () {
    //alert("he llegado");
        document.getElementsByClassName("time")[0].innerHTML = !on ? "Stop" : "Start";
        if (!on) {
            //alert("insertando");
            counting = !counting;
            on = true; startTime();
            //´preparo el formulario para la insercion de la fecha de inicio
            cargarFormularioInsercion();
                //alert("se realizara un envio del formulario");            
                document.querySelectorAll("a[id*=InsertButton]")[0].click();
        } else {
            //alert("Actualizando");
            cargarFormularioActualizacion();
            counting = !counting;
            on = false; deleteCounter();
            document.getElementById("spanTime").value = "00:00:00";
            seconds = 0; minutes = 0; hours = 0;
            document.querySelectorAll("a[id*=UpdateButton]")[0].click();
            
        }
}
