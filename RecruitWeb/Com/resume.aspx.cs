using RecruitWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitWeb.Com
{
    public partial class resume : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Write("<script>alert('请先登录!');</script>");
                Response.Redirect("~/", false);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int aid = Convert.ToInt32(Request.QueryString["apply"]);

            if (DNews.SentSuccessNews(aid))
            {
                Response.Redirect("~/Com/apply.aspx",false);
                Response.Write("<script>alert('提档成功!');</script>");
            }
            else
            {
                Response.Write("<script>alert('提档失败!');</script>");
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int aid = Convert.ToInt32(Request.QueryString["apply"]);
            if (DNews.SentFailNews(aid))
            {
                Response.Write("<script>alert('退回成功!');</script>");
                Response.Redirect("~/Com/apply.aspx", false);
            }
            else
            {
                Response.Write("<script>alert('退回失败!');</script>");
            }
        }
    }
}