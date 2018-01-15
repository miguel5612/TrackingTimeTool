using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    

    protected void Button1_Click1(object sender, EventArgs e)
    {
        // register
        var email = txtLogin.Text;
        var passwort = txtPasswort.Text;
        if (passwort.Length > 0) {  
            var strSQL = "SELECT count(*) from[User] WHERE Mail ='" + email+"'";
            Int32 count = (Int32) funktions.fetchScalar(strSQL);
            if(count == 0)
            {
                strSQL = "INSERT INTO [User] (Name,Vorname,Mail,Passwort,Bemerkungen) VALUES ('','','"+email+"','"+passwort+"', "+"'')";
                funktions.fetchScalar(strSQL);
                strSQL = "SELECT ID FROM  [User]  WHERE Mail='" + email + "' AND Passwort='" + passwort + "'";
                var ID = funktions.fetchScalar(strSQL);
                Session.Add("ID", ID);
                Session.Add("User", email);
                Session.Add("IsAktivDefaultMode", 1);                
                Response.Redirect("/Main.aspx");
                Response.End();
            }
            else
            {
                label1.Text = "Usuario en uso, por favor ingrese otro correo";
            }
        }
        else
        {
            label1.Text = "Por favor ingrese una contraseña";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //Anmelden
        var email = txtLogin.Text;
        var passwort = txtPasswort.Text;
        var strSQL = "SELECT count(*) from[User] WHERE Mail ='" + email+ "' AND Passwort='"+ passwort+"'";
        Int32 count = (Int32)funktions.fetchScalar(strSQL);
        if (count == 0 || count>1)
        {
            label1.Text = "Usuario o contraseña incorrectos";
        }
        else
        {
            strSQL = "SELECT ID FROM  [User]  WHERE Mail='" + email + "' AND Passwort='" + passwort + "'";
            var ID = funktions.fetchScalar(strSQL);
            Session.Add("ID", ID);
            Session.Add("User", email);
            Session.Add("IsAktivDefaultMode", 1);
            Response.Redirect("/Main.aspx");
        }
    }
}