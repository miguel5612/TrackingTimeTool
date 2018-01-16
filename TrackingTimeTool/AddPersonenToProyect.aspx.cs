using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddPersonenToProyect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonSend_Click(object sender, EventArgs e)
    {
        var strSQL = "SELECT COUNT(*) FROM User_Proyect WHERE IDProyect=" + DropDownProyect.SelectedValue + "AND IDUser=" + DropDownPerson.SelectedValue;
        Int32 count =  Convert.ToInt32(funktions.fetchScalar(strSQL));
        if ((count <= 0))
        {
            strSQL = "INSERT INTO User_Proyect (IDProyect,IDUser) VALUES ("+DropDownProyect.SelectedValue+","+ DropDownPerson.SelectedValue+")";
            funktions.fetchScalar(strSQL);
            GVPersonProyect.DataBind();
        }
        else
        {
            LabelError.Text = "El usuario ya se encuentra añadido a un proyecto";
        }
    }

    protected void DSProyectss_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void DSProyectss_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        //Response.Write("Test");
        //Response.End();
        
    }
}