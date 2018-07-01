<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="resume.aspx.cs" Inherits="RecruitWeb.See.resume" %>

<%@ Import Namespace="RecruitWeb.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        Seeker seeker = new Seeker();
        if (Session["user"] != null)
        {
            seeker = (Seeker)Session["user"];
            Session["rid"] = seeker.Sresume;
            }
    else
    {
        Response.Redirect("~/", false);
    }
    %>
    <ol class="breadcrumb">
        <li><a href="#">求职者</a></li>
        <li><a href="#">简历信息</a></li>
    </ol>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [resume] WHERE [Rid] = @Rid" InsertCommand="INSERT INTO [resume] ([Rname], [Rsex], [Rbirth], [Rtel], [Rphoto], [Remail], [Redu], [Rworktime], [Revaluate], [Rproject], [Rtech], [Rhonor], [Rhobby]) VALUES (@Rname, @Rsex, @Rbirth, @Rtel, @Rphoto, @Remail, @Redu, @Rworktime, @Revaluate, @Rproject, @Rtech, @Rhonor, @Rhobby)" SelectCommand="SELECT * FROM [resume] WHERE ([Rid] = @Rid)" UpdateCommand="UPDATE [resume] SET [Rname] = @Rname, [Rsex] = @Rsex, [Rbirth] = @Rbirth, [Rtel] = @Rtel, [Rphoto] = @Rphoto, [Remail] = @Remail, [Redu] = @Redu, [Rworktime] = @Rworktime, [Revaluate] = @Revaluate, [Rproject] = @Rproject, [Rtech] = @Rtech, [Rhonor] = @Rhonor, [Rhobby] = @Rhobby WHERE [Rid] = @Rid">
        <DeleteParameters>
            <asp:Parameter Name="Rid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Rname" Type="String" />
            <asp:Parameter Name="Rsex" Type="String" />
            <asp:Parameter DbType="Date" Name="Rbirth" />
            <asp:Parameter Name="Rtel" Type="String" />
            <asp:Parameter Name="Rphoto" Type="String" />
            <asp:Parameter Name="Remail" Type="String" />
            <asp:Parameter Name="Redu" Type="String" />
            <asp:Parameter Name="Rworktime" Type="String" />
            <asp:Parameter Name="Revaluate" Type="String" />
            <asp:Parameter Name="Rproject" Type="String" />
            <asp:Parameter Name="Rtech" Type="String" />
            <asp:Parameter Name="Rhonor" Type="String" />
            <asp:Parameter Name="Rhobby" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="Rid" SessionField="rid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Rname" Type="String" />
            <asp:Parameter Name="Rsex" Type="String" />
            <asp:Parameter DbType="Date" Name="Rbirth" />
            <asp:Parameter Name="Rtel" Type="String" />
            <asp:Parameter Name="Rphoto" Type="String" />
            <asp:Parameter Name="Remail" Type="String" />
            <asp:Parameter Name="Redu" Type="String" />
            <asp:Parameter Name="Rworktime" Type="String" />
            <asp:Parameter Name="Revaluate" Type="String" />
            <asp:Parameter Name="Rproject" Type="String" />
            <asp:Parameter Name="Rtech" Type="String" />
            <asp:Parameter Name="Rhonor" Type="String" />
            <asp:Parameter Name="Rhobby" Type="String" />
            <asp:Parameter Name="Rid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="well">
        <div class="resume-well">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="Rid" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                <div class="input-group">
                    <span class="input-group-addon">姓名</span>
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" Text='<%# Bind("Rname") %>' />
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">性别</span>
                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" Text='<%# Bind("Rsex") %>' />
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">生日</span>
                    <asp:TextBox ID="RbirthTextBox" runat="server" class="form-control" Text='<%# Bind("Rbirth") %>' />
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">手机</span>
                    <asp:TextBox ID="RtelTextBox" runat="server" class="form-control" Text='<%# Bind("Rtel") %>' />
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">邮件</span>
                    <asp:TextBox ID="RemailTextBox" runat="server" class="form-control" Text='<%# Bind("Remail") %>' />
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">学校</span>
                    <asp:TextBox ID="ReduTextBox" runat="server" class="form-control" Text='<%# Bind("Redu") %>' />
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">工作经历</span>
                    <asp:TextBox ID="RworktimeTextBox" runat="server" class="form-control" Text='<%# Bind("Rworktime") %>' />
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">自我评价</span>
                    <asp:TextBox ID="RevaluateTextBox" runat="server" class="form-control" Text='<%# Bind("Revaluate") %>' />
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">项目经验</span>
                    <asp:TextBox ID="RprojectTextBox" runat="server" class="form-control" Text='<%# Bind("Rproject") %>' />
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">教育经历</span>
                    <asp:TextBox ID="RtechTextBox" runat="server" class="form-control" Text='<%# Bind("Rtech") %>' />
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">比赛荣誉</span>
                    <asp:TextBox ID="RhonorTextBox" runat="server" class="form-control" Text='<%# Bind("Rhonor") %>' Rows="4" />
                </div>
                <br />
                <div class="input-group">
                    <span class="input-group-addon">兴趣爱好</span>
                    <asp:TextBox ID="RhobbyTextBox" runat="server" class="form-control" Text='<%# Bind("Rhobby") %>' />
                </div>
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <ItemTemplate>
                <div class="item-well">
                <table class="item-table">
                    <tr>
                        <td>姓名:</td>
                        <td>
                            <asp:Label ID="RnameLabel" runat="server" Text='<%# Bind("Rname") %>' />
                        </td>
                        <td rowspan="3">照片</td>
                        <td rowspan="3">
                            <div style="float: left; background-image: url(../Images/photo.jpg); width: 120px; height: 120px; background-size: 120px 120px;">
                        </td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td>
                            <asp:Label ID="RsexLabel" runat="server" Text='<%# Bind("Rsex") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>生日: </td>
                        <td>
                            <asp:Label ID="RbirthLabel" runat="server" Text='<%# Bind("Rbirth") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>手机:</td>
                        <td>
                            <asp:Label ID="RtelLabel" runat="server" Text='<%# Bind("Rtel") %>' />
                        </td>
                        <td>邮箱:</td>
                        <td>
                            <asp:Label ID="RemailLabel" runat="server" Text='<%# Bind("Remail") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>学校:</td>
                        <td colspan="3">
                            <asp:Label ID="ReduLabel" runat="server" Text='<%# Bind("Redu") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>工作经历:</td>
                        <td colspan="3">
                            <asp:Label ID="RworktimeLabel" runat="server" Text='<%# Bind("Rworktime") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>自我评价:</td>
                        <td colspan="3">
                            <asp:Label ID="RevaluateLabel" runat="server" Text='<%# Bind("Revaluate") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>项目经验: </td>
                        <td colspan="3">
                            <asp:Label ID="RprojectLabel" runat="server" Text='<%# Bind("Rproject") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>教育经历: </td>
                        <td colspan="3">
                            <asp:Label ID="RtechLabel" runat="server" Text='<%# Bind("Rtech") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>比赛荣誉: </td>
                        <td colspan="3">
                            <asp:Label ID="RhonorLabel" runat="server" Text='<%# Bind("Rhonor") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>兴趣爱好:</td>
                        <td colspan="3">
                            <asp:Label ID="RhobbyLabel" runat="server" Text='<%# Bind("Rhobby") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑" />
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                </div>
            </ItemTemplate>
        </asp:FormView>
        </div>
    </div>
</asp:Content>
