using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Work : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // AQUI SE INSERTA o SE ACTUALIZA LA TABLA WORKS DONDE QUEDA REGISTRADO CADA MOMENTO
        var strSQL = ""; // inicializacion de la variable
        var status = Request.QueryString["status"];
        var url = "/main.aspx?status=count";
        var datos = "";
        label1.Text = status;
        if (status == "insert")

        {
            var IDUser = Request.QueryString["IDUser"];
            var IDProyecto = Request.QueryString["IDProyecto"];
            var WorkTitle = Request.QueryString["WorkTitle"];
            var WorkDate = Request.QueryString["WorkDate"];
            var CreationDate = Request.QueryString["CreationDate"];
            var Bemerkungen = Request.QueryString["Bemerkungen"];
            var endDate = Request.QueryString["endDate"];

            // SCRIPT DE INSERCION
            strSQL = "INSERT INTO [Works] ([IDUser],[IDProyecto],[WorkTitle],[WorkDate],[CreationDate],[Bemerkungen],[endDate]) VALUES (" + IDUser + "," + IDProyecto + ",'" + WorkTitle + "','" + WorkDate + "','" + CreationDate + "','" + Bemerkungen + "','" + endDate+"')";

            strSQL = "SELECT LAST_INSERT_ID()";

            //datos = "&IDWork=" + idWork+"&IDUser="+ IDUser+ "&IDProyecto="+ IDProyecto+ "&WorkTitle="+ WorkTitle+ "&WorkDate="+ WorkDate+ "&CreationDate="+ CreationDate+ "&Bemerkungen="+ Bemerkungen+ "&endDate"+ endDate;
            Response.Redirect(url + datos);
        }

        // SCRIPT DE ACTUALIZACION
        strSQL = "UPDATE [works] SET [WorkTitle],[WorkDate],[CreationDate],[Bemerkungen],[endDate] WHERE [IDUser]= AND [IDProyecto] AND [CreationDate]=";




    }

}