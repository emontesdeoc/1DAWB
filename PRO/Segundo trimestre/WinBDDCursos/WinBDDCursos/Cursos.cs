using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace WinBDDCursos
{
    class Cursos
    {
        public string Cod_Cur;
        public string Descripcion;
        public int Horas;
        public string Tutor;
        public SqlConnection sqlconexion;
        public DataSet datasetBDD;
        public SqlCommand sqlSelectComandoCurso;
        public SqlCommand sqlInsertComandoCurso;
        public SqlCommand sqlUpdateComandoCurso;
        public SqlCommand sqlDeleteComandoCurso;
        public SqlDataAdapter adaptadorCursos;
        public DataTable tablaCursos;
        int posicion;

        public Cursos(SqlConnection sqlconexion1, DataSet ds1)
        {
            posicion = 0;
            adaptadorCursos = new SqlDataAdapter();
            sqlconexion = sqlconexion1;
            datasetBDD = ds1;

            sqlSelectComandoCurso = new SqlCommand();
            sqlSelectComandoCurso.Connection = sqlconexion;
            sqlSelectComandoCurso.CommandText = "SELECT COD_CUR, DESCRIPCION, HORAS, TUTOR FROM CURSOS";
            adaptadorCursos.SelectCommand = sqlSelectComandoCurso;

            sqlInsertComandoCurso = new SqlCommand();
            sqlInsertComandoCurso.Connection = sqlconexion;
            sqlInsertComandoCurso.CommandText = "INSERT INTO CURSOS (COD_CUR, DESCRIPCION, HORAS, TUTOR) VALUES ";
            sqlInsertComandoCurso.CommandText += "(@COD_CUR, @DESCRIPCION, @HORAS, @TUTOR)";
            sqlInsertComandoCurso.Parameters.Add(new SqlParameter("@COD_CUR", SqlDbType.VarChar, 10, "COD_CUR"));
            sqlInsertComandoCurso.Parameters.Add(new SqlParameter("@DESCRIPCION", SqlDbType.VarChar, 30, "DESCRIPCION"));
            sqlInsertComandoCurso.Parameters.Add(new SqlParameter("@HORAS", SqlDbType.Int, 4, "HORAS"));
            sqlInsertComandoCurso.Parameters.Add(new SqlParameter("@TUTOR", SqlDbType.VarChar, 30, "DESCRIPCION"));
            adaptadorCursos.InsertCommand = sqlInsertComandoCurso;

            sqlUpdateComandoCurso = new SqlCommand();
            sqlUpdateComandoCurso.Connection = sqlconexion;
            sqlUpdateComandoCurso.CommandText = "UPDATE CURSOS SET DESCRIPCION = @DESCRIPCION, HORAS = @HORAS, TUTOR = @TUTOR ";
            sqlUpdateComandoCurso.CommandText += "WHERE COD_CUR = @COD_CUR";
            sqlUpdateComandoCurso.Parameters.Add(new SqlParameter("@COD_CUR", SqlDbType.VarChar, 10, "COD_CUR"));
            sqlUpdateComandoCurso.Parameters.Add(new SqlParameter("@DESCRIPCION", SqlDbType.VarChar, 30, "DESCRIPCION"));
            sqlUpdateComandoCurso.Parameters.Add(new SqlParameter("@HORAS", SqlDbType.Int, 4, "HORAS"));
            sqlUpdateComandoCurso.Parameters.Add(new SqlParameter("@TUTOR", SqlDbType.VarChar, 30, "DESCRIPCION"));
            adaptadorCursos.UpdateCommand = sqlUpdateComandoCurso;

            sqlDeleteComandoCurso = new SqlCommand();
            sqlDeleteComandoCurso.Connection = sqlconexion;
            sqlDeleteComandoCurso.CommandText = "DELETE FROM CURSOS WHERE COD_CUR = @COD_CUR";
            sqlDeleteComandoCurso.Parameters.Add(new SqlParameter("@COD_CUR", SqlDbType.VarChar, 10, "COD_CUR"));
            adaptadorCursos.DeleteCommand = sqlDeleteComandoCurso;

            adaptadorCursos.Fill(datasetBDD, "CURSOS");
            tablaCursos = datasetBDD.Tables["CURSOS"];
            CargaCurso();
        }

        public void CargaCurso()
        {
            Cod_Cur = datasetBDD.Tables["CURSOS"].Rows[posicion]["Cod_cur"].ToString();
            Descripcion = datasetBDD.Tables["CURSOS"].Rows[posicion]["Descripcion"].ToString();
            Horas = Convert.ToInt32(datasetBDD.Tables["CURSOS"].Rows[posicion]["Horas"].ToString());
            Tutor = tablaCursos.Rows[posicion]["Tutor"].ToString();
        }

        public void siguiente()
        {
            posicion++;
            if (posicion >= tablaCursos.Rows.Count)
                posicion--;
            CargaCurso();
        }

        public void anterior()
        {
            posicion--;
            if (posicion < 0)
                posicion++;
            CargaCurso();
        }

        public void primero()
        {
            posicion = 0;
            CargaCurso();
        }

        public void ultimo()
        {
            posicion = tablaCursos.Rows.Count - 1;
            CargaCurso();
        }

        public void graba(string ccur, string cdes, string chor, string ctut, int nuevo)
        {
            int choras = Convert.ToInt32(chor);
            Cod_Cur = ccur;
            Descripcion = cdes;
            Horas = choras;
            Tutor = ctut;
            if(nuevo == 0)
            {
                sqlUpdateComandoCurso.Parameters["@COD_CUR"].Value = Cod_Cur;
                sqlUpdateComandoCurso.Parameters["@DESCRIPCION"].Value = Descripcion;
                sqlUpdateComandoCurso.Parameters["@HORAS"].Value = Horas;
                sqlUpdateComandoCurso.Parameters["@TUTOR"].Value = Tutor;
                sqlUpdateComandoCurso.ExecuteNonQuery();
                modiDataset();
            }
            else
            {
                sqlInsertComandoCurso.Parameters["@COD_CUR"].Value = Cod_Cur;
                sqlInsertComandoCurso.Parameters["@DESCRIPCION"].Value = Descripcion;
                sqlInsertComandoCurso.Parameters["@HORAS"].Value = Horas;
                sqlInsertComandoCurso.Parameters["@TUTOR"].Value = Tutor;
                sqlInsertComandoCurso.ExecuteNonQuery();
                DataRow nuevaFila = tablaCursos.NewRow();
                nuevaFila["Cod_Cur"] = Cod_Cur;
                nuevaFila["Descripcion"] = Descripcion;
                nuevaFila["Horas"] = Horas;
                nuevaFila["Tutor"] = Tutor;
                tablaCursos.Rows.Add(nuevaFila);
                posicion = tablaCursos.Rows.Count - 1;
                modiDataset();
            }
        }

        public void modiDataset()
        {
            tablaCursos.Rows[posicion][0] = Cod_Cur;
            tablaCursos.Rows[posicion][1] = Descripcion;
            tablaCursos.Rows[posicion][2] = Horas;
            tablaCursos.Rows[posicion][3] = Tutor;
            tablaCursos.Rows[posicion].AcceptChanges();
        }

        public void Borra()
        {
            sqlDeleteComandoCurso.Parameters["@COD_CUR"].Value = Cod_Cur;
            sqlDeleteComandoCurso.ExecuteNonQuery();
            tablaCursos.Rows.RemoveAt(posicion);
            posicion--;
            if (posicion < 0)
                posicion = 0;
            CargaCurso();
        }
    }
}
