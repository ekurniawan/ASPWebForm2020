using SampleServerControl.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleServerControl
{
    public partial class SampleADO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            KategoriDAL kategoriDAL = new KategoriDAL();
            gvKategori.DataSource = kategoriDAL.GetAll();
            gvKategori.DataBind();
        }
    }
}