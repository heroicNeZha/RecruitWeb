using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecruitWeb.Models
{
    public class Seeker
    {
        int sid;
        string sname;
        int sresume;

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

        public int Sresume
        {
            get
            {
                return sresume;
            }

            set
            {
                sresume = value;
            }
        }

        public override string ToString()
        {
            return Sname;
        }
    }
}