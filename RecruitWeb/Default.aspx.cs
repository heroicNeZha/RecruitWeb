using RecruitWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitWeb
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["role"] = null;
            Session["user"] = null;
            Session["uid"] = null;
            Session["rid"] = null;
        }

        protected void Login(object sender, EventArgs e)
        {
            if (IsValid)
            {
                switch (identity.SelectedIndex)
                {
                    case 0:
                        if (DCompany.Exist(username.Text))
                        {
                            Company company = DCompany.Login(username.Text, Password.Text);
                            if (company != null)
                            {
                                Session["role"] = "company";
                                Session["user"] = company;
                                Session["uid"] = company.Cid;
                                Response.Write("<script>alert('登录成功!');</script>");
                                Server.Transfer("~/Com/welcome.aspx");
                            }
                            else
                            {
                                Response.Write("<script>alert('密码不正确!');</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('用户名不存在!');</script>");
                        }
                        break;
                    case 1:
                        if (DSeeker.Exist(username.Text))
                        {
                            Seeker seeker = DSeeker.Login(username.Text, Password.Text);
                            if (seeker != null)
                            {
                                Session["role"] = "seeker";
                                Session["user"] = seeker;
                                Session["uid"] = seeker.Sid;
                                Session["rid"] = seeker.Sresume;
                                Response.Write("<script>alert('登录成功!');</script>");
                                Server.Transfer("~/See/welcome.aspx");
                            }
                            else
                            {
                                Response.Write("<script>alert('密码不正确!');</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('用户名不存在!');</script>");
                        }
                        break;
                }
            }
        }
    }
}