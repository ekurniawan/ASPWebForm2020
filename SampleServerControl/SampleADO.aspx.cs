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
        private KategoriDAL kategoriDAL;
        public SampleADO()
        {
            kategoriDAL = new KategoriDAL();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            gvKategori.DataSource = kategoriDAL.GetAll();
            gvKategori.DataBind();
        }

        protected void btnGetID_Click(object sender, EventArgs e)
        {
            var kategori = kategoriDAL.GetById(Convert.ToInt32(txtKategori.Text));
            txtNamaKategori.Text = kategori.nama_kat;
        }
    }
}