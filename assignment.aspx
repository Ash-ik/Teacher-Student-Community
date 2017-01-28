<%@ Page Language="C#" AutoEventWireup="true" CodeFile="assignment.aspx.cs" Inherits="assignment" %>
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
 
<h3 style="margin-left:300px;margin-top:80px;">
    Teacher:
</h3>
        <h3 style="margin-left:600px;margin-top:-35px;">
            File
        </h3>                <ajax:ToolkitScriptManager ID="ScriptManager1" runat="server"/>
<asp:TextBox ID="txtCountry" runat="server" CssClass="input-large" placeholder="type a teacher name..." Style="border-radius:10px;height:30px;font-family:'Comic Sans MS';margin-left:300px;"></asp:TextBox>
<ajax:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtCountry"
MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="10" CompletionInterval="0" ServiceMethod="GetCountries" >
</ajax:AutoCompleteExtender>

        <asp:FileUpload ID="FileUpload1" runat="server" Style="margin-left:600px;margin-top:-40px;"/>
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" Style="margin-left:800px;margin-top:-50px;" CssClass="btn btn-primary"/>

<h3 style="margin-left:200px;font-weight:bold;">Teacher</h3>
 <h3 style="margin-left:400px;margin-top:-30px;font-weight:bold;">File</h3>
                <asp:Repeater ID="Repeater1" runat="server"  DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
            <ItemTemplate>
            
            <h3 style="margin-left:180px;"><asp:Label ID="Label1" Text='<%#Eval("TeacherName").ToString().Trim() %>' ForeColor="Navy" runat="server"></asp:Label> &nbsp; >> &nbsp;  <asp:Label ID="Label2" Text='<%#Eval("FileName") %>' runat="server"></asp:Label></h3>
            
          </div> <!-- end details -->
          <div style="margin-left:500px;margin-top:-40px;">&nbsp;&nbsp;<asp:Button ID="btn" runat="server" Text="Download&nbsp;&#8659;" CssClass="btn btn-primary" /></div>
                </ItemTemplate>
        </asp:Repeater>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TSC_database_connection_string %>" SelectCommand="SELECT [FileName],[TeacherName] FROM [NoticeBoard] WHERE ([UserName] = @UserName) ORDER BY ID DESC">
            <SelectParameters>
                <asp:SessionParameter Name="UserName" SessionField="user" Type="String" />
            </SelectParameters>
                </asp:SqlDataSource>
                  </div>

    </form>
</body>
</html>
