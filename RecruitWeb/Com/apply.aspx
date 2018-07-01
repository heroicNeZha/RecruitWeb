<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="apply.aspx.cs" Inherits="RecruitWeb.Com.apply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <ol class="breadcrumb">
        <li><a href="#">公司</a></li>
        <li><a href="#">申请信息</a></li>
    </ol>
    <div class="row">
        <div class="well com-content">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Aid" DataSourceID="SqlDataSource1" 
                BackColor="#DDDDDD" BorderStyle="None" BorderWidth="1px" CellPadding="5" CellSpacing="1"
                GridLines="None" Style="line-height: 22px; width: 100%;" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <RowStyle BackColor="#ffffff" ForeColor="Black" />
                <Columns>
                    <asp:BoundField DataField="Aid" HeaderText="Aid" InsertVisible="False" ReadOnly="True" SortExpression="Aid" />
                    <asp:BoundField DataField="Jname" HeaderText="Jname" SortExpression="Jname" />
                    <asp:BoundField DataField="Rname" HeaderText="Rname" SortExpression="Rname" />
                    <asp:BoundField DataField="Rsex" HeaderText="Rsex" SortExpression="Rsex" />
                    <asp:BoundField DataField="Rtel" HeaderText="Rtel" SortExpression="Rtel" />
                    <asp:BoundField DataField="Redu" HeaderText="Redu" SortExpression="Redu" />
                    <asp:BoundField DataField="Adatetime" HeaderText="Adatetime" SortExpression="Adatetime" />
                    <asp:BoundField DataField="Sid" HeaderText="Sid" SortExpression="Sid" >
                    <FooterStyle CssClass="sid-hidden" />
                    <HeaderStyle CssClass="sid-hidden" />
                    <ItemStyle CssClass="sid-hidden" />
                    </asp:BoundField>
                    <asp:CommandField ShowSelectButton="true" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Apply.Aid, job.Jname, resume.Rname, resume.Rsex, resume.Rtel, resume.Redu, Apply.Adatetime, Apply.Sid FROM Apply INNER JOIN seeker ON Apply.Sid = seeker.Sid INNER JOIN resume ON seeker.Sresume = resume.Rid INNER JOIN job ON Apply.Jid = job.Jid"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
