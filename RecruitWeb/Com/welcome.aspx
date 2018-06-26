<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="welcome.aspx.cs" Inherits="RecruitWeb.Com.welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    欢迎<%:Session["user"] %>
</asp:Content>
