using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var strSQL = "SELECT COUNT(*) FROM [Works] WHERE IDUser="+ Session["ID"];
            var count = funktions.fetchScalar(strSQL);
            if ((int)count > 0)
            {
                containerImage.Visible = true;
                labelPlay.Text = "Por favor haga clic para empezar a contar el tiempo";
            }
            else
            {
                labelPlay.Text = "Por favor cree un nuevo proyecto para activar la funcion play haciendo clic en el menu izquierdo <strong style='background-color:red'> Añadir/Modificar Cliente </strong>";
                containerImage.Visible = false;
                //Client.Attributes.Add("Style", "background-color:red");

            }
        }
        var email = (String) Session["User"];
        if (string.IsNullOrEmpty(email))
        {
            Response.Redirect("/Default.aspx");
        }
        else
        {
            Email.Text = email;
        }
    }
}