using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Proyect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var id = Session["ID"];
            Literal1.Text = String.Concat("<input id='inputID' type='hidden' name='ID' value='",id , "'>");
            Literal2.Text = String.Concat("<input id='inputUser' type='hidden' name='email' value='", Session["User"], "'>");
            if (!(Convert.ToInt16(id) > 0))
            {
                Response.Redirect("Default.aspx");
            }
        }
    }

    protected void SubmitTittle_Click(object sender, EventArgs e)
    {
        if (pryTittle.Text.Length > 0 ) {
            var strSQL = "SELECT COUNT(*) FROM [Proyecto] WHERE ProyectName ='" + pryTittle.Text.ToString() + "'";
            int count = Convert.ToInt16( funktions.fetchScalar(strSQL));
            if (count > 0)
            {
                labelBtn.Text = "Titulo ya usado anteriormente por favor ingrese otro.";
                labelBtn.Attributes.Add("Style", "background-color:red");
            }
            else { 
            strSQL = "INSERT INTO[Proyecto]([IDUserCreator],[CreationDate],[ProyectName],[HourCost],[IsAktiv]) VALUES (" + Session["ID"] + ",'" + DateTime.Now + "','" + pryTittle.Text.ToString() + "',0,1)" ;
            funktions.fetchScalar(strSQL);
                Response.Redirect("Main.aspx");

            }
        }



    }
}