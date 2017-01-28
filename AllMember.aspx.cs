using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class AllMember : System.Web.UI.Page
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
           // ButtonUser.Text = Session["user"].ToString();
        }

        //string st = "SELECT [UserName], [ProfilePic], [Occupation] FROM [UserData] where Occupation='Teacher'";
        //ViewState["SQL"] = st;
        //SqlDataSource1.SelectCommand = st;
        //SqlDataSource1.DataBind();

    }
    public string MyImageUrlFunction(string field)
    {
        field.Trim();
        string x = "~/pictures/";
        return x + field;
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label uName = (Label)e.Item.FindControl("Label1");
        Image im = (Image)e.Item.FindControl("Image1");
        Button b = (Button)e.Item.FindControl("ButtonVisitProfile");
        //HyperLink fnamelink = (HyperLink)e.Item.FindControl("fnamelink");
        if (uName != null)
        {
            //if (uName != x)
            im.Attributes.Add("onclick", "javascript:window.open('profile.aspx?userName=" + uName.Text + "','target=_blank');");
            uName.Attributes.Add("onclick", "javascript:window.open('profile.aspx?userName=" + uName.Text + "','target=_blank');");
            b.Attributes.Add("onclick", "javascript:window.open('profile.aspx?userName=" + uName.Text + "','target=_blank');");
            ////else
            ////{
            ////    Response.Redirect("MyProfile")
            ////}
        }

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

    protected void ButtonSubmitSearch_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TSC_database_connection_string"].ConnectionString);
        conn.Open();


        string checkuser = "select count(*) from [UserData] where UserName='" + txtCountry.Text + "'";

        SqlCommand cmd = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());

        if (temp == 0)
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Username.  No member of such name exist!!');", true);
        else
        Response.Redirect("profile.aspx?userName=" + txtCountry.Text, true);
    }
}