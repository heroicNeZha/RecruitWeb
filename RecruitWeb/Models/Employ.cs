using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecruitWeb.Models
{
    public class Employ
    {
        int eid;
        int jid;
        int sid;
        int aid;
        string edate;
        string jname;
        string sname;
        string stel;
        string smail;

        public int Eid
        {
            get
            {
                return eid;
            }

            set
            {
                eid = value;
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

        public string Edate
        {
            get
            {
                return edate;
            }

            set
            {
                edate = value;
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

        public string Smail
        {
            get
            {
                return smail;
            }

            set
            {
                smail = value;
            }
        }

        public string Stel
        {
            get
            {
                return stel;
            }

            set
            {
                stel = value;
            }
        }
    }
}