using SampleServerControl.DAL;
using SampleServerControl.Models;
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

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                var newKategori = new Kategori
                {
                    nama_kat = txtNama.Text
                };
                kategoriDAL.Insert(newKategori);
                lblKet.Text = $"Data Kategori {txtNama.Text} berhasil ditambah";
            }
            catch (Exception ex)
            {
                lblKet.Text = $"Error: {ex.Message}";
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                var updateKategori = new Kategori
                {
                    id_kat = Convert.ToInt32(txtIDKategori.Text),
                    nama_kat = txtNama.Text
                };
                kategoriDAL.Update(updateKategori);
                lblKet.Text = $"Data Kategori berhasil diupdate";
            }
            catch (Exception ex)
            {
                lblKet.Text = $"Error: {ex.Message}";
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                kategoriDAL.Delete(Convert.ToInt32(txtIDKategori.Text));
                lblKet.Text = $"Data Kategori berhasil didelete";
            }
            catch (Exception ex)
            {
                lblKet.Text = $"Error: {ex.Message}";
            }
        }
    }
}