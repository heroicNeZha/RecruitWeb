using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecruitWeb.Models
{
    public class Seeker
    {
        int Sid;
        string Sname;
        int Sresume;

        public int Sid1
        {
            get
            {
                return Sid;
            }

            set
            {
                Sid = value;
            }
        }

        public string Sname1
        {
            get
            {
                return Sname;
            }

            set
            {
                Sname = value;
            }
        }

        public int Sresume1
        {
            get
            {
                return Sresume;
            }

            set
            {
                Sresume = value;
            }
        }

        public override string ToString()
        {
            return Sname;
        }
    }
}