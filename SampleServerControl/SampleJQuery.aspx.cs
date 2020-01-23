using Newtonsoft.Json;
using SampleServerControl.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleServerControl
{
    public partial class SampleJQuery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static string GetData(string nama)
        {
            var mhs = new Mahasiswa
            {
                Nim = "75687656",
                Nama = nama
            };
            return JsonConvert.SerializeObject(mhs);
        }
    }
}