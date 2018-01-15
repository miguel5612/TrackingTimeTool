function Ocultar() {
    try {
        var trElems = document.querySelectorAll("table[id*=GridView1]")[0].children[0].children.length;
        var index = 1, index1 = 0;
        for (index1 = 0; index1 < trElems; index1++) {
            for (index = 1; index < 3; index++) {
                document.querySelectorAll("table[id*=GridView1]")[0].children[0].children[index1].children[index].style.display = "none";
            }
        }
    }
    catch(err){

    }
}
$(document).ready(function () {
    Ocultar();
});