var time; var on = false; var seconds = 0; var minutes = 0; var hours = 0; var url = "/Work.aspx"; var datos = "";
 
var startTime = function(){
        seconds++;
        counter = setTimeout("startTime()",1000);
        if(seconds > 59)  {seconds = 0; minutes++;}
        if (minutes > 59) { minutes = 0; hours ++;}
        var time = hours + ":" + minutes + ":" + seconds;
        document.getElementById("spanTime").value = time;
       
}
 
var stopStart = function(){
        document.getElementsByClassName("time")[0].innerHTML = !on ? "Stop" : "Start";
        if(!on){
            on = true; startTime();
            // envio la peticion get para generar el ingreso a la base de datos.
            time = new Date().toLocaleString();
            var titulo = document.getElementsByClassName("WorkTitle")[0].value;
            if (titulo.length <= 0) {
                titulo = null;
            }
            document.getElementById("HFCreationDate").value = time;
            document.getElementById("HFWorkDate").value = time;
            document.querySelectorAll("input[id*=IDUser]")[1].value = document.querySelector("input[id*=HFIDUser]").value;
            document.querySelector("input[id*=IDProyecto]").value = document.getElementById("Proyecto").value ;
            document.querySelector("input[id*=WorkTitle]").value = titulo;
            document.querySelectorAll("input[id*=WorkDate]")[1].value = time;
            document.querySelectorAll("input[id*=CreationDate]")[1].value = time;
            document.querySelector("input[id*=Bemerkungen]").value = "";
            document.querySelector("input[id*=endDate]").value = "";
            Alert("se realizara un envio del formulario");
            document.getElementById("InsertButton").click();
            /*
            datos = "?status=insert&WorkTitle=" + titulo + "&WorkDate=" + time + "&CreationDate=" +
                time + "&Bemerkungen=null" + "&endDate=null" + "&IDProyecto=" + document.getElementById("Proyecto").value +
                "&IDUser=" + document.getElementsByClassName("IDUser")[0].value;
            //alert(url + datos);
            window.location = url + datos;
            */
        }else{
            on = false; clearTimeout(counter);
            document.getElementById("spanTime").value = "00:00:00";
            seconds = 0; minutes = 0; hours = 0;
        }
}
