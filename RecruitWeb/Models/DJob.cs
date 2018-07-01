using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RecruitWeb.Models
{
    public class DJob
    {
        public static List<Job> getJobsByCompany(int cid)
        {

            string sql = "SELECT * FROM job,company WHERE Jcompany = @cid AND Cid = Jcompany";
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter("@cid",cid)
            };
            DataTable dt = DBHelper.GetDataTable(sql, parm);
            DBHelper.SqlClose();
            List<Job> jobs = new List<Job>();
            foreach(DataRow row in dt.Rows)
            {
                Job job = new Job();
                job.Jid = (int)row.ItemArray[0];
                job.Jname = row.ItemArray[1].ToString();
                job.Jcompany = (int)row.ItemArray[2];
                job.Jneed = row.ItemArray[3].ToString();
                job.Jsalary = row.ItemArray[4].ToString();
                job.Jduty = row.ItemArray[5].ToString();
                job.Jdemand = row.ItemArray[6].ToString();
                job.Jdate = row.ItemArray[7].ToString().Split(' ')[0];
                job.Cname = row.ItemArray[9].ToString();
                jobs.Add(job);
            }
            return jobs;
        }

        public static bool deleteJob(int jid)
        {
            string sql = "DELETE FROM [job] WHERE [Jid] = @Jid";
            SqlParameter[] parm = new SqlParameter[]
                {
                    new SqlParameter("@Jid",jid)
                };
            int line = DBHelper.ExecuteNonQuery(sql, parm);
            DBHelper.SqlClose();
            return line > 0;
        }

        public static bool InsertJob(Job job)
        {
            string sql = "INSERT INTO [job] ([Jname], [Jcompany], [Jneed], [Jsalary], [Jduty], [Jdemand], [Jdate]) VALUES (@Jname, @Jcompany, @Jneed, @Jsalary, @Jduty, @Jdemand, @Jdate)";
            SqlParameter[] parm = new SqlParameter[]
                {
                    new SqlParameter("@Jname",job.Jname),
                    new SqlParameter("@Jcompany",job.Jcompany),
                    new SqlParameter("@Jneed",job.Jneed),
                    new SqlParameter("@Jsalary",job.Jsalary),
                    new SqlParameter("@Jduty",job.Jduty),
                    new SqlParameter("@Jdemand",job.Jdemand),
                    new SqlParameter("@Jdate",DateTime.Now.Date),
                };
            int line = DBHelper.ExecuteNonQuery(sql, parm);
            DBHelper.SqlClose();
            return line > 0;
        }
    }
}