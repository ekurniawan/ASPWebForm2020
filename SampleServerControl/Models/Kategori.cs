using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SampleServerControl.Models
{
    public class Kategori
    {
        public Kategori()
        {
            Berita = new List<Berita>();
        }
        public int id_kat { get; set; }
        public string nama_kat { get; set; }
        public IEnumerable<Berita> Berita { get; set; }

    }
}