using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleServerControl
{
    public partial class ManualEksekusi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            sdsKategori.InsertParameters[0].DefaultValue = txtNama.Text;
            try
            {
                sdsKategori.Insert();
                lblKet.Text = "Berhasil menambah data kategori";
            }
            catch (Exception ex)
            {
                lblKet.Text = $"Error: {ex.Message}";
            }
        }
    }
}