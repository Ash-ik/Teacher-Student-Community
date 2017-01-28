using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["user"] = null;
        HttpCookie cookie = Request.Cookies["user"];
        if (cookie != null)
        {
            cookie.Expires = DateTime.Now.AddMinutes(-5);
            Response.Cookies.Add(cookie);
        }
            Response.Redirect("Default.aspx");
    }
}