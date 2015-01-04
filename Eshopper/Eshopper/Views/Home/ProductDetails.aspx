<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/LayoutMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="Eshopper.Models" %>


<asp:Content ID="Content2" ContentPlaceHolderID="TitleConten" runat="server">
    <% tblProduct product = (tblProduct)ViewData["product"]; %>
    <%= product.sProductName%>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <% tblProduct product = (tblProduct)ViewData["product"]; %>
    <div class="col-sm-9 padding-right">
        <div class="product-details">
            <!--product-details-->
            <div class="col-sm-5">
                <div class="view-product">
                    <img src="../../images/home/<% =product.sImage01%>" alt="" />
                    <h3>ZOOM</h3>
                </div>
                <div id="similar-product" class="carousel slide" data-ride="carousel">

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <% for (int i = 0; i < 3; i++)
                           {                                                       
                        %>
                        <div class="item <%=(i == 0)?"active":"" %>">
                            <a href="#">
                                <img src="../../images/product-details/similar1.jpg" alt=""></a>
                            <a href="#">
                                <img src="../../images/product-details/similar2.jpg" alt=""></a>
                            <a href="#">
                                <img src="../../images/product-details/similar3.jpg" alt=""></a>
                        </div>
                        <%                            
                           } 
                        %>
                    </div>

                    <!-- Controls -->
                    <a class="left item-control" href="#similar-product" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a class="right item-control" href="#similar-product" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
                </div>

            </div>
            <div class="col-sm-7">
                <div class="product-information">
                    <!--/product-information-->
                    <%
                        if (product.tblCondition.PK_iConditionID == 1)
                        {
                    %>
                    <img src="../../images/product-details/new.jpg" class="newarrival" alt="" />
                    <%
                        }
                        else
                        {
                            //Sale
                        }
                    %>

                    <h2><%=product.sProductName %></h2>

                    <img src="../../images/product-details/rating.png" alt="" />
                    <span>
                        <span>US $<%=product.fCost %></span>
                        <label>Quantity:</label>
                        <input type="text" value="1" />
                        <button type="button" class="btn btn-default cart">
                            <i class="fa fa-shopping-cart"></i>
                            Add to cart
                        </button>
                    </span>
                    <p><b>Availability: </b><%=product.sAvailability %></p>
                    <p><b>Condition: </b><%=product.tblCondition.sConditionName %></p>
                    <p><b>Brand: </b><%=product.tblBrand.sBrandName %></p>
                    <a href="#">
                        <img src="../../images/product-details/share.png" class="share img-responsive" alt="" /></a>
                </div>
                <!--/product-information-->
            </div>
        </div>
        <!--/product-details-->

        <div class="category-tab">
            <!--category-tab-->
            <div class="col-sm-12">
                <ul class="nav nav-tabs">
                    <% List<tblCategory> categoriesTag = ((List<tblCategory>)ViewData["categoryTag"]); %>

                    <%
                        bool isActive = true;
                        foreach (tblCategory category in categoriesTag)
                        {
                            if (isActive)
                            {
                                isActive = false;
                    %>
                    <li class="active"><a href="#<%=category.sCategoryName %>" data-toggle="tab"><%=category.sCategoryName %></a></li>
                    <%
                            }
                            else
                            {
                    %>
                    <li><a href="#<%=category.sCategoryName %>" data-toggle="tab"><%=category.sCategoryName %></a></li>
                    <%
                               
                            }
                        }/*end foreach*/
                    %>
                    <li class=""><a href="#reviews" data-toggle="tab">Reviews (<%=((List<tblReview>)ViewData["reviews"]).Count %>)</a></li>
                </ul>
            </div>
            <div class="tab-content">
                <% 
                    bool isF = true;
                    foreach (tblCategory category in categoriesTag)
                    {
                       
                %>
                <div class="tab-pane fade in <%=(isF)?"active":"" %>" id="<%=category.sCategoryName %>">
                    <% foreach (tblProduct product2 in category.tblProducts.OrderByDescending(product2 => product.PK_iProductID).Take(4))
                       {
                           isF = false;
                    %>
                    <div class="col-sm-3">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="../../images/home/<%=product2.sImage01 %>" alt="<%=product2.sProductName %>" />
                                    <h2>$<%=product2.fCost %></h2>
                                    <a href="<% =Url.Action("ProductDetails/" + product2.PK_iProductID) %>">
                                        <p><%=product2.sProductName %></p>
                                    </a>
                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                       } 
                    %>
                </div>
                <%
                    }
                %>
                <div class="tab-pane fade in" id="reviews">
                    <div class="col-sm-12" id="review-box">
                        <% List<tblReview> reviews = (List<tblReview>)ViewData["reviews"];

                           foreach (tblReview review in reviews)
                           {
                        %>
                        <ul>
                            <li><a href="#"><i class="fa fa-user"></i><%=review.sName %></a></li>
                            <li><a href="#"><i class="fa fa-clock-o"></i>12:41 PM</a></li>
                            <li><a href="#"><i class="fa fa-calendar-o"></i><%=DateTime.Parse(review.tDatetime.ToString()).ToString("dd MMM yyyy") %></a></li>
                        </ul>
                        <p><%=review.sReview %></p>
                        <%
                           }
                        %>

                        <p><b>Write Your Review</b></p>

                        <% using (Html.BeginForm("AddReview", "Home", FormMethod.Post))
                           {
                        %>
                        <span>
                            <%=Html.Hidden("id", product.PK_iProductID) %>
                            <% = Html.TextBox("name", null,null,new{placeholder = "Your Name"}) %>
                            <% = Html.TextBox("email", null,null,new{placeholder = "Email Address"}) %>
                        </span>
                        <%=Html.TextArea("content") %>
                        <b>Rating: </b>
                        <img src="../../images/product-details/rating.png" alt="" />
                        <% =Ajax.ActionLink("Submit","AddReview", "Home",null , new AjaxOptions()
                            {
                                HttpMethod = "GET",
                                UpdateTargetId = "review-box",
                                InsertionMode = InsertionMode.InsertBefore
                            }, new {@class="btn btn-default pull-right"}) %>
                        <%
                           } 
                        %>
                    </div>
                </div>
            </div>
            <!--/tab-content -->
        </div>
        <!--/category-tab-->

        <div class="recommended_items">
            <!--recommended_items-->
            <h2 class="title text-center">recommended items</h2>

            <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="item active">
                        <% List<tblProduct> productsRecomment = (List<tblProduct>)ViewData["recommentItems"];
                           for (int i = 0; i < 3; i++)
                           {
                        %>
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="../../images/home/<%=productsRecomment[i].sImage01 %>" alt="" />
                                        <h2>$<%=productsRecomment[i].fCost %></h2>
                                        <a href="<% =Url.Action("ProductDetails/" + productsRecomment[i].PK_iProductID) %>">
                                            <p><%=productsRecomment[i].sProductName %></p>
                                        </a>
                                        <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                           }
                        %>
                    </div>
                    <div class="item">
                        <% 
                            for (int i = 3; i < 6; i++)
                            {
                        %>
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="../../images/home/<%=productsRecomment[i].sImage01 %>" alt="" />
                                        <h2>$<%=productsRecomment[i].fCost %></h2>
                                        <a href="<% =Url.Action("ProductDetails/" + productsRecomment[i].PK_iProductID) %>">
                                            <p><%=productsRecomment[i].sProductName %></p>
                                        </a>
                                        <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
                <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                    <i class="fa fa-angle-left"></i>
                </a>
                <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                    <i class="fa fa-angle-right"></i>
                </a>
            </div>
        </div>
        <!--/recommended_items-->

    </div>


</asp:Content>


