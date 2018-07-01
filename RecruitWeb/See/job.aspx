<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="job.aspx.cs" Inherits="RecruitWeb.See.job" %>
<%@ Import Namespace="RecruitWeb.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <ol class="breadcrumb">
        <li><a href="#">求职者</a></li>
        <li><a href="#">岗位查询</a></li>
    </ol>
            <div id="display" class="well display-box">
                <%
                    List<Job> jobs = DJob.getJobsBySeeker(Convert.ToInt32(Session["uid"]));
                    foreach (Job job in jobs)
                    {
                %>
                <div class="infoBox">
                    <div class="itemBox nameBox">
                        <div class="jobName">
                            <span title="<%:job.Jname %>" class="job_title"><%:job.Jname %></span>
                        </div>
                        <div class="commpanyName">
                            <%:job.Cname %>
                        </div>
                    </div>
                    <div class="itemBox descBox">
                        <div class="jobDesc">
                            <p class="job_saray"><%:job.Jsalary %></p>
                            <p style="float:left;margin-left:8px"><%:job.Jneed %></p>
                            
                        </div>
                        <div class="jobDate">
                            <p class="job_date"><%:job.Jdate %></p>
                            <input type='checkbox' name='push' value="<%:job.Jid %>" id="<%:job.Jid %>" style="margin-right: 16px">
                            <!--<a href="#editJob" id="edit_job" role="button" data-toggle="modal" style="margin-right: 16px"><span class="glyphicon glyphicon-edit"></span>投递</a>-->
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <div id="check_content">
                <span class="glyphicon glyphicon-unchecked"></span>
                <label class="checkAll">全选</label>
                <span class="check-all-static-btn static-borderNone"><a href="#pushResume" id="push_resume" role="button" data-toggle="modal" style="margin-right: 8px">投递简历</a></span>
            </div>
            <div class="modal small fade" id="pushResume" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">投递简历</h3>
                    </div>
                    <div class="modal-body">
                        <p class="error-text"><i class="icon-warning-sign modal-icon"></i>确定向选中岗位投递简历吗？</p>
                    </div>
                    <div class="modal-footer">
                        <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
                        <asp:Button ID="Button1" runat="server" class="btn btn-private" Text="投递" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
</asp:Content>
