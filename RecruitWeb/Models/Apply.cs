using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecruitWeb.Models
{
    public class Apply
    {
        int aid;
        int sid;
        int jid;
        string jname;
        string cname;
        string sname;
        string adatetime;

        public int Aid
        {
            get
            {
                return aid;
            }

            set
            {
                aid = value;
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

        public string Cname
        {
            get
            {
                return cname;
            }

            set
            {
                cname = value;
            }
        }

        public string Adatetime
        {
            get
            {
                return adatetime;
            }

            set
            {
                adatetime = value;
            }
        }

        public string Sname
        {
            get
            {
                return sname;
            }

            set
            {
                sname = value;
            }
        }

        public int Sid
        {
            get
            {
                return sid;
            }

            set
            {
                sid = value;
            }
        }

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
    }
}