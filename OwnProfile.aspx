<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OwnProfile.aspx.cs" Inherits="OwnProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
          <meta http-equiv="refresh" content="30" />
    <link href="BlogStrap/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">

        .update-status {
            	background: #f8f8f8;
                float:right;
                margin-right:270px;
                margin-top:-50px;
	padding: 10px;
	margin-bottom: 40px;
    width:690px;
    height:250px;
    box-sizing:padding-box;
}

.update-status .status-input {
    margin-left:60px;
    margin-top:10px;
	width: 500px;
	height: 120px;
	border-radius: 10px;
}

      body {
        padding-top: 190px;
        padding-bottom: 40px;
        padding-left:30px;
      }

      .post {
        padding: 15px 0px;
        border-bottom: 1px dotted #ccc;
      }

      img {
        -webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
        -moz-box-sizing: border-box;    /* Firefox, other Gecko */
        box-sizing: border-box;         /* Opera/IE 8+ */
      }

      .widget h3 { display: block; background: #212121; color: #f1f1f1; text-transform: capitalize; border-radius: 5px; margin-bottom: 10px; text-align: center; padding: 5px 0px;}

      .feat-img img { padding: 5px; border: 1px solid #ccc;}

      .post:first-of-type { padding-top: 0px;}
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
      <form id="Form1" runat="server">
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container" style="padding-top:80px;">
       
          <h2 style="float:left;padding-top:20px;padding-left:50px;padding-bottom:20px;margin-top:-80px;margin-left:-130px;">Teacher Students<br />&nbsp;&nbsp;&nbsp;&nbsp;Communtiy</h1>
          <div class="nav-collapse">
            <ul class="nav" style="font-size:20px;margin-top:-25px;">
              <li><a href="HomePage.aspx">Home</a></li>
              <li class="active"><a href="AllMember.aspx">Members</a></li>
              <li><a href="noticeBoard.aspx">Notice Board</a></li>
              <li><a href="contactInfo.aspx">Contacts</a></li>
            </ul>
            <%--<ul class="nav pull-right" style="margin-top:-25px;">
              <li><asp:Button ID="ButtonUser" runat="server" Text="User" BackColor="Black"  BorderColor="Black" Font-Names="Comic Sans MS" Font-Size="20px" ForeColor="White" /></li>
            </ul>--%>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
          						<div class="update-status">
                            <h2 style="margin-left:50px;">Update Status</h2>
                            <asp:TextBox ID="TextBoxStatus" CssClass="status-input" TextMode="MultiLine" runat="server" Font-Size="Large" placeholder="Update a Status...."></asp:TextBox>
                            <asp:Button ID="ButtonStatus" runat="server" Text="Button" CssClass="btn btn-primary btn-large" Style="margin-top:120px;margin-left:15px;" OnClick="ButtonStatus_Click"/>
						</div>
 <div class="col-sm-6 col-md-3" style="margin-top:-50px;">
      <div class="thumbnail">
          <asp:Image ID="ImageProPic" ImageUrl="pictures/no_pic.png" runat="server" style="padding:5px;"/>
      <h2 style="text-align:center;margin-left:-10px;"><asp:Label ID="LabelUsername" Text="Username" ForeColor="SkyBlue" runat="server"></asp:Label></h2>
         
      </div>

      <div class="caption">
     
          <div class="btn-group-vertical" role="group" aria-label="...">
          <asp:Button ID="ButtonAbout" CssClass="btn btn-primary" Style="margin-left:-5px;width:320px;border-radius:20px;" runat="server" Text="About"/>
          <asp:Button ID="ButtonMessege" CssClass="btn btn-primary" Style="margin-left:-5px; border-radius:20px;margin-top:5px;width:320px;" runat="server" Text="Messege"/>
          </div>
          </div>
                 </div>
          <div class="row">
        <div class="span8">

        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
            
            <div class="post">
            <div class="row">
                
          <div class="feat-img span2">
              <asp:Image ID="Image1" ImageUrl='<%# MyImageUrlFunction(Eval("pro_pic").ToString()) %>' runat="server" />
          </div><!-- end featured image -->

          <div class="details span6">
            <h2><asp:Label ID="Label1" Text='<%#Eval("UserName") %>' ForeColor="SkyBlue" runat="server"></asp:Label></h2>
            <p style="font-size:20px;padding-top:10px;">
              <asp:Label ID="Label2" Text='<%#Eval("Status") %>' runat="server"></asp:Label> 
            </p>
          </div> <!-- end details -->
          <div style="margin-top:80px;margin-left:400px;"><asp:ImageButton ID="ImageButton1" ImageUrl="images/like_button.jpg" Style="height:37px;width:60px;resize:both;" runat="server" />&nbsp;&nbsp;<asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="Comment" Style="margin-left:10px;"/></div>
          
                    </div><!-- end post row -->

        </div><!-- end post -->
                </ItemTemplate>
        </asp:Repeater>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TSC_database_connection_string %>" SelectCommand="SELECT [UserName], [pro_pic], [Status] FROM [StatusUpdate] WHERE ([UserName] = @UserName) ORDER BY StatusID DESC">
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="user" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>



    </form>
    <script src="js/bootstrap.jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</body>
</html>
