using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace WinBDDCursos
{
    class Notas
    {
        public string COD_ALU;
        public string COD_CUR;
        public int NOTA1;
        public int NOTA2;
        public int NOTA3;
        public int MEDIA;
        public SqlConnection sqlconexion;
        public DataSet datasetBDD;
        public SqlCommand sqlSelectComandoNotas;
        public SqlCommand sqlInsertComandoNotas;
        public SqlCommand sqlUpdateComandoNotas;
        public SqlCommand sqlDeleteComandoNotas;
        public SqlDataAdapter adaptadorNotas;
        public DataTable tablaNotas { get; set; }
        int posicion;

        public Notas(SqlConnection sqlconexion1, DataSet ds1)
        {
            posicion = 0;
            adaptadorNotas = new SqlDataAdapter();
            sqlconexion = sqlconexion1;
            datasetBDD = ds1;

            sqlSelectComandoNotas = new SqlCommand();
            sqlSelectComandoNotas.Connection = sqlconexion;
            sqlSelectComandoNotas.CommandText = "SELECT COD_ALU, COD_CUR, NOTA1, NOTA2, NOTA3, MEDIA FROM NOTAS";
            adaptadorNotas.SelectCommand = sqlSelectComandoNotas;

            sqlInsertComandoNotas = new SqlCommand();
            sqlInsertComandoNotas.Connection = sqlconexion;
            sqlInsertComandoNotas.CommandText = "INSERT INTO NOTAS (COD_ALU, COD_CUR, NOTA1, NOTA2, NOTA3, MEDIA) VALUES ";
            sqlInsertComandoNotas.CommandText += "(@COD_ALU, @COD_CUR, @NOTA1, @NOTA2, @NOTA3, @MEDIA)";
            sqlInsertComandoNotas.Parameters.Add(new SqlParameter("@COD_ALU", SqlDbType.VarChar, 10, "COD_ALU"));
            sqlInsertComandoNotas.Parameters.Add(new SqlParameter("@COD_CUR", SqlDbType.VarChar, 10, "DESCRIPCION"));
            sqlInsertComandoNotas.Parameters.Add(new SqlParameter("@NOTA1", SqlDbType.Int, 10, "NOTA1"));
            sqlInsertComandoNotas.Parameters.Add(new SqlParameter("@NOTA2", SqlDbType.Int, 10, "NOTA2"));
            sqlInsertComandoNotas.Parameters.Add(new SqlParameter("@NOTA3", SqlDbType.Int, 10, "NOTA3"));
            sqlInsertComandoNotas.Parameters.Add(new SqlParameter("@MEDIA", SqlDbType.Int, 10, "MEDIA"));
            adaptadorNotas.InsertCommand = sqlInsertComandoNotas;

            sqlUpdateComandoNotas = new SqlCommand();
            sqlUpdateComandoNotas.Connection = sqlconexion;
            sqlUpdateComandoNotas.CommandText = "UPDATE NOTAS SET COD_ALU = @COD_ALU, COD_CUR = @COD_CUR, NOTA1 = @NOTA1, NOTA2 = @NOTA2, NOTA3 = @NOTA3, MEDIA = @MEDIA ";
            sqlUpdateComandoNotas.CommandText += "WHERE COD_ALU = @COD_ALU";
            sqlUpdateComandoNotas.Parameters.Add(new SqlParameter("@COD_ALU", SqlDbType.VarChar, 10, "COD_ALU"));
            sqlUpdateComandoNotas.Parameters.Add(new SqlParameter("@COD_CUR", SqlDbType.VarChar, 10, "DESCRIPCION"));
            sqlUpdateComandoNotas.Parameters.Add(new SqlParameter("@NOTA1", SqlDbType.Int, 10, "NOTA1"));
            sqlUpdateComandoNotas.Parameters.Add(new SqlParameter("@NOTA2", SqlDbType.Int, 10, "NOTA2"));
            sqlUpdateComandoNotas.Parameters.Add(new SqlParameter("@NOTA3", SqlDbType.Int, 10, "NOTA3"));
            sqlUpdateComandoNotas.Parameters.Add(new SqlParameter("@MEDIA", SqlDbType.Int, 10, "MEDIA"));
            adaptadorNotas.UpdateCommand = sqlUpdateComandoNotas;

            sqlDeleteComandoNotas = new SqlCommand();
            sqlDeleteComandoNotas.Connection = sqlconexion;
            sqlDeleteComandoNotas.CommandText = "DELETE FROM NOTAS WHERE COD_ALU = @COD_ALU AND COD_CUR = @COD_CUR";
            sqlDeleteComandoNotas.Parameters.Add(new SqlParameter("@COD_ALU", SqlDbType.VarChar, 10, "COD_ALU"));
            sqlDeleteComandoNotas.Parameters.Add(new SqlParameter("@COD_CUR", SqlDbType.VarChar, 10, "COD_CUR"));
            adaptadorNotas.DeleteCommand = sqlDeleteComandoNotas;

            
            

            adaptadorNotas.Fill(datasetBDD, "NOTAS");

            
            tablaNotas = datasetBDD.Tables["NOTAS"];
            try
            {
                CargaNota();
            }
            catch (Exception)
            {


            }

        }

        public void CargaNota()
        {
            COD_ALU = tablaNotas.Rows[posicion]["COD_ALU"].ToString();
            COD_CUR = tablaNotas.Rows[posicion]["COD_CUR"].ToString();
            NOTA1 = Convert.ToInt32(tablaNotas.Rows[posicion]["NOTA1"]);
            NOTA2 = Convert.ToInt32(tablaNotas.Rows[posicion]["NOTA2"]);
            NOTA3 = Convert.ToInt32(tablaNotas.Rows[posicion]["NOTA3"]);
            MEDIA = Convert.ToInt32(tablaNotas.Rows[posicion]["MEDIA"]);
        }

        public void CargaNota(int i)
        {
            COD_ALU = tablaNotas.Rows[i]["COD_ALU"].ToString();
            COD_CUR = tablaNotas.Rows[i]["COD_CUR"].ToString();
            NOTA1 = Convert.ToInt32(tablaNotas.Rows[i]["NOTA1"]);
            NOTA2 = Convert.ToInt32(tablaNotas.Rows[i]["NOTA2"]);
            NOTA3 = Convert.ToInt32(tablaNotas.Rows[i]["NOTA3"]);
            MEDIA = Convert.ToInt32(tablaNotas.Rows[i]["MEDIA"]);
        }

        public void CargaNotaByCodAlu()
        {
            NOTA1 = Convert.ToInt32(tablaNotas.Rows[posicion]["NOTA1"]);
            NOTA2 = Convert.ToInt32(tablaNotas.Rows[posicion]["NOTA2"]);
            NOTA3 = Convert.ToInt32(tablaNotas.Rows[posicion]["NOTA3"]);
            MEDIA = Convert.ToInt32(tablaNotas.Rows[posicion]["MEDIA"]);
        }



        public void siguiente()
        {
            posicion++;
            if (posicion >= tablaNotas.Rows.Count)
                posicion--;
            CargaNota();
        }

        public void anterior()
        {
            posicion--;
            if (posicion < 0)
                posicion++;
            CargaNota();
        }

        public void primero()
        {
            posicion = 0;
            CargaNota();
        }

        public void ultimo()
        {
            posicion = tablaNotas.Rows.Count - 1;
            CargaNota();
        }

        public void graba(string calu, string ccur, int cNOTA1, int cNOTA2, int cNOTA3, int cMEDIA, int nuevo)
        {
            COD_ALU = calu;
            COD_CUR = ccur;
            NOTA1 = cNOTA1;
            NOTA2 = cNOTA2;
            NOTA3 = cNOTA3;
            MEDIA = cMEDIA;

            if (nuevo == 0)
            {
                sqlUpdateComandoNotas.Parameters["@COD_ALU"].Value = COD_ALU;
                sqlUpdateComandoNotas.Parameters["@COD_CUR"].Value = COD_CUR;
                sqlUpdateComandoNotas.Parameters["@NOTA1"].Value = NOTA1;
                sqlUpdateComandoNotas.Parameters["@NOTA2"].Value = NOTA2;
                sqlUpdateComandoNotas.Parameters["@NOTA3"].Value = NOTA3;
                sqlUpdateComandoNotas.Parameters["@MEDIA"].Value = MEDIA;
                try
                {
                    sqlUpdateComandoNotas.ExecuteNonQuery();
                    modiDataset();
                }
                catch (SqlException e)
                {

                    throw new Exception(e.Message);
                }

            }
            else
            {
                sqlInsertComandoNotas.Parameters["@COD_ALU"].Value = COD_ALU;
                sqlInsertComandoNotas.Parameters["@COD_CUR"].Value = COD_CUR;
                sqlInsertComandoNotas.Parameters["@NOTA1"].Value = NOTA1;
                sqlInsertComandoNotas.Parameters["@NOTA2"].Value = NOTA2;
                sqlInsertComandoNotas.Parameters["@NOTA3"].Value = NOTA3;
                sqlInsertComandoNotas.Parameters["@MEDIA"].Value = MEDIA;

                sqlInsertComandoNotas.ExecuteNonQuery();
                DataRow nuevaFila = tablaNotas.NewRow();
                nuevaFila["COD_ALU"] = COD_ALU;
                nuevaFila["COD_CUR"] = COD_CUR;
                nuevaFila["NOTA1"] = NOTA1;
                nuevaFila["NOTA2"] = NOTA2;
                nuevaFila["NOTA3"] = NOTA3;
                nuevaFila["MEDIA"] = MEDIA;
                tablaNotas.Rows.Add(nuevaFila);
                posicion = tablaNotas.Rows.Count - 1;
                modiDataset();
            }
        }

        public void modiDataset()
        {
            tablaNotas.Rows[posicion][0] = COD_ALU;
            tablaNotas.Rows[posicion][1] = COD_CUR;
            tablaNotas.Rows[posicion][2] = NOTA1;
            tablaNotas.Rows[posicion][3] = NOTA2;
            tablaNotas.Rows[posicion][4] = NOTA3;
            tablaNotas.Rows[posicion][5] = MEDIA;
            tablaNotas.Rows[posicion].AcceptChanges();
        }

        public void Borra()
        {
            sqlDeleteComandoNotas.Parameters["@COD_ALU"].Value = COD_ALU;
            sqlDeleteComandoNotas.Parameters["@COD_CUR"].Value = COD_CUR;
            sqlDeleteComandoNotas.ExecuteNonQuery();
            tablaNotas.Rows.RemoveAt(posicion);
            posicion--;
            if (posicion < 0)
                posicion = 0;
            CargaNota();
        }
        public DataTable Tabla()
        {
            return tablaNotas;
        }

        public void DeleteNotasTabla()
        {
            sqlDeleteComandoNotas = new SqlCommand();
            sqlDeleteComandoNotas.Connection = sqlconexion;
            sqlDeleteComandoNotas.CommandText = "DELETE FROM NOTAS";
            adaptadorNotas.DeleteCommand = sqlDeleteComandoNotas;
            tablaNotas.Rows.Clear();
            sqlDeleteComandoNotas.ExecuteNonQuery();
        }
    }
}
