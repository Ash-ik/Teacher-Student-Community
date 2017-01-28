using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
public partial class assignment : System.Web.UI.Page
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
            //ButtonUser.Text = Session["user"].ToString();
        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TSC_database_connection_string"].ToString());
        con.Open();
        string isTeacher = "select [Occupation] from [UserData] where UserName='" + Session["user"].ToString() + "'";

        SqlCommand cmd = new SqlCommand(isTeacher, con);
        string temp = cmd.ExecuteScalar().ToString().Trim();
        if (temp == "Teacher")
            Response.Redirect("assignmentTeacher.aspx");
        con.Close();
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetCountries(string prefixText)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TSC_database_connection_string"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("select [UserName] from [UserData] where [Occupation]='Teacher' and UserName like '%'+@Name+'%'", con);
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


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/files/assignments/") + FileUpload1.FileName);

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TSC_database_connection_string"].ConnectionString);
            conn.Open();

            string insertQuery = "insert into [NoticeBoard] (UserName,UploadType,FileName,Roll,TeacherName) values (@un ,@type,@fileName,@roll,@teacher)";
            SqlCommand com = new SqlCommand(insertQuery, conn);
            com.Parameters.AddWithValue("@un", Session["user"].ToString());
            com.Parameters.AddWithValue("@type","assignment");
            com.Parameters.AddWithValue("@fileName", FileUpload1.FileName);

            string checkuser = "select Roll from [UserData] where UserName='" + Session["user"].ToString() + "'";

            SqlCommand cmd = new SqlCommand(checkuser, conn);
            string r= cmd.ExecuteScalar().ToString();

            com.Parameters.AddWithValue("@roll",r);
            com.Parameters.AddWithValue("@teacher",txtCountry.Text);


            com.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("assignment.aspx");
        }

    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label x = (Label)e.Item.FindControl("Label2");
        Button b = (Button)e.Item.FindControl("btn");
        Label uName = (Label)e.Item.FindControl("Label1");
        string p=x.Text;
        //x.Attributes.Add("onclick", "javascript:window.open(p,'target=_blank');");
        x.Attributes.Add("onclick", "javascript:window.open('download.aspx?file=" + p + "','target=_blank');");
        b.Attributes.Add("onclick", "javascript:window.open('download.aspx?file=" + p + "','target=_blank');");
        uName.Attributes.Add("onclick", "javascript:window.open('profile.aspx?userName=" + uName.Text + "','target=_blank');");
    }

}