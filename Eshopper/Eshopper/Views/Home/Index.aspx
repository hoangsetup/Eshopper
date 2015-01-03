<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/LayoutMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="Eshopper.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleConten" runat="server">

    <%=ViewData["title"] %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-sm-9 padding-right">
        <div class="features_items">
            <!--features_items-->
            <h2 class="title text-center">Features Items</h2>
            <% List<tblProduct> products = (List<tblProduct>)ViewData["featuresItems"]; %>
            <% foreach (tblProduct product in products)
               {
            %>
            <div class="col-sm-4">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../../images/home/<%=product.sImage01 %>" alt="<%=product.sProductName %>" />
                            <h2>$<%=product.fCost %></h2>
                            <p><%=product.sProductName %></p>
                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                        </div>
                        <div class="product-overlay">
                            <div class="overlay-content">

                                <h2>$<%=product.fCost %></h2>
                                <a href="<% =Url.Action("ProductDetails/" + product.PK_iProductID) %>">
                                    <p><%=product.sProductName %></p>
                                </a>
                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                            </div>
                        </div>
                        <% if (product.tblCondition.PK_iConditionID == 1)
                           {
                        %>
                        <img src="../../images/home/new.png" class="new" alt="" />
                        <%
                           }
                           else if (product.tblCondition.PK_iConditionID == 2)
                           {
                        %>
                        <img src="../../images/home/sale.png" class="new" alt="" />
                        <%
                           }
                        %>
                    </div>
                    <div class="choose">
                        <ul class="nav nav-pills nav-justified">
                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <%
               } 
            %>
        </div>
        <!--features_items-->

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
                </ul>
            </div>
            <div class="tab-content">
                <% 
                    bool isF = true;
                    foreach (tblCategory category in categoriesTag)
                    {
                %>
                <div class="tab-pane fade <%=(isF)?"active":"" %> in " id="<%=category.sCategoryName %>">
                    <% foreach (tblProduct product in category.tblProducts.OrderByDescending(product => product.PK_iProductID).Take(4))
                       {
                           isF = false;
                    %>
                    <div class="col-sm-3">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="../../images/home/<%=product.sImage01 %>" alt="<%=product.sProductName %>" />
                                    <h2>$<%=product.fCost %></h2>
                                    <a href="<% =Url.Action("ProductDetails/" + product.PK_iProductID) %>">
                                        <p><%=product.sProductName %></p>
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
