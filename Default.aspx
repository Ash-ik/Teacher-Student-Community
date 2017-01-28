<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

      <head>
                    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="BlogStrap/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">

      body {
        padding-top: 170px;
        padding-bottom: 40px;
      }


      .widget ul li a { display: block; padding: 5px 0px; color: #888; border-top: 1px dotted #ccc;}
      .widget ul li a:hover { background: #fff; text-decoration: none; padding-left: 5px;}
    
      
              .auto-style1 {
            width: 99.99%;
            height: 22px;
        }
        .auto-style2 {
            width: 95px;
        }
      
      </style>

    <link href="BlogStrap/css/bootstrap-responsive.css" rel="stylesheet">
                  <link href="StyleSheet.css" rel="stylesheet">
  </head>

  <body>
      <form id="Form1" runat="server">
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container" style="padding-top:80px;">
       
          <h2 style="float:left;padding-top:20px;padding-left:28px;padding-bottom:20px;margin-top:-80px;margin-left:-130px;">Teacher Students<br />&nbsp;&nbsp;&nbsp;&nbsp;Communtiy</h2>
          <div class="nav-collapse">
            <ul class="nav" style="font-size:20px;margin-top:-25px;">
              <li class="active"><a href="HomePage.aspx">Home</a></li>
              <li><a href="AllMember.aspx">Members</a></li>
              <li><a href="noticeBoard.aspx">Notice Board</a></li>
              <li><a href="contactInfo.aspx">Contacts</a></li>
            </ul>
<%--            <ul class="nav pull-right" style="margin-top:-25px;">
              <li><asp:Button ID="ButtonUser" runat="server" Text="User" BackColor="Black"  BorderColor="Black" Font-Names="Comic Sans MS" Font-Size="20px" ForeColor="White" /></li>
            </ul>--%>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
        
    <div id="details">
        
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Image ID="Image1" runat="server" ImageUrl="background.png" />
                </td>
                <td>
                    <div class="panel panel-info" style="border-radius:20px;">
                            <div class="panel-heading">
                                  <h3 class="panel-title" style="text-align:center;"><asp:Label ID="Label1" runat="server" Text="Social Site" Font-Size="X-Large"></asp:Label></h3>
                            </div>
                             <div class="panel-body" style="text-align:center;">
                                    <asp:Label ID="Label2" runat="server" Text="Here,Teacher and stundents can share their thinking with each other...Share their ideas,Send messege to other and do many more...."></asp:Label>
                                            </div>
                                        </div>
                </td>
                <td>&nbsp;&nbsp;&nbsp; &nbsp;</td>
                <td>
                    <div class="panel panel-info" style="border-radius:20px;">
                            <div class="panel-heading">
                                  <h3 class="panel-title" style="text-align:center;"><asp:Label ID="Label3" runat="server" Text="File Sharing" Font-Size="X-Large"></asp:Label></h3>
                            </div>
                             <div class="panel-body" style="text-align:center;">
                                    <asp:Label ID="Label4" runat="server" Text="File Sharing has been made easy....here stundent can easily send their assignments to an specific teacher.Teacher will get that file instantly"></asp:Label>
                                            </div>
                                        </div>
                </td>
                <td>&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                <td>
                    <div class="panel panel-info" style="border-radius:20px;">
                            <div class="panel-heading">
                                  <h3 class="panel-title" style="text-align:center;"><asp:Label ID="Label5" runat="server" Text="Help in need" Font-Size="X-Large"></asp:Label></h3>
                            </div>
                             <div class="panel-body" style="text-align:center;">
                                    <asp:Label ID="Label6" runat="server" Text="Forgot the class routine,or need a help of teacher?No worry.you can easily connect with teacher and get help,or you can easily find the class routine without bothering C.R or student"></asp:Label>
                                            </div>
                                        </div>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:Image ID="Image2" runat="server" ImageUrl="background.png" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
            <button style="margin-left:550px;margin-top:30px;width:135px;height:50px;border-radius:20px;;font-size:17px;font-family:'Comic Sans MS';" type="button" class="btn btn-primary btn-lg" data-toggle="collapse" data-target="#demo">Get Started <b>&#8659;</b></button>
                  <div id="demo" class="collapse" style="width:99.99%;">
                      <div class="jumbotron">
                            <h2 style="margin-left:225px;">New User?<h2 style="margin-left:900px;margin-top:-30px;">Already Have an Account?</h2>
                       <a style="margin-left:240px;height:40px;width:90px;font-size:17px;text-align:center;border-radius:7px;" class="btn btn-primary large" href="register.aspx" role="button">register</a>
                       <a style="margin-left:690px;height:40px;width:70px;font-size:17px;text-align:center;border-radius:7px;" class="btn btn-primary large" href="login.aspx" role="button">login</a>
                         </div>
      </div>
    </div>

        </div>
    </form>
    <script src="js/bootstrap.jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
