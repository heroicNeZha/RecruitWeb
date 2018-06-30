using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RecruitWeb.Models
{
    public class DCompany
    {
        public static bool Exist(string name)
        {

            string sql = "SELECT COUNT(Cid) FROM company WHERE Cusername = @name";
            SqlParameter[] parm = new SqlParameter[]
            {
                new SqlParameter("@name",name)
            };
            int isExist = Convert.ToInt32(DBHelper.ExecuteScalar(sql, parm));
            DBHelper.SqlClose();
            return isExist > 0;
        }

        public static Company Login(string name, string pwd)
        {
            if (Exist(name))
            {
                string sql = "SELECT * FROM company WHERE Cusername = @name";
                SqlParameter[] parm = new SqlParameter[]
                {
                    new SqlParameter("@name",name)
                };
                DataTable dt = DBHelper.GetDataTable(sql, parm);
                DBHelper.SqlClose();
                if (dt.Rows[0].ItemArray[4].ToString() == pwd)
                {
                    Company company = new Company();
                    company.Cid = (int)dt.Rows[0].ItemArray[0];
                    company.Cname = dt.Rows[0].ItemArray[1].ToString();
                    company.Cdetails = dt.Rows[0].ItemArray[2].ToString();
                    company.Caddress = dt.Rows[0].ItemArray[5].ToString();
                    return company;
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

        public static bool UpdateCompany(Company company)
        {
            string sql = "UPDATE [company] SET [Cname] = @Cname, [Cdetails] = @Cdetails, [Caddress] = @Caddress WHERE [Cid] = @Cid";
            SqlParameter[] parm = new SqlParameter[]
                {
                    new SqlParameter("@Cname",company.Cname),
                    new SqlParameter("@Cdetails",company.Cdetails),
                    new SqlParameter("@Caddress",company.Caddress),
                    new SqlParameter("@Cid",company.Cid)
                };
            int line = DBHelper.ExecuteNonQuery(sql, parm);
            DBHelper.SqlClose();
            return line>0;
        }
    }
}