<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="welcome.aspx.cs" Inherits="RecruitWeb.Com.welcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <ol class="breadcrumb">
        <li><a href="#">公司</a></li>
        <li><a href="#">欢迎</a></li>
    </ol>
    <div class="jumbotron">
        <div class="container">
            <h1>伍八招聘</h1>
            <p class="lead">欢迎 <%:Session["user"] %></p>
        </div>
    </div>
</asp:Content>
