using RecruitWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitWeb.Com
{
    public partial class employ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                string[] sids = Request.Form["push"].ToString().Split(',');
                foreach (string sid in sids)
                {
                    if (!DNews.SentInterviewNews(Convert.ToInt32(sid), TextBox1.Text))
                    {
                        Response.Write("<script>alert('发送失败!');</script>");
                        return;
                    }

                }
                Response.Write("<script>alert('发送成功!');</script>");
            }
            else
                Response.Write("<script>alert('面试时间不能为空');</script>");
        }
    }
}