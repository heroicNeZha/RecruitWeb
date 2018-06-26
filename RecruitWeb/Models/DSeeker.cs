using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RecruitWeb.Models
{
    public class DSeeker
    {
        public static bool Exist(string name)
        {

            string sql = "SELECT COUNT(Sid) FROM seeker WHERE Susername = @name";
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter("@name",name)
            };
            int isExist = Convert.ToInt32(DBHelper.ExecuteScalar(sql, parm));
            DBHelper.SqlClose();
            return isExist > 0 ? true : false;
        }

        public static Seeker Login(string name, string pwd)
        {
            if (Exist(name))
            {
                string sql = "SELECT * FROM seeker WHERE Susername = @name";
                SqlParameter[] parm = new SqlParameter[]
                {
                    new SqlParameter("@name",name)
                };
                DataTable dt = DBHelper.GetDataTable(sql, parm);
                DBHelper.SqlClose();
                if (dt.Rows[0].ItemArray[4].ToString() == pwd)
                {
                    Seeker seeker = new Seeker();
                    seeker.Sid1 = (int)dt.Rows[0].ItemArray[0];
                    seeker.Sname1 = dt.Rows[0].ItemArray[1].ToString();
                    return seeker;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }
    }
}