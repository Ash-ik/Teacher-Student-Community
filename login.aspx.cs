using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["user"];
        if (cookie != null)
        {
            Session["user"] = cookie.Value;
            Response.Redirect("HomePage.aspx");//cookie active,goes to profile page
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TSC_database_connection_string"].ConnectionString);
        conn.Open();

        string checkuser = "select count(*) from [UserData] where UserName='" +TextBoxUsername.Text + "'";

        SqlCommand com = new SqlCommand(checkuser, conn);

        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

        if (temp == 1)
        {
            string checkPasswordQuery = "select Password from [UserData] where UserName='" + TextBoxUsername.Text + "'";

            SqlCommand passCmd = new SqlCommand(checkPasswordQuery, conn);
            string password = passCmd.ExecuteScalar().ToString().Replace(" ", "");
            if (password == TextBoxPassword.Text)
            {
                Session["user"]=TextBoxUsername.Text;

                    Response.Redirect("HomePage.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Incorrect Password !!');", true);
            }

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Incorrect Password !!');", true);


        }

        conn.Close();

    }
   protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        HttpCookie cookie = new HttpCookie("user");
        cookie.Value = TextBoxUsername.Text;
        cookie.Expires = DateTime.Now.AddMinutes(5);
        Response.Cookies.Add(cookie);
    }
}