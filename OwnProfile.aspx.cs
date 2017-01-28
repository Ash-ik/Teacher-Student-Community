using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
public partial class OwnProfile : System.Web.UI.Page
{
    string link = null;
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
        
       // ButtonUser.Text = LabelUsername.Text;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TSC_database_connection_string"].ConnectionString);
        conn.Open();

        string checkuser = "select ProfilePic from [UserData] where UserName='" + LabelUsername.Text + "'";

        SqlCommand com = new SqlCommand(checkuser, conn);
        link = com.ExecuteScalar().ToString();
        ImageProPic.ImageUrl = "~/pictures/" + link;
    }
    public string MyImageUrlFunction(string field)
    {
        field.Trim();
        string x = "~/pictures/";
        return x + field;
    }

    protected void ButtonStatus_Click(object sender, EventArgs e)
    {
        if (TextBoxStatus.Text.ToString().Trim() == null || TextBoxStatus.Text.ToString().Trim() == "")
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please Update a status');", true);
        else
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TSC_database_connection_string"].ConnectionString);
            conn.Open();

            string insertQuery = "insert into [StatusUpdate] (UserName,Status,pro_pic) values (@un ,@stts,@pic)";
            SqlCommand com = new SqlCommand(insertQuery, conn);
            com.Parameters.AddWithValue("@un", LabelUsername.Text);
            com.Parameters.AddWithValue("@stts", TextBoxStatus.Text);
            com.Parameters.AddWithValue("@pic", link);
            com.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("OwnProfile.aspx");
        }
    }

}