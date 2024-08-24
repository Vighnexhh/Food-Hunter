﻿<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="FOOD_HUNTER.user.registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <script>
        windows.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
        }, seconds * 1000);
        };
    </script>           

<script>
    function ImagePreview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#<%=imgUser.ClientID%>').prop('src', e.target.result)
                    .width(200)
                    .height(200);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
  <div class="container">
    <div class="heading_container">
      <div class="align-self-start">
        <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration</h2>"></asp:Label>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        <div class="form_container">
          <div>
              <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="name is required" ControlToValidate="txtName" ForeColor="Red"
                   Display="Dynamic"  SetFocusOnError="true" ></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="must contain only alphabets" ForeColor="Red" 
                  ControlToValidate="txtName" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$" ></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Full Name" ToolTip="full name" ></asp:TextBox>
          </div>

            <div>
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username is required" ControlToValidate="txtUsername" ForeColor="Red"
                     Display="Dynamic"  SetFocusOnError="true" ></asp:RequiredFieldValidator>
              <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username" ToolTip="Username" ></asp:TextBox>
            </div>

            <div>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required"  ControlToValidate="txtEmail" ForeColor="Red"
                     Display="Dynamic"  SetFocusOnError="true" ></asp:RequiredFieldValidator>
              <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Enter Email" ToolTip="Email" ></asp:TextBox>
            </div>

            <div>
                <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ErrorMessage="Mobile Number is required" ControlToValidate="txtMobile" ForeColor="Red"
                     Display="Dynamic"  SetFocusOnError="true" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revMobile" runat="server" ErrorMessage="must contain 10 numbers only" ForeColor="Red" 
                    ControlToValidate="txtMobile" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$" ></asp:RegularExpressionValidator>
              <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Mobile Number" TextMode="Number" ToolTip="Mobile Number" ></asp:TextBox>
            </div>

        </div>
      </div>
   
    <div class="col-md-6">
      <div class="form_container">
        <div>

            <div>
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is required" ControlToValidate="txtAddress" ForeColor="Red"
                     Display="Dynamic"  SetFocusOnError="true" ></asp:RequiredFieldValidator> 
              <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address" ToolTip="Address" TextMode="MultiLine" ></asp:TextBox>
            </div>

              <div>
                  <asp:RequiredFieldValidator ID="rfvPostCode" runat="server" ErrorMessage="PostCode is required" ControlToValidate="txtPostCode" ForeColor="Red"
                       Display="Dynamic"  SetFocusOnError="true" ></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="revPost" runat="server" ErrorMessage="must contain numbers only" ForeColor="Red" 
                    ControlToValidate="txtPostCode" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{6}$" ></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control" placeholder="Enter PostCode" ToolTip="PostCode" TextMode="Number" ></asp:TextBox>
              </div>

              <div>
                  <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="user image" onchange="ImagePreview(this);" />
              </div>

              <div>
                  <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" ForeColor="Red"
                       Display="Dynamic"  SetFocusOnError="true" ></asp:RequiredFieldValidator> 
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" ToolTip="Password" TextMode="Password" ></asp:TextBox>
              </div>

        </div>
      </div>
    </div>

        <div class="row pl-4">
              <div class="btn_box">
                <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" />
                <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100"
                  Text="Already registered? <a href='Login.aspx' class='badge badge-info'>Login here.</a>">
                </asp:Label>
              </div>
            </div>

            <div class="row p-5">
              <div style="align-items:center">
                <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
              </div>
            </div>



         </div>
  </div>
</section>



</asp:Content>
