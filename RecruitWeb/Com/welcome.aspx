<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="welcome.aspx.cs" Inherits="RecruitWeb.Com.welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container">
        <div class="jumbotron">
            <h1>伍八招聘</h1>
            <p class="lead">欢迎 <%:Session["user"] %></p>
        </div>
    </div>
</asp:Content>
