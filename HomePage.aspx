<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
      <head>
    <link href="BlogStrap/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">

        .update-status {
            	background: #f8f8f8;
	padding: 10px;
	margin-bottom: 40px;
    width:690px;
    height:220px;
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
        padding-top: 170px;
        padding-bottom: 40px;
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
              <link href="StyleSheet.css" rel="stylesheet">
  </head>

  <body>
      <form runat="server">
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container" style="padding-top:80px;">
       
          <h2 style="float:left;padding-top:20px;padding-left:50px;padding-bottom:20px;margin-top:-80px;margin-left:-130px;">Teacher Students<br />&nbsp;&nbsp;&nbsp;&nbsp;Communtiy</h2>
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
          </div>
        </div>
      </div>
    </div>


    <div class="container">

						<div class="update-status">
                            <h2 style="margin-left:50px;">Update Status</h2>
                            <asp:TextBox ID="TextBoxStatus" CssClass="status-input" TextMode="MultiLine" runat="server" Font-Size="Large" placeholder="Update a Status...."></asp:TextBox>
                            <asp:Button ID="ButtonStatus" runat="server" Text="Button" CssClass="btn btn-primary btn-large" Style="margin-top:120px;margin-left:15px;" OnClick="ButtonStatus_Click"/>
						</div>
      <div class="row">
        <div class="span8">

        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" DataSourceID="SqlDataSource1">
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
          <div style="margin-top:80px;margin-left:650px;"><asp:ImageButton ID="ImageButton1" ImageUrl="images/like_button.jpg" Style="height:30px;width:50px;resize:both;" runat="server" />&nbsp;&nbsp;<button style="" type="button" class="btn btn-primary btn-lg" data-toggle="collapse" data-target="#collapseDiv">Comments</button></div>
                        <div id="collapseDiv" class="collapse"><asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" CssClass="input-large" Style="width:350px;border-radius:10px;height:60px;margin-left:30px;margin-top:10px;" placeholder="Write a comment...." ></asp:TextBox></div>
                    </div><!-- end post row -->

        </div><!-- end post -->
                </ItemTemplate>
        </asp:Repeater>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectDatabase %>" SelectCommand="SELECT * FROM [StatusUpdate] ORDER BY [StatusID] DESC"></asp:SqlDataSource>

        </div><!-- end main area -->

        <aside class="span4" style="margin-top:-280px;">
          
          <div class="row">
            


            <div class="widget span4" style="margin-top:-40px;">
              <h3><asp:Label ID="LabelUsername" ForeColor="SkyBlue" runat="server"></asp:Label></h3>
                            <p>
              <asp:Image ID="ImageUserPic" ImageUrl="pictures/no_pic.png" Width="400px" Height="250px" Style="resize:both;" runat="server" />
              </p>

              <ul>
                <li><a href="OwnProfile.aspx">Visit Profile</a></li>
                <li><a href="Logout.aspx">Log Out</a></li>
              </ul>
            </div><!-- end widget -->

            <div class="widget span4">
              <h3>Search User</h3>

<%--              <p>
               <img src="pictures/no_pic.png" title="widget image" alt="an image was here" />
              </p>--%>
                <div style="background: #f8f8f8;width:370px;height:150px;">
          <ajax:ToolkitScriptManager ID="ScriptManager1" runat="server"/>
<div>
<asp:TextBox ID="txtCountry" runat="server" CssClass="input-large" Style="border-radius:10px;height:30px;font-family:'Comic Sans MS';margin-top:50px;margin-left:40px;"></asp:TextBox>
<ajax:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtCountry"
MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="10" CompletionInterval="0" ServiceMethod="GetCountries" >
</ajax:AutoCompleteExtender>
    <asp:Button ID="ButtonSubmitSearch" CssClass="btn btn-primary btn-large" runat="server" Text="Search" Style="margin-top:40px;" OnClick="ButtonSubmitSearch_Click1"/>
    </div>
            </div><!-- end widget -->


          </div><!-- end widget row -->

        </aside><!-- end sidebar -->

      </div><!-- end row -->
 <hr>
      <footer>
        <p>&copy; Ashik CSE '12</p>
      </footer>

    </div><!-- end container -->

          </form>
        <script src="js/bootstrap.jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

  </body>

</html>
