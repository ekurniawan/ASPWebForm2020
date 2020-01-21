using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

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

        protected void sdsBerita_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = "Ditemukan kesalahan !";
                e.ExceptionHandled = true;
            }
        }

        protected void sdsBerita_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            foreach(SqlParameter par in e.Command.Parameters)
            {
                if (par.Value == null)
                {
                    e.Cancel = true;
                    lblError.Text = $"Field {par.ParameterName} harus diisi";
                }
            }
        }
    }
}