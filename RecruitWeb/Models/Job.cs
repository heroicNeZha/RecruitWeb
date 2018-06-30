using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecruitWeb.Models
{
    public class Job
    {
        int jid;
        string jname;
        int jcompany;
        string jneed;
        string jsalary;
        string jduty;
        string jdemand;
        string jdate;

        public int Jid
        {
            get
            {
                return jid;
            }

            set
            {
                jid = value;
            }
        }

        public string Jname
        {
            get
            {
                return jname;
            }

            set
            {
                jname = value;
            }
        }

        public int Jcompany
        {
            get
            {
                return jcompany;
            }

            set
            {
                jcompany = value;
            }
        }

        public string Jneed
        {
            get
            {
                return jneed;
            }

            set
            {
                jneed = value;
            }
        }

        public string Jsalary
        {
            get
            {
                return jsalary;
            }

            set
            {
                jsalary = value;
            }
        }

        public string Jduty
        {
            get
            {
                return jduty;
            }

            set
            {
                jduty = value;
            }
        }

        public string Jdemand
        {
            get
            {
                return jdemand;
            }

            set
            {
                jdemand = value;
            }
        }

        public string Jdate
        {
            get
            {
                return jdate;
            }
            
            set
            {
                jdate = value;
            }
        }
    }
}