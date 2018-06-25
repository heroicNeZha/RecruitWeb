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
        CommDB mydb = new CommDB();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string mysql;
                int i;
                switch (identity.SelectedIndex)
                {
                    case 0:
                        string Cid = "";
                        string Cname = "";
                        mysql = "SELECT Cid,Cname FROM company WHERE Cusername = '" + username.Text + "' AND Cpassword = '" + Password.Text + "'";
                        i = mydb.Login(mysql,ref Cid,ref Cname);
                        if (i > 0)
                        {
                            Session["Cid"] = Cid;
                            Session["Cname"] = Cname;
                            Session["userType"] = "0";
                            Server.Transfer("~/Company/welcome.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('对不起!有错误请查实!');</script>");
                        }
                        break;
                    case 1:
                        string Sid = "";
                        string Sname = "";
                        mysql = "SELECT Sid,Sname FROM Scompany WHERE Susername = '" + username.Text + "' AND Spassword = '" + Password.Text + "'";
                        i = mydb.Login(mysql, ref Sid, ref Sname);
                        if (i > 0)
                        {
                            Session["Sid"] = Sid;
                            Session["Sname"] = Sname;
                            Session["userType"] = "1";
                            Server.Transfer("~/Seeker/About.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('对不起!有错误请查实!');</script>");
                        }
                        break;
                }
            }
        }
    }
}