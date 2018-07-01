<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="employ.aspx.cs" Inherits="RecruitWeb.Com.employ" %>
<%@ Import Namespace="RecruitWeb.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <ol class="breadcrumb">
        <li><a href="#">公司</a></li>
        <li><a href="#">录用信息</a></li>
    </ol>
    <div class="row">
        <div class="com-content">
            <div id="display" class="well display-box">
                <%
                    List<Employ> employs = DEmploy.getEmploys(Convert.ToInt32(Session["uid"]));
                    foreach (Employ employ in employs)
                    {
                %>
                <div class="infoBox">
                    <div class="itemBox nameBox">
                        <div class="jobName">
                            <span title="<%:employ.Sname %>" class="job_title"><%:employ.Sname %></span>
                        </div>
                        <div class="commpanyName">
                            <%:employ.Jname %>
                        </div>
                    </div>
                    <div class="itemBox descBox">
                        <div class="jobDesc">
                            <p class="com-content"><%:employ.Stel %></p>
                            <p style="float: left; margin-left: 8px"><%:employ.Smail %></p>

                        </div>
                        <div class="jobDate">
                            <p class="job_date"><%:employ.Edate %></p>
                            <input type='checkbox' name='push' value="<%:employ.Sid %>" id="<%:employ.Sid %>" style="margin-right: 16px">
                            <!--<a href="#editJob" id="edit_job" role="button" data-toggle="modal" style="margin-right: 16px"><span class="glyphicon glyphicon-edit"></span>投递</a>-->
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    <div id="check_content">
        <span class="glyphicon glyphicon-unchecked"></span>
        <label class="checkAll">全选</label>
        <span class="check-all-static-btn static-borderNone"><a href="#pushResume" id="push_resume" role="button" data-toggle="modal" style="margin-right: 8px">发送面试通知</a></span>
    </div>
    <div class="modal small fade" id="pushResume" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">发布面试消息</h3>
            </div>
            <div class="modal-body">
                <p class="error-text"><i class="icon-warning-sign modal-icon"></i>请选择面试时间</p>

            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
                <asp:Button ID="Button1" runat="server" class="btn btn-private" Text="发送" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>
