using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecruitWeb.Models
{
    public class Company
    {
        int Cid;
        string Cname;
        string Cdetails;
        string Caddress;

        public int Cid1
        {
            get
            {
                return Cid;
            }

            set
            {
                Cid = value;
            }
        }

        public string Cname1
        {
            get
            {
                return Cname;
            }

            set
            {
                Cname = value;
            }
        }

        public string Cdetails1
        {
            get
            {
                return Cdetails;
            }

            set
            {
                Cdetails = value;
            }
        }

        public string Caddress1
        {
            get
            {
                return Caddress;
            }

            set
            {
                Caddress = value;
            }
        }

        public override string ToString()
        {
            return Cname;
        }
    }
}