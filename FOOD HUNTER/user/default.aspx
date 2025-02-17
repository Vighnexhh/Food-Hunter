<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="FOOD_HUNTER.user._default" %>

<%@ Import Namespace="FOOD_HUNTER" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hidden {
            display: none;
        }

        /* Increased Card Width */
        .card {
            border-radius: 5px;
            text-align: center;
            width: 25rem;
            height: 150px; /* Fixed height for uniform size */
            position: relative;
            overflow: hidden;
        }

        /* Delete Button for Bottom-Right */
        .delete-btn {
            position: absolute;
            bottom: 5px; /* Adjust for bottom positioning */
            right: 5px; /* Adjust for right positioning */
            border-radius: 50%; /* Circular button */
            width: 32px; /* Fixed small size */
            height: 32px; /* Fixed small size */
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            color: white;
            background-color: red;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

            /* Trash Icon Hover Effect */
            .delete-btn:hover {
                background-color: darkred; /* Darker shade on hover */
            }

            /* Trash Icon */
            .delete-btn i {
                font-size: 16px;
                bottom: 5px; /* Adjust for bottom positioning */
                right: 5px; /* Adjust icon size */
            }

        /* Comment Text Styling */
        .comment-text {
            height: 80px; /* Fixed height to prevent stretching */
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }



        /* Static Carousel Buttons */
        .custom-carousel-btn {
            width: 50px;
            height: 50px;
            background-color: black;
            color: white;
            font-size: 24px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            border: 2px solid white;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
        }

        .left-btn {
            left: -60px;
        }

        .right-btn {
            right: -60px;
        }

        /* Adjust Heading Spacing */
        .heading_container h2 {
            font-family: 'Baskerville Old Face';
            margin-bottom: 10px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- offer section -->

    <section class="offer_section layout_padding-bottom">
        <div class="offer_container">
            <div class="container ">
                            <h1 style="text-align:center">Categories of Your Choice.</h1>
                <div class="row">

                    <asp:Repeater ID="rCategory" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6 ">
                                <div class="box " style="background-color: #222">
                                    <div class="img-box">
                                        <a href="menu.aspx?id=<%# Eval("CategoryId") %>">
                                            <img src="<%# Utils.GetImageUrl( Eval("ImageUrl")) %>" alt="">
                                        </a>
                                    </div>
                                    <div class="detail-box">
                                        <h2 style="font-family: 'Baskerville Old Face'">
                                            <%# Eval("Name") %>
                                        </h2>
                                       
                                        <a href="menu.aspx?<%# Eval("CategoryId") %>">Order Now 
          <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background: new 0 0 456.029 456.029;" xml:space="preserve">
              <g>
                  <g>
                      <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
           c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                  </g>
              </g>
              <g>
                  <g>
                      <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
           C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
           c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
           C457.728,97.71,450.56,86.958,439.296,84.91z" />
                  </g>
              </g>
              <g>
                  <g>
                      <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
           c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                  </g>
              </g>
              <g>
              </g>
              <g>
              </g>
              <g>
              </g>
              <g>
              </g>
              <g>
              </g>
              <g>
              </g>
              <g>
              </g>
              <g>
              </g>
              <g>
              </g>
              <g>
              </g>
              <g>
              </g>
              <g>
              </g>
              <g>
              </g>
              <g>
              </g>
              <g>
              </g>
          </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </section>

    <!-- end offer section -->


    <!-- about section -->

    <section class="about_section layout_padding" style="background-color: #222">
        <div class="container  ">

            <div class="row">
                <div class="col-md-6 ">
                    <div class="img-box">
                        <img src="../templates/images/abt.png" alt="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="detail-box">
                        <div class="heading_container">
                            <h2>We Are Food Hunter
                            </h2>
                        </div>
                        <p>
                            Embark on a culinary journey with Food Hunter, your one-stop destination for exploring the vibrant flavors of street food. Our mission is simple yet impactful: to connect you with the hidden gems of local street vendors, bringing their authentic and delicious creations right to your doorstep.
 At Food Hunter, we believe in supporting small businesses while offering you an unforgettable gastronomic experience. Discover a diverse range of dishes, from savory snacks to delightful sweets, all made with love and care by passionate street food artisans.
 Let’s hunt down the best street food together, one bite at a time!
                        </p>
                        <a href="about.aspx">Read More
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end about section -->


    <!-- Client Section - Comments -->
    <section class="comment_section layout_padding">
        <div class="container">

            <!-- Adjusted Heading Position -->
            <div class="heading_container heading_center psudo_white_primary mt-n5 mb-4">
                <h2 class="mt-n3">Customer Reviews </h2>
            </div>

            <!-- Add Comment Button with More Spacing -->
            <div class="text-center my-4">
                <asp:Button ID="btnAddComment" runat="server" Text="Add Comment" CssClass="btn btn-primary"
                    OnClientClick="toggleCommentBox(); return false;" />
            </div>

            <!-- Hidden Comment Form -->
            <div id="commentForm" style="display: none;">
                <asp:TextBox ID="txtComment" runat="server" CssClass="form-control mb-2"
                    placeholder="Write your comment here..."></asp:TextBox>
                <asp:Button ID="btnSubmitComment" runat="server" Text="Submit" CssClass="btn btn-success"
                    OnClick="btnSubmitComment_Click" />
            </div>

            <!-- Comment Display Section -->
            <div id="commentContainer" class="mt-4 position-relative">

                <!-- Static Carousel Navigation Buttons -->
                <a class="carousel-control-prev custom-carousel-btn left-btn" href="#commentCarousel" role="button" data-slide="prev">&#60;</a>
                <a class="carousel-control-next custom-carousel-btn right-btn" href="#commentCarousel" role="button" data-slide="next">&#62;</a>

                <div id="commentCarousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <asp:Repeater ID="rptComments" runat="server">
                            <ItemTemplate>
                                <%-- Open new row for every 3rd comment --%>
                                <%# Container.ItemIndex % 3 == 0 ? "<div class='carousel-item " + (Container.ItemIndex == 0 ? "active" : "") + "'><div class='row justify-content-center align-items-center'>" : "" %>

                                <div class="col-md-3 d-flex justify-content-center">
                                    <div class="card bg-dark text-white p-3">
                                        <div class="card-body">
                                            <!-- Delete Button Positioned at Top Right -->
                                            <asp:LinkButton ID="btnDelete" runat="server" CssClass="delete-btn btn btn-danger btn-sm"
                                                CommandArgument='<%# Eval("CommentId") %>' OnClick="btnDelete_Click" Text="delete">
                                                <i class="fa fa-trash"></i>
                                            </asp:LinkButton>


                                            <p class="card-text"><%# Eval("CommentText") %></p>
                                            <%--<h6 class="card-title">- <%# Eval("UserName") %></h6>--%>
                                        </div>
                                    </div>
                                </div>

                                <%-- Close row after every 3rd comment or last comment --%>
                                <%# (Container.ItemIndex + 1) % 3 == 0 || Container.ItemIndex + 1 == ((Repeater)Container.Parent).Items.Count ? "</div></div>" : "" %>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <script>
        function toggleCommentBox() {
            var commentForm = document.getElementById("commentForm");
            commentForm.style.display = (commentForm.style.display === "none" || commentForm.style.display === "") ? "block" : "none";
        }
    </script>

</asp:Content>
