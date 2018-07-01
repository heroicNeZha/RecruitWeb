using RecruitWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecruitWeb.See
{
    public partial class job : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string[] jids = Request.Form["push"].ToString().Split(',');
            foreach (string jid in jids)
            {
                if (!DJob.PushResume(Convert.ToInt32(jid),Convert.ToInt32(Session["uid"])))
                {
                    Response.Write("<script>alert('投递失败!');</script>");
                    return;
                }

            }
            Response.Write("<script>alert('投递成功!');</script>");
        }
    }
}