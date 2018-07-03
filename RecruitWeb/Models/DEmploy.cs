using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RecruitWeb.Models
{
    public class DEmploy
    {
        public static bool Employ(int jid,int sid)
        {
            string sql = "INSERT INTO [RecruitDB].[dbo].[employ]([Jid],[Sid],[Edate]) VALUES (@Jid, @Sid, @Edate)";
            SqlParameter[] parm = new SqlParameter[]
                {
                    new SqlParameter("@Jid",jid),
                    new SqlParameter("@Sid",sid),
                    new SqlParameter("@Edate",DateTime.Now),
                };
            int line = DBHelper.ExecuteNonQuery(sql, parm);
            DBHelper.SqlClose();
            return line > 0;
        }

        public static List<Employ> getEmploys(int cid)
        {
            string sql = "SELECT resume.Rname, resume.Remail, resume.Rtel, employ.Eid, employ.Jid, employ.Sid, employ.Edate, job.Jname, job.Jcompany FROM resume INNER JOIN job INNER JOIN employ ON job.Jid = employ.Jid INNER JOIN seeker ON employ.Sid = seeker.Sid ON resume.Rid = seeker.Sresume WHERE(job.Jcompany = @Jcompany)";
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter("@Jcompany",cid)
            };
            DataTable dt = DBHelper.GetDataTable(sql, parm);
            DBHelper.SqlClose();
            List<Employ> employs = new List<Employ>();
            foreach (DataRow row in dt.Rows)
            {
                Employ employ = new Employ();
                employ.Eid = (int)row.ItemArray[3];
                employ.Jid = (int)row.ItemArray[4];
                employ.Sid = (int)row.ItemArray[5];
                employ.Edate = row.ItemArray[6].ToString();
                employ.Jname = row.ItemArray[7].ToString();
                employ.Sname = row.ItemArray[0].ToString();
                employ.Stel = row.ItemArray[2].ToString();
                employ.Smail = row.ItemArray[1].ToString();
                employs.Add(employ);
            }
            return employs;
        }

        public static Employ getEmploy(int eid)
        {
            string sql = "SELECT resume.Rname, resume.Remail, resume.Rtel, employ.Eid, employ.Jid, employ.Sid, employ.Edate, job.Jname, job.Jcompany FROM resume INNER JOIN job INNER JOIN employ ON job.Jid = employ.Jid INNER JOIN seeker ON employ.Sid = seeker.Sid ON resume.Rid = seeker.Sresume WHERE(Eid = @Eid)";
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter("@Eid",eid)
            };
            DataTable dt = DBHelper.GetDataTable(sql, parm);
            DBHelper.SqlClose();
            foreach (DataRow row in dt.Rows)
            {
                Employ employ = new Employ();
                employ.Eid = (int)row.ItemArray[3];
                employ.Jid = (int)row.ItemArray[4];
                employ.Sid = (int)row.ItemArray[5];
                employ.Edate = row.ItemArray[6].ToString();
                employ.Jname = row.ItemArray[7].ToString();
                employ.Sname = row.ItemArray[0].ToString();
                employ.Stel = row.ItemArray[2].ToString();
                employ.Smail = row.ItemArray[1].ToString();
                return employ;
            }
            return null;
        }
    }
}