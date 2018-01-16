$(document).ready(function () {
    document.getElementById("Logout").onclick = function () {
        location.href = "Logout.aspx";
    };
    document.getElementById("Main").onclick = function () {
        location.href = "Main.aspx";
    };
    document.getElementsByClassName("Client")[0].onclick = function () {
        location.href = "Proyect.aspx";
    };
    document.getElementsByClassName("TimeDetail")[0].onclick = function () {
        location.href = "TimeDetail.aspx";
    };
    document.getElementsByClassName("AddPersonenToProyect")[0].onclick = function () {
        location.href = "AddPersonenToProyect.aspx";
    };
    document.getElementsByClassName("ReporteCompleto")[0].onclick = function () {
        location.href = "ReportAllWork.aspx";
    };
    
});