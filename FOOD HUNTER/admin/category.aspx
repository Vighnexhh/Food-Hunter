<%@ Page Title="Category Management" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="FOOD_HUNTER.admin.category" %>
<%@ Import Namespace="FOOD_HUNTER" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function () {
            setTimeout(function () {
                var lblMsg = document.getElementById("<%= lblMsg.ClientID %>");
                if (lblMsg) {
                    lblMsg.style.display = "none";
                }
            }, 5000);
        };

        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById("<%= imgCategory.ClientID %>").src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pcoded-inner-container pt-0">
        <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>

        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4>Manage Categories</h4>
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <!-- Category Form -->
                                        <div class="col-sm-6 col-md-4">
                                            <h4 class="sub-title">Category Details</h4>
                                            <div class="form-group">
                                                <label>Category Name</label>
                                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Category Name" required></asp:TextBox>
                                                <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                            </div>

                                            <div class="form-group">
                                                <label>Category Image</label>
                                                <asp:FileUpload ID="fuCategoryImage" runat="server" CssClass="form-control" onchange="ImagePreview(this);" />
                                            </div>

                                            <div class="form-check">
                                                <asp:CheckBox ID="cblIsActive" runat="server" Text="&nbsp; Is Active" CssClass="form-check-input" />
                                            </div>

                                            <div class="pb-3">
                                                <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAddOrUpdate_Click" />
                                                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnClear_Click" />
                                            </div>

                                            <asp:Image ID="imgCategory" runat="server" CssClass="img-thumbnail" Width="200" Height="200" />
                                        </div>

                                        <!-- Category List -->
                                        <div class="col-sm-6 col-md-8">
                                            <h4 class="sub-title">Category List</h4>
                                            <div class="table-responsive">
                                                <asp:Repeater ID="rCategory" runat="server" OnItemCommand="rCategory_ItemCommand" OnItemDataBound="rCategory_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <table class="table table-bordered table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th>Name</th>
                                                                    <th>Image</th>
                                                                    <th>Is Active</th>
                                                                    <th>Created Date</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%# Eval("Name") %></td>
                                                            <td><img src="<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" width="40" /></td>
                                                            <td>
                                                                <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label>
                                                            </td>
                                                            <td><%# Eval("CreatedDate") %></td>
                                                            <td>
                                                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# Eval("CategoryId") %>' CssClass="btn btn-sm btn-warning">
                                                                    Edit
                                                                </asp:LinkButton>
                                                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("CategoryId") %>' CssClass="btn btn-sm btn-danger"
                                                                    OnClientClick="return confirm('Are you sure you want to delete this category?');">
                                                                    Delete
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
                                </div> <!-- End of card block -->
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
</asp:Content>
