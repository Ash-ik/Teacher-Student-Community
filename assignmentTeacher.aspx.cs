using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class assignmentTeacher : System.Web.UI.Page
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
//            ButtonUser.Text = Session["user"].ToString();
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