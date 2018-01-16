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
        var status = Session["status"];
       
        if (!IsPostBack)
        {
            var id = Session["ID"];
            var strSQL = "Select COUNT(*) FROM((SELECT Proyecto.ProyectName AS ProyectName, Proyecto.IDProyecto AS IDProyecto FROM User_Proyect INNER JOIN Proyecto ON User_Proyect.IDProyect = Proyecto.IDProyecto  WHERE Proyecto.IDUserCreator = "+id+") union all (SELECT ProyectName, IDProyecto FROM Proyecto WHERE IDUserCreator = "+id+")) t";
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

    protected void TimesFormView_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        
    }

    protected void TimesFormView_Insert(object sender, SqlDataSourceCommandEventArgs e)
    {
        

    }

    protected void TimesFormView_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        var time = DateTime.Now.ToString();
        Session["status"] = "count";
        count.Text = "true";
        countTimeStart.Text = time;
        countTimeEnd.Text = "0";
        duration.Text = "0:00:00";
        ClientScript.RegisterStartupScript(GetType(), "hwa", "cargarFormularioInsercion()", true);
        IDCount.Value = e.Command.Parameters["@ID"].Value.ToString();
        timeStartStop.Text = "Started";
        Session["ActualTime"] = IDCount.Value;
        //Session["IDWork"] = e.Command.Parameters["@IDWork"];
        //Session["IDUser"] = e.Command.Parameters["@IDUser"];
    }

    protected void updateDataSource_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        timeStartStop.Text = "Label";
        GridView1.DataBind();
    }
}