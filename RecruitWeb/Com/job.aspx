<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="job.aspx.cs" Inherits="RecruitWeb.Com.job" %>
<%@ Import Namespace="RecruitWeb.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <ol class="breadcrumb">
        <li><a href="#">首页</a></li>
        <li><a href="#">职位信息</a></li>
    </ol>
    <div class="row">
        <div class="com-content">
            <div id="display" class="well display-box">
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
                        <div class ="jobDesc">
                            <p class="job_saray"><%:job.Jsalary %></p>
                            <%:job.Jneed %>
                        </div>
                        <div class="jobDate">
                            <p class="job_date"><%:job.Jdate %></p>
                            <input type='checkbox' name='del' value="<%:job.Jid %>" id="<%:job.Jid %>">
                            <a href="#editJob" id ="edit_job" role="button" data-toggle="modal" style="margin-right:8px"><span class="glyphicon glyphicon-edit"></span>编辑</a>
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
                <span class="check-all-static-btn"><a href="#deleteJob" id="delete_job" role="button" data-toggle="modal" style="margin-right: 8px">删除职位</a></span>
                <span class="check-all-static-btn static-borderNone"><a href="#submitJob" id="submit_job" role="button" data-toggle="modal" style="margin-right: 8px">发布职位</a></span>
            </div>
        </div>
    </div>
    <div class="modal small fade" id="editJob" tabindex="10" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3>编辑信息</h3>
            </div>
            <div class="modal-body">
                <div>
                    <label style="width: 70px">岗位名称</label>
                    <input type="text" name="eJname" id="eJname" value="" class="input-sm">
                </div>
                <div>
                    <label style="width: 70px">需求</label>
                    <input type="text" name="eJneed" id="eJneed" value="" class="input-sm">
                </div>
                <div>
                    <label style="width: 70px">薪水</label>
                    <input type="text" name="ebottomSalary" id="ebottomSalary" value="" class="input-sm">k-
                <input type="text" name="etopSalary" id="etopSalary" value="" class="input-sm">k
                </div>
                <div>
                    <label style="width: 70px">主要任务</label>
                    <textarea name="eJduty" style="width: 455px;" id="eJduty" class="input-lg" rows="2"></textarea>
                </div>
                <div>
                    <label style="width: 70px">岗位要求</label>
                    <textarea name="eJdemand" style="width: 455px;" id="eJdemand" class="input-lg" rows="2"></textarea>
                </div>
                <asp:Button ID="Button2" runat="server" class="btn btn-primary" Text="完成" Style="float: right; margin-top: 5px;" />
                <br />
            </div>
        </div>
    </div>
    <div class="modal small fade" id="submitJob" tabindex="10" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3>职位信息</h3>
            </div>
            <div class="modal-body">
                <div>
                    <label style="width: 70px">岗位名称</label>
                    <input type="text" name="Jname" id="Jname" value="" class="input-sm">
                </div>
                <div>
                    <label style="width: 70px">需求</label>
                    <input type="text" name="Jneed" id="Jneed" value="" class="input-sm">
                </div>
                <div>
                    <label style="width: 70px">薪水</label>
                    <input type="text" name="bottomSalary" id="bottomSalary" value="" class="input-sm">k-
                <input type="text" name="topSalary" id="topSalary" value="" class="input-sm">k
                </div>
                <div>
                    <label style="width: 70px">主要任务</label>
                    <textarea name="Jduty" style="width: 455px;" id="Jduty" class="input-lg" rows="2"></textarea>
                </div>
                <div>
                    <label style="width: 70px">岗位要求</label>
                    <textarea name="Jdemand" style="width: 455px;" id="Jdemand" class="input-lg" rows="2"></textarea>
                </div>
                <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="完成" Style="float: right; margin-top: 5px;" OnClick="Button1_Click" />
                <br />
            </div>
        </div>
    </div>
    <div class="modal small fade" id="deleteJob" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">删除岗位</h3>
            </div>
            <div class="modal-body">
                <p class="error-text"><i class="icon-warning-sign modal-icon"></i>确定删除选中岗位吗？</p>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
                <asp:Button ID="Button3" runat="server" class="btn btn-danger" Text="删除" OnClick="Button3_Click" />
            </div>
        </div>
    </div>
</asp:Content>
