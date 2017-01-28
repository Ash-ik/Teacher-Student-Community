<%@ Page Language="C#" AutoEventWireup="true" CodeFile="noticeBoard.aspx.cs" Inherits="noticeBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <link href="BlogStrap/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">

      body {
        padding-top: 170px;
        padding-bottom: 40px;
      }



          .note {
    width: 160px;
    height: 160px;
    box-shadow: 0 3px 6px rgba(0,0,0,.25);
    -webkit-box-shadow: 0 3px 6px rgba(0,0,0,.25);
    -moz-box-shadow: 0 3px 6px rgba(0,0,0,.25);
    float: left;
    margin: 8px;
    border: 1px solid rgba(0,0,0,.25);
}
 
.sticky1 {
    transform: rotate(-3.5deg);
    -webkit-transform: rotate(-3.5deg);
    -moz-transform: rotate(-3.5deg);
    background-color: #CBFAFA;
}
.sticky2 {
    transform: rotate(3.5deg);
    -webkit-transform: rotate(3.5deg);
    -moz-transform: rotate(3.5deg);
    background-color: #CBFAFA;
}
#frame { 
    background: url(cork-board.png) no-repeat;
    width: 800px;
    height: 600px;
    padding-top: 35px;
    padding-left: 35px;
}

.text {
    margin: 10px;
}
#frame a:hover.note {
    border: 1px solid rgba(0,0,0,.75);
    -webkit-transform: scale(1.1);
    -moz-transform: scale(1.1);
    transform: scale(1.1);
}


      .widget h3 { display: block; background: #212121; color: #f1f1f1; text-transform: capitalize; border-radius: 5px; margin-bottom: 10px; text-align: center; padding: 5px 0px;}
      .widget ul { margin-left: 0px;}
      .widget ul li { list-style: none; font-size: 14px;}
      .widget ul li a { display: block; padding: 5px 0px; color: #888; border-top: 1px dotted #ccc;}
      .widget ul li a:hover { background: #fff; text-decoration: none; padding-left: 5px;}
    </style>
    <link href="BlogStrap/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
          <link href="StyleSheet.css" rel="stylesheet">

  </head>

  <body>
      <form id="Form2" runat="server">
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container" style="padding-top:80px;">
       
          <h2 style="float:left;padding-top:20px;padding-left:50px;padding-bottom:20px;margin-top:-80px;margin-left:-130px;">Teacher Students<br />&nbsp;&nbsp;&nbsp;&nbsp;Communtiy</h1>
          <div class="nav-collapse">
            <ul class="nav" style="font-size:20px;margin-top:-25px;">
              <li><a href="HomePage.aspx">Home</a></li>
              <li><a href="AllMember.aspx">Members</a></li>
              <li class="active"><a href="noticeBoard.aspx">Notice Board</a></li>
              <li><a href="contactInfo.aspx">Contacts</a></li>
            </ul>
<%--            <ul class="nav pull-right" style="margin-top:-25px;">
              <li><asp:Button ID="ButtonUser" runat="server" Text="User" BackColor="Black"  BorderColor="Black" Font-Names="Comic Sans MS" Font-Size="20px" ForeColor="White" /></li>
            </ul>--%>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    <div>

        <h1 style="margin-left:530px;margin-top:0px;">Notice Board</h1>
        <div id='frame' style="margin-left:250px;">
            <div style="padding:20px;"></div>
            <a class="note sticky1" href="assignment.aspx" style="margin-left:70px;margin-right:50px;background-color:aliceblue;text-align:center;text-decoration:none;">
                <div class='pin'></div>
                <div class='text'><h3>Assignments</h3></div>
            </a>
            
            <a class="note sticky2" style="margin-right:50px;background-color:aqua;text-align:center;text-decoration:none;">
                <div class='pin'></div>
                <div class='text'><h3>Class Test<br />Results</h3></div>
            </a>
            <a class="note sticky1" style="background-color:wheat;text-align:center;text-decoration:none;">
                <div class='pin'></div>
                <div class='text'><h3>Class Slides</h3></div>
            </a>
            <a class="note sticky2" style="margin-top:30px;margin-left:70px;margin-right:50px;background-color:darkgrey;text-align:center;text-decoration:none;">
                <div class='pin'></div>
                <div class='text'><h3>Books</h3></div>
            </a>
            <a class="note sticky1" style="margin-top:30px;margin-right:50px;background-color:springgreen;text-align:center;text-decoration:none;">
                <div class='pin'></div>
                <div class='text'><h3>Class Routine</h3></div>
            </a>
            <a class="note sticky2" style="background-color:orchid;margin-top:30px;text-align:center;text-decoration:none;">
                <div class='pin'></div>
                <div class='text'><h3>Latest News</h3></div>
            </a>
        </div>
    </body>
</html>
    
    </div>
    </form>
</body>
</html>
