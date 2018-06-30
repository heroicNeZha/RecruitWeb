<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="job.aspx.cs" Inherits="RecruitWeb.Com.job" %>
<%@ Import Namespace="RecruitWeb.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div style="margin: 30px 30px 30px 30px; padding: 30px;">
            <div id="submit">

            </div>
            <div id="display">
                <%
                    Company company = new Company();
                    if (Session["user"] != null)
                        company = (Company) Session["user"];
                    else
                        Response.Redirect("~/", false);
                    List<Job> jobs = DJob.getJobsByCompany(company.Cid);
                    foreach (Job job in jobs)
                    {
                %>
                        <div class ="well">

                        </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</asp:Content>
