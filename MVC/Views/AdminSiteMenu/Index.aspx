﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PHD.Session.Classes.Sitemenu>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            Id
        </th>
        <th>
            name
        </th>
        <th>
            position
        </th>
        <th>
            url
        </th>
        <th>
            image
        </th>
        <th>
            type
        </th>
        <th>
            Action
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Id) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.position) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.url) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.image) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.type) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new {  id=item.Id  }) %> |
            <%: Html.ActionLink("Details", "Details", new {  id=item.Id }) %> |
            <%: Html.ActionLink("Delete", "Delete", new {  id=item.Id }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
