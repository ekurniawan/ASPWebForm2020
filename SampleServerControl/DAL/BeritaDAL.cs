using SampleServerControl.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Dapper;

namespace SampleServerControl.DAL
{
    public class BeritaDAL : ICrud<Berita>
    {
        public void Delete(string id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Berita> GetAll()
        {
            using(SqlConnection conn = new SqlConnection(Helpers.DBHelper.GetConn()))
            {
                string strSql = @"select * from Berita order by judul_berita asc";
                var results = conn.Query<Berita>(strSql);
                return results;
            }
        }

        public Berita GetByID(string id)
        {
            using (SqlConnection conn = new SqlConnection(Helpers.DBHelper.GetConn()))
            {
                string strSql = @"select * from Berita where id_berita=@id_berita";
                var param = new { id_berita = id };
                var result = conn.QuerySingle<Berita>(strSql, param);
                return result;
            }
        }

        public void Insert(Berita obj)
        {
            throw new NotImplementedException();
        }

        public void Update(Berita obj)
        {
            throw new NotImplementedException();
        }
    }
}