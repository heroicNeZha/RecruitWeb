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

            string sql = "SELECT * FROM job WHERE Jcompany = @cid";
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
                job.Jdate = row.ItemArray[7].ToString();
                jobs.Add(job);
            }
            return jobs;
        }
    }
}