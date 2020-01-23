using SampleServerControl.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleServerControl
{
    public partial class SampleDapper : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAmbilBerita_Click(object sender, EventArgs e)
        {
            BeritaWithKategoriDAL beritaWithKategoriDAL = new BeritaWithKategoriDAL();
            var results = beritaWithKategoriDAL.GetAll();
            string strResult=string.Empty;
            foreach(var result in results) {
                strResult += $"Judul {result.judul_berita} dan Nama Kategori {result.Kategori.nama_kat} <br/>";
            }
            lblKet.Text = strResult;
        }

        protected void btnKategori_Click(object sender, EventArgs e)
        {
            KategoriDAL kategoriDAL = new KategoriDAL();
            var kategori = kategoriDAL.GetKategoriWithBerita(1);
            lblKategori.Text += $"Kategori: {kategori.nama_kat} <br/>";
            foreach(var b in kategori.Berita)
            {
                lblKategori.Text += $"Judul Berita: {b.judul_berita}";
            }
        }
    }
}