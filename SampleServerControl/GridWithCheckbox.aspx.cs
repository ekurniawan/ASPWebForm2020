using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleServerControl
{
    public partial class GridWithCheckbox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvBerita_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                bool isapprove = (bool)DataBinder.Eval(e.Row.DataItem, "isapprove");
                if (isapprove)
                {
                    e.Row.BackColor = System.Drawing.Color.Yellow;
                }
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lblFooter = (Label)e.Row.FindControl("lblFooter");
                lblFooter.Text = "Ini Footer...";
            }
        }
    }
}