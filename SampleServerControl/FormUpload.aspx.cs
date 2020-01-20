using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleServerControl
{
    public partial class FormUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        bool cekTipeFile(string filename)
        {
            string eks = Path.GetExtension(filename);
            switch (eks)
            {
                case ".gif":
                case ".jpg":
                case ".png":
                case ".jpeg":
                    return true;
                default:
                    return false;
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fpGambar.HasFile)
            {
                if (cekTipeFile(fpGambar.FileName))
                {
                    var newFilename = Guid.NewGuid() + Path.GetExtension(fpGambar.FileName);
                    string strUpload = MapPath(Path.Combine("~/Images/" + newFilename));
                    fpGambar.SaveAs(strUpload);
                    lblKet.Text = "Upload File berhasil !";
                }
            }
        }

        protected void Page_PreRender()
        {
            var strUpload = MapPath("~/Images/");
            DirectoryInfo dir = new DirectoryInfo(strUpload);
            dlPhoto.DataSource = dir.GetFiles();
            dlPhoto.DataBind();
        }
    }
}