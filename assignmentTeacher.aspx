<%@ Page Language="C#" AutoEventWireup="true" CodeFile="assignmentTeacher.aspx.cs" Inherits="assignmentTeacher" %>

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
              <li><a href="AllMember.aspx">Members</a></li>
              <li class="active"><a href="noticeBoard.aspx">Notice Board</a></li>
              <li><a href="contactInfo.aspx">Contacts</a></li>
            </ul>
<%--            <ul class="nav pull-right" style="margin-top:-25px;">
              <li><asp:Button ID="ButtonUser" runat="server" Text="User" BackColor="Black"  BorderColor="Black" Font-Names="Comic Sans MS" Font-Size="20px" ForeColor="White"/></li>
            </ul>--%>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    <div>
        <h1 style="margin-top:40px;margin-left:480px;color:turquoise">All Assignments</h1>
        <div style="margin-top:70px;"></div>
<h3 style="margin-left:370px;font-weight:bold;">Student</h3>
 <h3 style="margin-left:700px;margin-top:-30px;font-weight:bold;">File</h3>
                <asp:Repeater ID="Repeater1" runat="server"  DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
            <ItemTemplate>
            
            <h3 style="margin-left:300px;"><asp:Label ID="Label1" Text='<%#Eval("UserName").ToString().Trim() %>' ForeColor="Navy" runat="server"></asp:Label>
                 &nbsp; >> &nbsp;
             <asp:Label ID="Label2" Text='<%#Eval("FileName") %>' runat="server"></asp:Label></h3>
            
          </div> <!-- end details -->
          <div style="margin-left:730px;margin-top:-40px;">&nbsp;&nbsp;<asp:Button ID="btn" runat="server" Text="Download&nbsp;&#8659;" CssClass="btn btn-primary" /></div>
                </ItemTemplate>
        </asp:Repeater>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TSC_database_connection_string %>" SelectCommand="SELECT [UserName],[FileName],[TeacherName] FROM [NoticeBoard] WHERE ([TeacherName] = @TeacherName) ORDER BY ID DESC">
            <SelectParameters>
                <asp:SessionParameter Name="TeacherName" SessionField="user" Type="String" />
            </SelectParameters>
                </asp:SqlDataSource>
                  </div>

    </form>
</body>
</html>
