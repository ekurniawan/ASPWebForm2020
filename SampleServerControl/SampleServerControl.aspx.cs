using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleServerControl
{
    public partial class SampleServerControl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            var bil = Convert.ToInt32(lblCounter.Text);
            bil += 1;
            lblCounter.Text = bil.ToString();
        }
    }
}