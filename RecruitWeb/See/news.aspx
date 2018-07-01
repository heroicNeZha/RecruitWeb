<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="RecruitWeb.See.news" %>
<%@ Import Namespace="RecruitWeb.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <ol class="breadcrumb">
        <li><a href="#">求职者</a></li>
        <li><a href="#">我的信箱</a></li>
    </ol>

    <div id="display" class="well display-box">
        <%
                    List<News> newsList = DNews.getNewsBySeeker(Convert.ToInt32(Session["uid"]));
                    foreach (News news in newsList)
                    {
        %>
        <div class="infoBox">
            <div class="itemBox nameBox">
                <div class="jobName">
                    <span title="<%:news.Ntitle %>" class="job_title"><%:news.Ntitle %></span>
                </div>
                <div class="commpanyName">
                    <p class="job_date"><%:news.Ntime.ToString() %></p>
                    <input type='checkbox' name='push' value="<%:news.Nid %>" id="<%:news.Nid %>" style="margin-right: 16px">
                </div>
            </div>
            <div class="itemBox descBox">
                <div class="jobDesc">
                    <p class="news"><%:news.Ncontent %></p>
                </div>
            </div>
        </div>
        <%
                    }
        %>
    </div>
    </asp:Content>
