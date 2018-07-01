using RecruitWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitWeb.Com
{
    public partial class job : System.Web.UI.Page
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
            Job job = new Job();
            job.Jname = Request.Form["Jname"].ToString();
            job.Jcompany = com.Cid;
            job.Jneed = Request.Form["Jneed"].ToString();
            job.Jsalary = Request.Form["BottomSalary"].ToString() + "k-" + Request.Form["TopSalary"].ToString() + "k";
            job.Jduty = Request.Form["Jduty"].ToString();
            job.Jdemand = Request.Form["Jdemand"].ToString();
            if (DJob.InsertJob(job))
                Response.Write("<script>alert('发布成功!');</script>");
            else
                Response.Write("<script>alert('发布失败!');</script>");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string[] jids = Request.Form["del"].ToString().Split(',');
            foreach (string jid in jids)
            {
                if (!DJob.deleteJob(Convert.ToInt32(jid)))
                {
                    Response.Write("<script>alert('删除失败!');</script>");
                    return;
                }

            }
            Response.Write("<script>alert('删除成功!');</script>");
        }
    }
}