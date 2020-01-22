using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using SampleServerControl.Models;
using Dapper;

namespace SampleServerControl.DAL
{
    public class ViewBeritaWithKategoriDAL
    {
        public IEnumerable<ViewBeritaWithKategori> GetAll()
        {
            using(SqlConnection conn = new SqlConnection(Helpers.DBHelper.GetConn()))
            {
                string strSql = @"select * from ViewBeritaWithKategori 
                order by judul_berita asc";
                var results = conn.Query<ViewBeritaWithKategori>(strSql);
                return results;
            }
        }
    }
}