<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="FOOD_HUNTER.user.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <script>
    window.onload = function () {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
    }, seconds * 1000);
    };
        </script>    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
                <h2>Login</h2>
            </div>
            <div class="row">


                <div class="col-md-6">
                    <div class="form_container">
                        <img id="userlogin" src="../Images/login.jpg" alt="" class="img-thumbnail"/>
                    </div>
                </div>
                
                <div class="col-md-6" >
                    <div class="form_container">
                        <div>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" Font-Size="Small" ErrorMessage="Username is required" ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                        </div>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvPass" runat="server" Font-Size="Small" ErrorMessage="Password is required" ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                        </div>
                        &nbsp
                        &nbsp
                        &nbsp
                        &nbsp
                        &nbsp
                         &nbsp
                        <div class="btn_box">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnLogin_Click"/>
                        </div>
                         &nbsp
                         &nbsp
                         &nbsp
                         &nbsp
                         &nbsp
                         &nbsp
                         &nbsp
                         &nbsp
                         &nbsp
                         &nbsp
                         &nbsp
                        <span class="pl-3 text-info">New User? <a href="Registration.aspx" class="badge badge-info">Register Here....</a></span>
                    </div>
                </div>

                
            </div>
        </div>
    </section>

</asp:Content>
