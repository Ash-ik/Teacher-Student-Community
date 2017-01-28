using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   if (IsPostBack)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TSC_database_connection_string"].ConnectionString);
            conn.Open();

            string checkuser = "select count(*) from [UserData] where UserName='" + TextBoxUsername.Text + "'";

            SqlCommand com = new SqlCommand(checkuser, conn);

            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

            if (temp==1)
            {
                
                LabelUserExist.Text="User Already Exists !!";
            }
            else
            {
                LabelUserExist.Text="";
            }

            conn.Close();

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TSC_database_connection_string"].ConnectionString);
            conn.Open();


            string checkuser = "select count(*) from [UserData] where UserName='" + TextBoxUsername.Text + "'";

            SqlCommand cmd = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            if (temp == 0)
            {
                string[] arr1 = new string[] { TextBoxUsername.Text, TextBoxEmail.Text, TextBoxPassword.Text, TextBoxRoll.Text };
                //Session["user"]["name"] = TextBoxUsername.Text;
                //Session["user"]["mail"] = TextBoxEmail.Text;
                //Session["user"]["pswrd"] = TextBoxPassword;
                //if (TextBoxRoll.Text != "")
                //{
                //    Session["user"]["roll"] = TextBoxRoll.Text;
                //    Session["user"]["job"] = "Student";
                //}
                //else
                //{
                //    Session["user"]["roll"] = "9999999";
                //    Session["user"]["job"] = "Teacher";
                //}
                Session["pass"] = arr1;
                Response.Redirect("registerPart2.aspx");
            }

            conn.Close();

        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.ToString());
        }
    }
}