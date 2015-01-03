<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/LayoutMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="Eshopper.Models" %>

<asp:Content ID="Content2" ContentPlaceHolderID="TitleConten" runat="server">
    <%=ViewData["title"] %>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-sm-9 padding-right">
        <div class="features_items">
            <!--features_items-->
            <h2 class="title text-center">Features Items</h2>
            <% List<tblProduct> products = (List<tblProduct>)ViewData["products"]; %>
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
                                <p><%=product.sProductName %></p>
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

            <ul class="pagination">
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>
        </div>
        <!--features_items-->
    </div>
</asp:Content>
