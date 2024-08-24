﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="FOOD_HUNTER.admin.product" %>
<%@ Import Namespace="FOOD_HUNTER" %>

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
                        $('#<%=imgProduct.ClientID%>').prop('src', e.target.result)
                            .width(200)
                            .height(200);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pcoded-inner-container pt-0">
    <div class="align-align-self-end">
        <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
    </div>
    <div class="main-body">
        <div class="page-wrapper">
            <div class="page-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-header">
                            </div>
                            <div class="card-block">
                                <div class="row">

                                    <div class="col-sm-6 col-md-4 col-lg-4">
                                        <h4 class="sub-title">Product</h4>
                                        <div>
                                            <div class="form-group">
                                                <label>Product Name</label>
                                                <div>
                                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Product Name"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                        ErrorMessage="Name is Required" ForeColor="Red" SetFocusOnError="true" 
                                                        Display="Dynamic" ControlToValidate="txtName" ></asp:RequiredFieldValidator>
                                                     <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Product Description</label>
                                                <div>
                                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter Description Name" TextMode="MultiLine"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                        ErrorMessage="Description is Required" ForeColor="Red" SetFocusOnError="true" 
                                                        Display="Dynamic" ControlToValidate="txtDescription" ></asp:RequiredFieldValidator>
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Product Price</label>
                                                <div>
                                                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter Price"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                        ErrorMessage="Price is Required" ForeColor="Red" SetFocusOnError="true" 
                                                        Display="Dynamic" ControlToValidate="txtPrice" ></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                        ErrorMessage="Price must be in decimal" ForeColor="Red" SetFocusOnError="true" 
                                                        Display="Dynamic" ControlToValidate="txtPrice" ValidationExpression="^\d{0,8}(\.\d{1,4})?$" ></asp:RegularExpressionValidator>
                                                    </div>
                                            </div>


                                            <div class="form-group">
                                                <label>Product Quantity</label>
                                                <div>
                                                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" placeholder="Enter Quantity"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                        ErrorMessage="Quantity is Required" ForeColor="Red" SetFocusOnError="true" 
                                                        Display="Dynamic" ControlToValidate="txtQuantity" ></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                        ErrorMessage="Quantity must be non negative" ForeColor="Red" SetFocusOnError="true" 
                                                        Display="Dynamic" ControlToValidate="txtQuantity" ValidationExpression="([1-9]\d*|0)$" ></asp:RegularExpressionValidator>
                                                    </div>
                                            </div>

                                            <div class="form-group">
                                                <label>Product Image</label>
                                                <div>
                                                    <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control" onchange="ImagePreview(this);"></asp:FileUpload>
                                                    </div>
                                            </div>

                                            <div class="form-group">
                                                    <label>Product Category</label>
                                                    <div>
                                                        <asp:DropDownList ID="ddlCategories" CssClass="form-control" runat="server"
                                                            DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CategoryId"
                                                            AppendDataBoundItems="true">
                                                            <asp:ListItem Value="0">Select Category</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red"
                                                            ErrorMessage="Category is required" SetFocusOnError="true" Display="Dynamic"
                                                            ControlToValidate="ddlCategories" InitialValue="0">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:cs %>"
                                                            SelectCommand="SELECT [CategoryId], [Name] FROM [Categories]">
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </div>
                                            <div class="form-check ">
                                                <div>
                                                    <asp:CheckBox ID="cblIsActive" runat="server" Text="&nbsp; IsActive" CssClass="form-check-input"></asp:CheckBox>
                                                    </div>
                                            </div>
                                            <div class="pb-5">
                                                <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add" CssClass="btn btn-inverse"  OnClick="btnAddOrUpdate_Click"></asp:Button>
                                                &nbsp;
                                                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-inverse" CausesValidation="false" OnClick="btnClear_Click"></asp:Button>
                                            </div>
                                            <div>
                                                <asp:Image ID="imgProduct" runat="server" CssClass="img-thumbnail" />
                                            </div>
                                            </div>
                                        </div>


                                    <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                        <h4 class="sub-title">Category Lists</h4>
                                          <div class="card-block table-bordered-style">
                                              <div  class="table-responsive">

                                                  <asp:Repeater ID="rProduct" runat="server" OnItemCommand="rProduct_ItemCommand" OnItemDataBound="rProduct_ItemDataBound">
                                                      <HeaderTemplate>
                                                          <table class="table data-table-export table-hover nowrap">
                                                              <thead>
                                                              <tr>
                                                                  <th class="table-plus">Name</th>
                                                                  <th>Image</th>
                                                                  <th>Price</th>
                                                                  <th>Qty</th>
                                                                  <th>Category</th>
                                                                  <th>IsActive</th>
                                                                  <th>Description</th>
                                                                  <th>CreatedDate</th>
                                                                  <th class="datatable-nosort">Action</th>
                                                              </tr>
                                                          </thead>
                                                              <tbody>
                                                      </HeaderTemplate>
                                                      <ItemTemplate>
                                                          <tr>
                                                              <td>  <%# Eval("Name") %></td>

                                                              <td> 
                                                                  <img alt="" width="40" src="<%# Utils.GetImageUrl( Eval("ImageUrl")) %>" />
                                                              </td>

                                                              <td>  <%# Eval("Price") %></td>

                                                              <td> 
                                                                <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                             </td>

                                                              <td>  <%# Eval("CategoryName") %></td>

                                                              <td> 
                                                                  <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label>
                                                               </td>

                                                              <td>  <%# Eval("Description") %></td>

                                                              <td>  <%# Eval("CreatedDate") %></td>

                                                              <td>
                                                                  <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge badge-dark" CommandArgument='<%# Eval("ProductId") %>'
                                                                     CommandName="edit" CausesValidation="false" >
                                                                      <i class="ti-pencil"></i>
                                                                  </asp:LinkButton>
                                                                  <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CssClass="badge badge-danger" CommandArgument='<%# Eval("ProductId") %>'
                                                                       CommandName="delete"  CausesValidation="false" OnClientClick="return confirm('Do You Want to remove this Product ?');">
                                                                      <i class="ti-trash"></i>
                                                                    </asp:LinkButton>
                                                              </td>
                                                          </tr> 
                                                      </ItemTemplate>
                                                      <FooterTemplate>
                                                          </tbody>
                                                          </table>
                                                      </FooterTemplate>
                                                  </asp:Repeater>
                                              </div>
                                          </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
