<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Eshopper.Models.tblReview>" %>

<ul>
    <li><a href="#"><i class="fa fa-user"></i><%=Model.sName %></a></li>
    <li><a href="#"><i class="fa fa-clock-o"></i>12:41 PM</a></li>
    <li><a href="#"><i class="fa fa-calendar-o"></i><%=DateTime.Parse(Model.tDatetime.ToString()).ToString("dd MMM yyyy") %></a></li>
</ul>
<p><%=Model.sReview %></p>
