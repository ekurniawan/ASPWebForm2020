using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleServerControl
{
    public partial class SampleListView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private int count = 0;
        protected void lvKategori_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            count++;
            Label labelNo = (Label)e.Item.FindControl("lblNo");
            labelNo.Text = count.ToString();
        }
    }
}