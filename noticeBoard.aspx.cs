using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class noticeBoard : System.Web.UI.Page
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
    }
}