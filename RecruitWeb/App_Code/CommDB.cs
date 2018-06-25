using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RecruitWeb
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

        public int Login(string sql, ref string id, ref string name)
        {
            int i = 0;
            string mystr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
            SqlConnection myconn = new SqlConnection();
            myconn.ConnectionString = mystr;
            myconn.Open();
            SqlCommand mycmd = new SqlCommand(sql, myconn);
            SqlDataReader myreader = mycmd.ExecuteReader();
            while (myreader.Read())  //循环读取信息
            {
                id = myreader[0].ToString();
                name = myreader[1].ToString();
                i++;
            }
            myconn.Close();
            return i;
        }
    }
}