using RecruitWeb.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitWeb.Com
{
    public partial class company : System.Web.UI.Page
    {
        Company com;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                com = (Company)Session["user"];
            }
            else
            {
                Response.Write("<script>alert('请先登录!');</script>");
                Response.Redirect("~/", false);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String s1 = Request.Form["company_info"];
            com.Cdetails = s1;
            if (DCompany.UpdateCompany(com))
                Response.Write("<script>alert('修改完成!');</script>");
            else
                Response.Write("<script>alert('修改失败!');</script>");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String s1 = Request.Form["company_address"];
            com.Caddress = s1;
            if(DCompany.UpdateCompany(com))
                Response.Write("<script>alert('修改完成!');</script>");
            else
                Response.Write("<script>alert('修改失败!');</script>");

        }
    }
}