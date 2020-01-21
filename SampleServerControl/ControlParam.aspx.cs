using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleServerControl
{
    public partial class ControlParam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuatCookie_Click(object sender, EventArgs e)
        {
            HttpCookie myCookie;
            if (Request.Cookies["id_kat"] == null)
            {
                myCookie = new HttpCookie("id_kat", txtKategori.Text);
                myCookie.Expires = DateTime.Now.AddMinutes(5);
                Response.AppendCookie(myCookie);
            }
            else
            {
                myCookie = Request.Cookies["id_kat"];
                myCookie.Value = txtKategori.Text;
                myCookie.Expires = DateTime.Now.AddMinutes(5);
                Response.AppendCookie(myCookie);
            }
        }

        protected void btnSession_Click(object sender, EventArgs e)
        {
            Session["id_kat"] = txtKategori.Text;
        }
    }
}