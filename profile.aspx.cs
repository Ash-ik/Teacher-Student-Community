using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
public partial class profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["user"];
        if (cookie != null)
        {
            Session["user"] = cookie.Value;
        }

        if (Session["user"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            LabelUsername.Text = Session["user"].ToString();
        }
        //ButtonUser.Text = LabelUsername.Text;


        if (LabelUsername.Text == Request.QueryString["userName"])
        {
            Response.Redirect("OwnProfile.aspx");
        }
        else
            LabelUsername.Text = Request.QueryString["userName"];


        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TSC_database_connection_string"].ConnectionString);
        conn.Open();

        string checkuser = "select ProfilePic from [UserData] where UserName='" + LabelUsername.Text + "'";

        SqlCommand com = new SqlCommand(checkuser, conn);
        string link = com.ExecuteScalar().ToString();
        ImageProPic.ImageUrl = "~/pictures/"+link;
    }
    public string MyImageUrlFunction(string field)
    {
        field.Trim();
        string x = "~/pictures/";
        return x + field;
    }

    protected void ButtonSubmitSearch_Click(object sender, EventArgs e)
    {

    }
}