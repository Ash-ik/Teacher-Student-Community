using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
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
}