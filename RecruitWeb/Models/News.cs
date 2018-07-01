using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecruitWeb.Models
{
    public class News
    {
        int nid;
        int sid;
        string ntitle;
        string ncontent;
        string ntime;

        public string Ntime
        {
            get
            {
                return ntime;
            }

            set
            {
                ntime = value;
            }
        }

        public string Ncontent
        {
            get
            {
                return ncontent;
            }

            set
            {
                ncontent = value;
            }
        }

        public string Ntitle
        {
            get
            {
                return ntitle;
            }

            set
            {
                ntitle = value;
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

        public int Nid
        {
            get
            {
                return nid;
            }

            set
            {
                nid = value;
            }
        }
    }
}