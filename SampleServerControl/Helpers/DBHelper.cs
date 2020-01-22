using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace SampleServerControl.Helpers
{
    public class DBHelper
    {
        public static string GetConn()
        {
            return ConfigurationManager
                .ConnectionStrings["MyConnectionString"].ConnectionString;
        }
    }
}