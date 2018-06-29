<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="company.aspx.cs" Inherits="RecruitWeb.Com.company" %>

<%@ Import Namespace="RecruitWeb.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div style="margin: 30px 30px 30px 30px; padding: 30px;">
            <div style="float: left; background-image: url(../Images/default.png); width: 120px; height: 120px; background-size: 120px 120px;">
            </div>

            <% 
                Company company = new Company();
                if (Session["user"] != null)
                    company = (Company) Session["user"];
                else
                    Response.Redirect("~/", false); %>
            <div style="margin-left: 13%">
                <h1><%:company.Cname1 %></h1>
            </div>
            <div style="margin-left: 13%">
                <span>50-100人</span>
            </div>
        </div>
        <div style="margin: 0px 30px 0px 30px; padding: 30px;">
            <p class="lead" style="margin-bottom: 0px">公司地址</p>
            <hr />
            <p><%:company.Caddress1 %></p>
            <a class="btn btn-primary" href="#editAddress" role="button" data-toggle="modal"><span style="color: #F7F8F7"><i class="icon-plus"></i>编辑</span></a>
        </div>
        <div style="margin: 0px 30px 0px 30px; padding: 30px;">
            <p class="lead" style="margin-bottom: 0px">公司信息</p>
            <hr />
            <p ><%:company.Cdetails1 %></p>
            <a href="#editDetails" class="btn btn-primary" role="button" data-toggle="modal"><span style="color: #F7F8F7"><i class="icon-plus"></i>编辑</span></a>
        </div>
    </div>
    <div class="modal small fade" id="editAddress" tabindex="10" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3>编辑信息</h3>
            </div>
            <div class="modal-body">
                <label>公司地址</label>
                <textarea name="company_info" style="width: 455px;" id="company_address" class="input-xlarge" rows="2"><%:company.Caddress1 %></textarea>

                <br />
            </div>
        </div>
    </div>
    <div class="modal small fade" id="editDetails" tabindex="10" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3>编辑信息</h3>
            </div>
            <div class="modal-body">
                <label>公司信息</label>
                <textarea name="company_info" style="width: 455px;" id="company_details" class="input-xlarge" rows="5"><%:company.Cdetails1 %></textarea>
                <br />
            </div>
        </div>
    </div>
</asp:Content>
