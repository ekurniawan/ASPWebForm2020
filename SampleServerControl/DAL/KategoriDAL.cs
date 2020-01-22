using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using SampleServerControl.Models;

namespace SampleServerControl.DAL
{
    public class KategoriDAL
    {
        public IEnumerable<Kategori> GetAll()
        {
            using(SqlConnection conn = new SqlConnection(Helpers.DBHelper.GetConn()))
            {
                List<Kategori> lstKategori = new List<Kategori>();

                string strSql = @"select * from Kategori 
                                  order by nama_kat asc";
                SqlCommand cmd = new SqlCommand(strSql, conn);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lstKategori.Add(
                            new Kategori
                            {
                                id_kat = Convert.ToInt32(dr["id_kat"]),
                                nama_kat = dr["nama_kat"].ToString()
                            });
                    }    
                }
                dr.Close();
                cmd.Dispose();
                conn.Close();

                return lstKategori;
            }
        }

        public Kategori GetById(int id_kat)
        {
            using (SqlConnection conn = new SqlConnection(Helpers.DBHelper.GetConn()))
            {
                Kategori kategori = new Kategori();
                string strSql = @"select * from Kategori
                                  where id_kat=@id_kat";
                SqlCommand cmd = new SqlCommand(strSql, conn);
                cmd.Parameters.AddWithValue("@id_kat", id_kat);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        kategori.id_kat = Convert.ToInt32(dr["id_kat"]);
                        kategori.nama_kat = dr["nama_kat"].ToString();
                    }
                }
                dr.Close();
                cmd.Dispose();
                conn.Close();

                return kategori;
            }
        }

        public void Insert(Kategori kategori)
        {
            using(SqlConnection conn = new SqlConnection(Helpers.DBHelper.GetConn()))
            {
                string strSql = @"insert into Kategori(nama_kat) values(@nama_kat)";
                SqlCommand cmd = new SqlCommand(strSql, conn);
                cmd.Parameters.AddWithValue("@nama_kat", kategori.nama_kat);
                try
                {
                    conn.Open();
                    int result = cmd.ExecuteNonQuery();
                    if (result != 1)
                        throw new Exception("Insert Kategori gagal");
                }
                catch (SqlException sqlEx)
                {
                    throw new Exception($"Number: {sqlEx.Number}, Error:{sqlEx.Message}");
                }
                catch(Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                finally
                {
                    cmd.Dispose();
                    conn.Close();
                }
            }
        }
    }
}