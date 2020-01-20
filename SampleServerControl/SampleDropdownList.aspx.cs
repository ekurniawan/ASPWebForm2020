using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleServerControl
{
    public partial class SampleDropdownList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> lstLanguage = new List<string>
            {
                "C++",
                "Java",
                "C#",
                "VB",
                "Python"
            };
            //ddLanguage.DataSource = lstLanguage;
            //ddLanguage.DataBind();
        }
    }
}