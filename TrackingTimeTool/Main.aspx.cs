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
            var id = Session["ID"];
            var strSQL = "SELECT COUNT(*) FROM [Proyecto] WHERE IDUserCreator=" + id;
            var count = funktions.fetchScalar(strSQL);
            if((int) count > 9999999 || Convert.ToInt64(id) <= 0)
            {
                Response.Redirect("Default.aspx");
            }else if ((int)count > 0)
            {
                containerImage.Visible = true;
                labelPlay.Text = "Todo en orden :)";
                HFIDUser.Text = id.ToString();
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