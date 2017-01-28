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
public partial class download : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string f = Request.QueryString["file"];
        string path = Server.MapPath("files/assignments/"+f); //get physical file path from server
        string name = Path.GetFileName(path); //get file name
        string ext = Path.GetExtension(path); //get file extension
        string type = "";
        // set known types based on file extension  
        if (ext != null)
        {
            switch (ext.ToLower())
            {
                case ".htm":
                case ".html":
                    type = "text/HTML";
                    break;

                case ".txt":
                    type = "text/plain";
                    break;

                case ".GIF":
                    type = "image/GIF";
                    break;

                case ".pdf":
                    type = "Application/pdf";
                    break;

                case ".doc":
                case ".rtf":
                    type = "Application/msword";
                    break;

                Default:
                    type = "";
                    break;
            }
        }

        Response.AppendHeader("content-disposition", "attachment; filename=" + name);

        if (type != "")
            Response.ContentType = type;
        Response.WriteFile(path);
        Response.End();
    }
}