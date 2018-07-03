using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RecruitWeb.Models
{
    public class DNews
    {
        public static bool SentFailNews(int aid)
        {
            string sql = "INSERT INTO [news] ([Sid], [Ntitle], [Ncontent], [Ntime]) VALUES (@Sid, @Ntitle, @Ncontent, @Ntime)";
            Apply apply = DNews.GetApply(aid);
            string title = apply.Cname+"-"+apply.Jname+"-退回通知";
            string content = "亲爱的" + apply.Sname + "同学:\n\t您在" + apply.Adatetime+"的时候向" + apply.Cname + "公司" 
                + apply.Jname + "职位投递的简历已被退回.";
            SqlParameter[] parm = new SqlParameter[]
                {
                    new SqlParameter("@Sid",apply.Sid),
                    new SqlParameter("@Ntitle",title),
                    new SqlParameter("@Ncontent",content),
                    new SqlParameter("@Ntime",DateTime.Now),
                };
            int line = DBHelper.ExecuteNonQuery(sql, parm);
            DBHelper.SqlClose();

            return line > 0;
        }

        public static bool SentSuccessNews(int aid)
        {
            string sql = "INSERT INTO [news] ([Sid], [Ntitle], [Ncontent], [Ntime]) VALUES (@Sid, @Ntitle, @Ncontent, @Ntime)";
            Apply apply = DNews.GetApply(aid);
            string title = apply.Cname + "-" + apply.Jname + "-提档通知";
            string content = "亲爱的" + apply.Sname + "同学:\n\t您在" + apply.Adatetime + "的时候向" + apply.Cname + "公司"
                + apply.Jname + "职位投递的简历已被提档,请等待面试通知.\n\t祝您面试顺利!";
            SqlParameter[] parm = new SqlParameter[]
                {
                    new SqlParameter("@Sid",apply.Sid),
                    new SqlParameter("@Ntitle",title),
                    new SqlParameter("@Ncontent",content),
                    new SqlParameter("@Ntime",DateTime.Now),
                };
            int line = DBHelper.ExecuteNonQuery(sql, parm);
            DBHelper.SqlClose();
            if (line > 0)
            {
                if (DEmploy.Employ(apply.Jid, apply.Sid))
                    return true;
            }
            return false;
        }

        public static bool SentInterviewNews(int eid,string date)
        {
            string sql = "INSERT INTO [news] ([Sid], [Ntitle], [Ncontent], [Ntime]) VALUES (@Sid, @Ntitle, @Ncontent, @Ntime)";
            Employ employ = DEmploy.getEmploy(eid);
            string title = employ.Jname + "-面试通知";
            string content = "亲爱的" + employ.Sname + "同学:\n\t 请您在 " + date + " 的时候参加 "+ employ.Jname+" 岗位的面试.";
            SqlParameter[] parm = new SqlParameter[]
                {
                    new SqlParameter("@Sid",employ.Sid),
                    new SqlParameter("@Ntitle",title),
                    new SqlParameter("@Ncontent",content),
                    new SqlParameter("@Ntime",DateTime.Now),
                };
            int line = DBHelper.ExecuteNonQuery(sql, parm);
            DBHelper.SqlClose();

            return line > 0;
        }

        public static List<News> getNewsBySeeker(int sid)
        {
            string sql = "SELECT * FROM [news] WHERE ([Sid] = @Sid)";
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter("@Sid",sid)
            };
            DataTable dt = DBHelper.GetDataTable(sql, parm);
            DBHelper.SqlClose();
            List<News> newsList = new List<News>();
            foreach (DataRow row in dt.Rows)
            {
                News news = new News();
                news.Nid = Convert.ToInt32(row.ItemArray[0]);
                news.Ntime = row.ItemArray[4].ToString();
                news.Ntitle = row.ItemArray[2].ToString();
                news.Ncontent = row.ItemArray[3].ToString();
                newsList.Add(news);
            }
            return newsList;

        }

        public static Apply GetApply(int aid)
        {
            string sql = "SELECT Apply.Aid, job.Jname, company.Cname,seeker.Sid, seeker.Sname, Apply.Adatetime,job.Jid FROM job INNER JOIN Apply ON job.Jid = Apply.Jid INNER JOIN seeker ON Apply.Sid = seeker.Sid CROSS JOIN company WHERE (Apply.Aid = @Aid)";
            SqlParameter[] parm = new SqlParameter[]
                {
                    new SqlParameter("@Aid",aid)
                };
            DataTable dt = DBHelper.GetDataTable(sql, parm);
            DBHelper.SqlClose();
            Apply apply = new Apply();
            apply.Aid = Convert.ToInt32(dt.Rows[0].ItemArray[0]);
            apply.Jname = dt.Rows[0].ItemArray[1].ToString();
            apply.Cname = dt.Rows[0].ItemArray[2].ToString();
            apply.Sid = Convert.ToInt32(dt.Rows[0].ItemArray[3]);
            apply.Sname = dt.Rows[0].ItemArray[4].ToString();
            apply.Adatetime = dt.Rows[0].ItemArray[5].ToString();
            apply.Jid = Convert.ToInt32(dt.Rows[0].ItemArray[6]);
            return apply;
        }
    }
}