using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleServerControl
{
    public partial class SampleAjax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblKet.Text = DateTime.Now.ToString();
            lblUpdatePanel.Text = DateTime.Now.ToString();
        }
    }
}