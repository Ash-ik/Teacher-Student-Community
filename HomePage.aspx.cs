using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class HomePage : System.Web.UI.Page
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
//            ButtonUser.Text = LabelUsername.Text;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TSC_database_connection_string"].ConnectionString);
            conn.Open();

            string checkuser = "select [ProfilePic] from [UserData] where [UserName]='" + LabelUsername.Text + "'";

            SqlCommand com = new SqlCommand(checkuser, conn);
            link = com.ExecuteScalar().ToString();
            ImageUserPic.ImageUrl = "~/pictures/" + link;
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetCountries(string prefixText)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TSC_database_connection_string"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("select [UserName] from [UserData] where [UserName] like '%'+@Name+'%'", con);
        cmd.Parameters.AddWithValue("@Name", prefixText);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<string> CountryNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CountryNames.Add(dt.Rows[i][0].ToString().Trim());
        }
        return CountryNames;
    }

    public string MyImageUrlFunction(string field)
    {
        field.Trim();
        string x = "~/pictures/";
        return x+field;

    }


    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
            Label uName = (Label)e.Item.FindControl("Label1");
            Image im = (Image)e.Item.FindControl("Image1");
            if (uName != null)
            {
                im.Attributes.Add("onclick","javascript:window.open('profile.aspx?userName=" + uName.Text + "','target=_blank');");
                    uName.Attributes.Add("onclick", "javascript:window.open('profile.aspx?userName=" + uName.Text + "','target=_blank');");
            }
        
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
            Response.Redirect("HomePage.aspx");
        }
    }
    protected void ButtonSubmitSearch_Click1(object sender, EventArgs e)
    {
        Response.Redirect("profile.aspx?userName=" + txtCountry.Text, true);

    }
}