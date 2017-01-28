using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Globalization;
public partial class registerPart2 : System.Web.UI.Page
{
    protected string UploadFolderPath = "~/pictures/";
    protected string path="";
    protected void Page_Load(object sender, EventArgs e)
    {
        //Label1.Text = Session["user"].ToString();
    }

    protected void FileUploadComplete(object sender, EventArgs e)
    {
        string filename = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
        path = Path.Combine(Server.MapPath(this.UploadFolderPath), filename);
        AsyncFileUpload1.SaveAs(path);

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string[] arr = (string[])Session["pass"];

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TSC_database_connection_string"].ConnectionString);
        conn.Open();

        string insertQuery = "insert into [UserData] (UserName,Email,Password,Roll,Occupation,ProfilePic,About,Birthdate,Phone) values (@un ,@mail ,@pswrd,@roll,@job,@pic,@about,@date,@contact)";
        SqlCommand com = new SqlCommand(insertQuery, conn);
        com.Parameters.AddWithValue("@un", arr[0]);
        com.Parameters.AddWithValue("@mail", arr[1]);
        com.Parameters.AddWithValue("@pswrd", arr[2]);
        if (arr[3] != "")
        {
            com.Parameters.AddWithValue("@roll", arr[3]);
            com.Parameters.AddWithValue("@job", "Student");
        }
        else
        {
            com.Parameters.AddWithValue("@roll", "9999999");
            com.Parameters.AddWithValue("@job", "Teacher");
        }

        com.Parameters.AddWithValue("@pic",AsyncFileUpload1.FileName);
        com.Parameters.AddWithValue("@about", TextBoxAbout.Text);
        com.Parameters.AddWithValue("@date", TextBoxDate.Text);
        com.Parameters.AddWithValue("@contact", TextBoxPhone.Text);
        
        com.ExecuteNonQuery();
        conn.Close();
        Session["user"]=arr[0];
        Response.Redirect("HomePage.aspx");
    }
}