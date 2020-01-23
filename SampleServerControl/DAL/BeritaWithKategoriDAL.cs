using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Dapper;
using SampleServerControl.Models;

namespace SampleServerControl.DAL
{
    public class BeritaWithKategoriDAL
    {
        public IEnumerable<Berita> GetAll()
        {
            using(SqlConnection conn = new SqlConnection(Helpers.DBHelper.GetConn()))
            {
                string strSql = @"SELECT * FROM  dbo.Berita JOIN 
                dbo.Kategori ON dbo.Kategori.id_kat = dbo.Berita.id_kat";

                var results = conn.Query<Berita, Kategori, Berita>(strSql, (b, k) =>
                {
                    b.Kategori = k;
                    return b;
                },splitOn:"id_kat");

                return results;
            }
        }
    }
}