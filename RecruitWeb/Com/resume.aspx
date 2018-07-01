<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="resume.aspx.cs" Inherits="RecruitWeb.Com.resume" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <ol class="breadcrumb">
        <li><a href="#">公司</a></li>
        <li><a href="#">申请信息</a></li>
        <li><a href="#">查看申请</a></li>
    </ol>
    <div class="row">
        <div class="well com-content">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT Apply.Adatetime, Apply.Aid, Apply.Jid, Apply.Sid, job.Jname, resume.Rname, resume.Rsex, resume.Rbirth, resume.Rtel, resume.Remail, resume.Rphoto, resume.Redu, resume.Rworktime, resume.Revaluate, resume.Rproject, resume.Rhonor, resume.Rhobby, resume.Rtech FROM Apply INNER JOIN seeker ON Apply.Sid = seeker.Sid INNER JOIN job ON Apply.Jid = job.Jid INNER JOIN resume ON seeker.Sresume = resume.Rid WHERE (Apply.Aid = @Aid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Aid" QueryStringField="apply" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Aid" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="item-well">
                <table class="item-table">
                    <tr>
                        <td style="height: 41px">姓名:</td>
                        <td style="height: 41px">
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Rname") %>' />
                        </td>
                        <td rowspan="3">照片</td>
                        <td rowspan="4">
                            <div style="float: left; background-image: url(../Images/photo.jpg); width: 120px; height: 120px; background-size: 120px 120px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 41px">性别:</td>
                        <td style="height: 41px">
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Rsex") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 41px">生日: </td>
                        <td style="height: 41px">
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Rbirth") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 40px">手机:</td>
                        <td style="height: 40px">
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Rtel") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>邮箱:</td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Remail") %>' />
                        </td>
                        <td>邮箱:</td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Redu") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>工作经历:</td>
                        <td colspan="3">
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Rworktime") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>自我评价:</td>
                        <td colspan="3">
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Revaluate") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>项目经验: </td>
                        <td colspan="3">
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Rproject") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>教育经历: </td>
                        <td colspan="3">
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Rtech") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>比赛荣誉: </td>
                        <td colspan="3">
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("Rhonor") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>兴趣爱好:</td>
                        <td colspan="3">
                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("Rhobby") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>申报岗位</td>
                        <td>
                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("Jname") %>' />
                        </td>
                        <td>申请时间</td>
                        <td>
                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("Adatetime") %>' />
                        </td>
                    </tr>
        </ItemTemplate>
            </asp:FormView>
            <asp:Button ID="Button1" runat="server" Text="同意" CssClass="btn btn-primary" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="退回" CssClass="btn btn-danger" OnClick="Button2_Click" />
            </div>
        </div>
</asp:Content>
