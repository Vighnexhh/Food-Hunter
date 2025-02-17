<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="FOOD_HUNTER.user.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Hide message after 5 seconds -->
    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                var lblMsg = document.getElementById("<%=lblMsg.ClientID%>");
                if (lblMsg) lblMsg.style.display = "none";
            }, seconds * 1000);
        };
    </script>

    <!-- Leaflet CSS and JS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

    <script>
        function initLeafletMap(latitude, longitude) {
            var userLocation = [latitude, longitude]; // Coordinates from the database

            // Initialize map
            var map = L.map('leafletMap').setView(userLocation, 12);

            // Add OpenStreetMap tile layer
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; OpenStreetMap contributors'
            }).addTo(map);

            // Add marker for user location
            L.marker(userLocation).addTo(map)
                .bindPopup("User's Registered Location")
                .openPopup();
        }
    </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Contact Form Section -->
    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
                <h2>Send Your Query</h2>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is Required" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Your Email" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is Required" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Subject"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Subject is Required" ControlToValidate="txtSubject" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" placeholder="Enter Your Query/Feedback"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="Message is Required" ControlToValidate="txtMessage" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>
                        <div class="btn_box">
                           <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" CssClass="btn btn-warning rounded-pill pl-4 pr-4 text-white" OnClick="btnSubmit_Click"/>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- Google Map Container -->
                    <div class="map_container">
    <div id="leafletMap" style="width: 100%; height: 400px; border-radius: 10px; box-shadow: 2px 2px 10px rgba(0,0,0,0.2);"></div>
</div>

                </div>
            </div>
        </div>
    </section>
    <!-- End Contact Section -->

</asp:Content>
