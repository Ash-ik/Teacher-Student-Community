<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registerPart2.aspx.cs" Inherits="registerPart2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <link href="StyleSheet.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<head runat="server">
    <title>More info</title>
        <h1 style="margin-left: 660px; margin-top: 70px;font-family:'Comic Sans MS';">Registration Form</h1>
</head>
<body>
    <form id="form1" runat="server">

        <div id="registrationForm">
            &nbsp;<div id="uploadPic">
                <img id="proPic" src="pictures/no_pic.png" class="thumbnail" style="border-radius:35px;"/>
            </div>
            <div style="float:left;margin-left:-5px;margin-top:-20px;">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            </div>
            <div style="margin-left:200px;margin-top:-65px;">
                
                <asp:AsyncFileUpload OnClientUploadComplete="uploadComplete" runat="server" ID="AsyncFileUpload1" Height="30px"

    Width="200px" CompleteBackColor="White" UploadingBackColor="#CCFFFF"

    OnUploadedComplete="FileUploadComplete" OnClientUploadStarted = "uploadStarted"/> 

            </div>           

            <div id="inputAbout"><div class="h2" style="margin-left:150px;margin-top:20px; font-family:'Comic Sans MS'"> About Yourself:<br></div>
                <asp:TextBox ID="TextBoxAbout" runat="server" Width="480px" placeholder="Say something about yourself..." Height="150px" TextMode="MultiLine" CssClass="input-lg" BorderColor="WindowText"></asp:TextBox>
            </div>

                <h2 style="margin-top:30px;margin-left:20px;">Birthdate:</h2>
                        <div id="birhtdate" style="margin-top:10px;margin-left:-130px;">
            <asp:TextBox ID="TextBoxDate" CssClass="input-lg" BorderColor="WindowText" runat="server" placeholder="Ex:  27/01/1994"/>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxDate" ValidationExpression="(((0|1)[1-9]|2[1-9]|3[0-1])\/(0[1-9]|1[1-2])\/((19|20)\d\d))$"
    ErrorMessage="Invalid date format." ValidationGroup="Group1" Font-Bold="True" Font-Size="30px" ForeColor="Red" />
                </div>
            <h2 style="margin-top:-20px;margin-left:20px;">Contact:</h2>
            <div id="phoneNumber" style="margin-top:10px;margin-left:-130px;">

                <asp:TextBox ID="TextBoxPhone" CssClass="input-lg" BorderColor="WindowText" runat="server" placeholder="  +880**********"/>
            </div>
            <div id="submitButton">
                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg" OnClick="Button1_Click"></asp:Button>
            </div>
    </div>
    </form>
<script type="text/javascript">
    function uploadStarted() {
        $get("proPic").className = "thumbnail";
    }
    function uploadComplete(sender, args) {
        var imgDisplay = $get("proPic");
        var img = new Image();
        img.onload = function () {
            imgDisplay.className = "thumbnail";
            imgDisplay.style.cssText= "height:218px;width:300px;border-radious:35px;margin-left:20px;";
            imgDisplay.src = img.src;
        };
        img.src = "<%=ResolveUrl(UploadFolderPath) %>" + args.get_fileName();
        
    }

    </script>
    
    <script src="js/bootstrap.jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
