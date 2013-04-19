﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Session.Classes.Blog>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>Blog</legend>

    <div class="display-label">header</div>
    <div class="display-field"><%: Model.header %></div>

    <div class="display-label">text</div>
    <div class="display-field"><%: Model.text %></div>

    <div class="display-label">created</div>
    <div class="display-field"><%: String.Format("{0:g}", Model.created) %></div>

    <div class="display-label">IsPersisted</div>
    <div class="display-field"><%: Model.IsPersisted %></div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>

