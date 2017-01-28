<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AllMember.aspx.cs" Inherits="AllMember" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <link href="BlogStrap/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">

      body {
        padding-top: 170px;
        padding-bottom: 40px;
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
              <li class="active"><a href="AllMember.aspx">Members</a></li>
              <li><a href="noticeBoard.aspx">Notice Board</a></li>
              <li><a href="contactInfo.aspx">Contacts</a></li>
            </ul>
<%--              <ul class="nav navbar-nav">
              <li class="dropdown">
<asp:Button ID="ButtonUser" runat="server" CssClass="dropdown-toggle" data-toggle="dropdown" Text="User" BackColor="Black"  BorderColor="Black" Font-Names="Comic Sans MS" Font-Size="20px" ForeColor="White" />
<%--          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span>

          </a>
          <ul class="dropdown-menu" role="menu" style="position:inherit">
            <li><a href="OwnProfile.aspx">Profile</a></li>
            <li><a href="logout.aspx">Logout</a></li>
          </ul>
        </li>
                  </ul>
            <ul class="nav pull-right" style="margin-top:-25px;">
              <li><asp:Button ID="ButtonUser" runat="server" Text="User" BackColor="Black"  BorderColor="Black" Font-Names="Comic Sans MS" Font-Size="20px" ForeColor="White" /></li>
            </ul>--%>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
          <div id="allMember" style="margin-top:20px;">

<h3 style="margin-left:250px;">Show:</h3>
              <div style="margin-left:170px;margin-top:-32px;">
                  <select id="memberType" style="border-radius:20px;width:120px;" name="member" onchange="changed(this.value);">
        <option value="All Member">All Members</option>
        <option value="Teacher">Teachers</option>
        <option value="Student">Students</option>
    </select>
                  </div>
<%--                                <div class="dropdown" style="padding-top:10px;">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    Dropdown
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
  </ul>
</div>--%>

              <div id="member menu" style="margin-bottom:30px;margin-top:-80px;">


        <ajax:ToolkitScriptManager ID="ScriptManager1" runat="server"/>
<asp:TextBox ID="txtCountry" runat="server" CssClass="input-large" Style="border-radius:10px;height:30px;font-family:'Comic Sans MS';margin-top:50px;margin-left:500px;"></asp:TextBox>
<ajax:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtCountry"
MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="10" CompletionInterval="0" ServiceMethod="GetCountries" >
</ajax:AutoCompleteExtender>
    <asp:Button ID="ButtonSubmitSearch" CssClass="btn btn-primary btn-large" runat="server" Text="Search" Style="margin-top:40px;margin-left:20px;" OnClick="ButtonSubmitSearch_Click"/>
              </div>

        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
            <ItemTemplate>


                 <div class="col-sm-6 col-md-3" style="float:left;">
      <div class="thumbnail">
          <asp:Image ID="Image1" ImageUrl='<%# MyImageUrlFunction(Eval("ProfilePic").ToString()) %>' runat="server" />
      </div>
      <div class="caption">
<h3><asp:Label ID="Label1" Text='<%#Eval("UserName") %>' ForeColor="SkyBlue" runat="server"></asp:Label></h3>
         <h3 style="margin-top:-5px;margin-left:10px;">(<asp:Label ID="Label2" Text='<%#Eval("Occupation") %>' ForeColor="Black" runat="server"></asp:Label>)</h3>
         <p style="margin-top:20px;margin-left:50px;">
     <asp:Button ID="ButtonVisitProfile" CssClass="btn btn-primary" runat="server" Text="Profile" Style="margin-left:20px;"/>
             </div>
     <asp:Button ID="ButtonMessege" CssClass="btn btn-primary" runat="server" Text="Messege" Style="margin-top:-74px;margin-left:150px;"/>

                 </div>
         </p>
      </div>
   </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TSC_database_connection_string %>" SelectCommand="SELECT [UserName], [ProfilePic], [Occupation] FROM [UserData]"></asp:SqlDataSource>

              </div>
    </form>
      <script type="text/javascript">
          function Search()
          {
             window.open('profile.aspx?userName=" + txtCountry.Text + "','target=_blank');
          }

          function changed(x)
          {
              if (x == "Teacher")
                  <%        
                        string st = "SELECT [UserName], [ProfilePic], [Occupation] FROM [UserData] where Occupation='Teacher'";
                        ViewState["SQL"] = st;
                        SqlDataSource1.SelectCommand = st;
                        SqlDataSource1.DataBind();
                        %>
                  
          }
      </script>

              <script src="js/bootstrap.jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
