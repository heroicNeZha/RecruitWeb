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
    }
}