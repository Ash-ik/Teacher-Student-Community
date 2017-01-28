<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<link href="StyleSheet.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<head>

    <title></title>
    <h1 style="margin-left: 680px; margin-top: 70px;font-family:'Comic Sans MS';">Register Here</h1>
</head>


<body>

    <form id="loginForm" runat="server">
        <div id="registrationForm">
                <div>
    </div>
            <div id="captionLabel">Username:&nbsp;&nbsp;<asp:Label ID="LabelUserExist" runat="server" ForeColor="Red" Text="&nbsp;"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username Required !!" ControlToValidate="TextBoxUsername" Font-Bold="True" Font-Size="20px" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            <div id="inputPlace">
                <asp:TextBox ID="TextBoxUsername" runat="server" Width="250px" Height="35px" onchange="validateName();" AutoPostBack="true" BorderWidth="4px" BorderColor="WindowFrame"></asp:TextBox>
                </div>
            <a style="margin-left:115px;margin-top:40px;margin-bottom:20px;text-decoration:none;" class="btn-lg" data-toggle="collapse" href="#isStudent" aria-expanded="false" aria-controls="collapseExample" onclick="userIsStudent();">
  Student? Click Here..
</a>
            <div class="collapse" id="isStudent">
            <div id="captionLabel">Roll: <label class="alert-danger" id="labelRoll" style="margin-left:10px;margin-top:20px;background-color: red; font-size: 20px;"></label>
                </div>
            <div id="inputPlace">
                <asp:TextBox ID="TextBoxRoll" runat="server" Width="250px" Height="35px" BorderWidth="4px" BorderColor="WindowFrame" TextMode="Number" onBlur="validRoll();"></asp:TextBox></div>
                </div>
            <div id="captionLabel">Email:<label class="alert-danger" id="labelError" style="margin-left:10px;margin-top:20px;background-color: red; font-size: 20px;"></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter your Email" ControlToValidate="TextBoxEmail" Font-Bold="True" Font-Size="20px" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            <div id="inputPlace">
                <asp:TextBox ID="TextBoxEmail" runat="server" placeholder="abc@def.com" Width="250px" Height="35px" BorderWidth="4px" BorderColor="WindowFrame" onchange="ValidateEmailId();" AutoPostBack="true"></asp:TextBox></div>
            <div id="captionLabel">Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter your Password" ControlToValidate="TextBoxPassword" Font-Bold="True" Font-Size="20px" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            <div id="inputPlace">
                <asp:TextBox ID="TextBoxPassword" runat="server" Width="250px" Height="35px" BorderWidth="4px" BorderColor="WindowFrame" TextMode="Password"></asp:TextBox></div>
            <div id="captionLabel">Confirm Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxConfirmPassword" ErrorMessage="Password Didn't match !!" Font-Bold="True" Font-Size="20px" ForeColor="Red"></asp:CompareValidator>
                </div>
            <div id="inputPlace">
                <asp:TextBox ID="TextBoxConfirmPassword" runat="server" Width="250px" Height="35px" BorderWidth="4px" BorderColor="WindowFrame" TextMode="Password"></asp:TextBox></div>
            <div id="submitButton">
                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg" OnClick="Button1_Click"></asp:Button>

            </div>
        </div>
    </form>

    <script language="javascript" type="text/javascript">

        function ValidateEmailId() {
            var value = document.getElementById("<%=TextBoxEmail.ClientID %>").value;

            if (value == null || value == "") {
                labelError.textContent = "";
                System.threading.Thread.Sleep("5000");
                return false;
            }
            var atposition = value.indexOf("@");
            var dotposition = value.lastIndexOf(".");
            if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= value.length) {

                labelError.textContent = "Invalid Email ID";
                System.threading.Thread.Sleep("5000");
                labelError.textContent = "";
                return false;
            }
            else {
                return true;
            }
        }

        function validRoll()
        {
            var value = document.getElementById("<%=TextBoxRoll.ClientID %>").value;
            if (value == null || value == "") {
                labelRoll.textContent = "Please Enter your Roll";
                System.threading.Thread.Sleep("5000");
                return false;
            }
            else
            {
                labelRoll.textContent = "";
                System.threading.Thread.Sleep("5000");
                return true;
            }
                
        }
    </script>
        <script src="js/bootstrap.jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
