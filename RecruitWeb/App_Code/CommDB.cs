using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RecruitWeb.App_Code
{
    public class CommDB
    {
        public CommDB(){}

        public Boolean ExecuteNonQuery(string sql)
        {
            string mystr = ConfigurationManager.AppSettings["DefaultConnection"];
            SqlConnection myconn = new SqlConnection();
            myconn.ConnectionString = mystr;
            myconn.Open();
            SqlCommand mycmd = new SqlCommand(sql, myconn);
            try
            {
                mycmd.ExecuteNonQuery();
                myconn.Close();
            }
            catch
            {
                myconn.Close();
                return false;
            }
            return true;
        }

        public DataSet ExecuteQuery(string sql, string tname)
        {
            string mystr = ConfigurationManager.AppSettings["DefaultConnection"];
            SqlConnection myconn = new SqlConnection();
            myconn.ConnectionString = mystr;
            myconn.Open();
            SqlDataAdapter myda = new SqlDataAdapter(sql, myconn);
            DataSet myds = new DataSet();
            myda.Fill(myds, tname);
            myconn.Close();
            return myds;
        }
    }
}