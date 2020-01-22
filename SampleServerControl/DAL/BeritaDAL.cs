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
            using (SqlConnection conn = new SqlConnection(Helpers.DBHelper.GetConn()))
            {
                string strSql = @"delete from Berita where id_berita=@id_berita";
                try
                {
                    conn.Execute(strSql, new { id_berita = id });
                }
                catch (SqlException sqlEx)
                {
                    throw new Exception(sqlEx.Message);
                }
            }
        }

        public IEnumerable<Berita> GetAll()
        {
            using (SqlConnection conn = new SqlConnection(Helpers.DBHelper.GetConn()))
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
            using (SqlConnection conn = new SqlConnection(Helpers.DBHelper.GetConn()))
            {
                string strSql = @"insert into Berita(id_kat,judul_berita,detail_berita,tanggal,isapprove,pics) 
                                  values(@id_kat,@judul_berita,@detail_berita,@tanggal,@isapprove,@pics)";
                var param = new
                {
                    id_kat = obj.id_kat,
                    judul_berita = obj.judul_berita,
                    detail_berita = obj.detail_berita,
                    tanggal = obj.tanggal,
                    isapprove = obj.isapprove,
                    pics = obj.pics
                };
                try
                {
                    conn.Execute(strSql, param);
                }
                catch (SqlException sqlEx)
                {
                    throw new Exception(sqlEx.Message);
                }
            }
        }

        public void Update(Berita obj)
        {
            using (SqlConnection conn = new SqlConnection(Helpers.DBHelper.GetConn()))
            {
                string strSql = @"update Berita set id_kat=@id_kat,judul_berita=@judul_berita,
                detail_berita=@detail_berita,tanggal=@tanggal,isapprove=@isapprove,pics=@pics 
                where id_berita=@id_berita";

                var param = new
                {
                    id_kat = obj.id_kat,
                    judul_berita = obj.judul_berita,
                    detail_berita = obj.detail_berita,
                    tanggal = obj.tanggal,
                    isapprove = obj.isapprove,
                    pics = obj.pics,
                    id_berita = obj.id_berita
                };
                try
                {
                    conn.Execute(strSql, param);
                }
                catch (SqlException sqlEx)
                {
                    throw new Exception(sqlEx.Message);
                }
            }
        }
    }
}