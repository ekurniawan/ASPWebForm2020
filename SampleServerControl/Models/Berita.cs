﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SampleServerControl.Models
{
    public class Berita
    {
        public int id_berita { get; set; }
        public int id_kat { get; set; }
        public string judul_berita { get; set; }
        public string detail_berita { get; set; }
        public DateTime tanggal { get; set; }
        public bool isapprove { get; set; }
        public string pics { get; set; }

        public Kategori Kategori { get; set; }

    }
}