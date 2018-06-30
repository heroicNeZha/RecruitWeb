using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecruitWeb.Models
{
    public class Company
    {
        int cid;
        string cname;
        string cdetails;
        string caddress;

        public int Cid
        {
            get
            {
                return cid;
            }

            set
            {
                cid = value;
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

        public string Cdetails
        {
            get
            {
                return cdetails;
            }

            set
            {
                cdetails = value;
            }
        }

        public string Caddress
        {
            get
            {
                return caddress;
            }

            set
            {
                caddress = value;
            }
        }

        public override string ToString()
        {
            return Cname;
        }
    }
}