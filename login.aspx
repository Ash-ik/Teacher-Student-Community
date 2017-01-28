<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html> 

<html xmlns="http://www.w3.org/1999/xhtml">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="StyleSheet.css" rel="stylesheet">

    <head>

    <title></title>
    <h1 style="margin-left: 680px; margin-top: 70px;font-family:'Comic Sans MS';">Login Here</h1>
</head>


<body>

    <form id="loginForm" runat="server">
        <div id="registrationForm">
                <div>
    </div>
            <div id="captionLabel">Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username Required !!" ControlToValidate="TextBoxUsername" Font-Bold="True" Font-Size="20px" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            <div id="inputPlace">
                <asp:TextBox ID="TextBoxUsername" CssClass="input-lg" BorderColor="WindowText" runat="server" Width="250px" Height="35px"></asp:TextBox>
                </div>
            <div id="captionLabel">Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password Required !!" ControlToValidate="TextBoxPassword" Font-Bold="True" Font-Size="20px" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            <div id="inputPlace">
                <asp:TextBox ID="TextBoxPassword" CssClass="input-lg" BorderColor="WindowText" runat="server" Width="250px" Height="35px" TextMode="Password"></asp:TextBox></div>
            <div id="captionLabel" style="margin-left:150px;">
                <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged"/>&nbsp;&nbsp;Remeber me
                </div>
            
            <div id="submitButton">
                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg" OnClick="Button1_Click"></asp:Button>

            </div>
        </div>
    </form>


        <script src="js/bootstrap.jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootbox.min.js"></script>
    </body>

</html>