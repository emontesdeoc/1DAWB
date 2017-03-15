using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace WinBDDCursos
{
    class Alumnos
    {
        public string COD_ALU;
        public string COD_CUR;
        public string DNI;
        public string APELLIDOS;
        public string NOMBRE;
        public SqlConnection sqlconexion;
        public DataSet datasetBDD;
        public SqlCommand sqlSelectComandoAlumno;
        public SqlCommand sqlInsertComandoAlumno;
        public SqlCommand sqlUpdateComandoAlumno;
        public SqlCommand sqlDeleteComandoAlumno;
        public SqlDataAdapter adaptadorAlumnos;
        public DataTable tablaAlumnos { get; set; }
        int posicion;

        public Alumnos(SqlConnection sqlconexion1, DataSet ds1)
        {
            posicion = 0;
            adaptadorAlumnos = new SqlDataAdapter();
            sqlconexion = sqlconexion1;
            datasetBDD = ds1;

            sqlSelectComandoAlumno = new SqlCommand();
            sqlSelectComandoAlumno.Connection = sqlconexion;
            sqlSelectComandoAlumno.CommandText = "SELECT COD_ALU, COD_CUR, DNI, APELLIDOS, NOMBRE FROM ALUMNOS";
            adaptadorAlumnos.SelectCommand = sqlSelectComandoAlumno;

            sqlInsertComandoAlumno = new SqlCommand();
            sqlInsertComandoAlumno.Connection = sqlconexion;
            sqlInsertComandoAlumno.CommandText = "INSERT INTO ALUMNOS (COD_ALU, COD_CUR, DNI, APELLIDOS, NOMBRE) VALUES ";
            sqlInsertComandoAlumno.CommandText += "(@COD_ALU, @COD_CUR, @DNI, @APELLIDOS, @NOMBRE)";
            sqlInsertComandoAlumno.Parameters.Add(new SqlParameter("@COD_ALU", SqlDbType.VarChar, 10, "COD_ALU"));
            sqlInsertComandoAlumno.Parameters.Add(new SqlParameter("@COD_CUR", SqlDbType.VarChar, 10, "DESCRIPCION"));
            sqlInsertComandoAlumno.Parameters.Add(new SqlParameter("@DNI", SqlDbType.VarChar, 10, "DNI"));
            sqlInsertComandoAlumno.Parameters.Add(new SqlParameter("@APELLIDOS", SqlDbType.VarChar, 30, "APELLIDOS"));
            sqlInsertComandoAlumno.Parameters.Add(new SqlParameter("@NOMBRE", SqlDbType.VarChar, 20, "NOMBRE"));
            adaptadorAlumnos.InsertCommand = sqlInsertComandoAlumno;

            sqlUpdateComandoAlumno = new SqlCommand();
            sqlUpdateComandoAlumno.Connection = sqlconexion;
            sqlUpdateComandoAlumno.CommandText = "UPDATE ALUMNOS SET COD_ALU = @COD_ALU, COD_CUR = @COD_CUR, DNI = @DNI, APELLIDOS = @APELLIDOS, NOMBRE = @APELLIDOS ";
            sqlUpdateComandoAlumno.CommandText += "WHERE COD_ALU = @COD_ALU";
            sqlUpdateComandoAlumno.Parameters.Add(new SqlParameter("@COD_ALU", SqlDbType.VarChar, 10, "COD_ALU"));
            sqlUpdateComandoAlumno.Parameters.Add(new SqlParameter("@COD_CUR", SqlDbType.VarChar, 10, "DESCRIPCION"));
            sqlUpdateComandoAlumno.Parameters.Add(new SqlParameter("@DNI", SqlDbType.VarChar, 10, "DNI"));
            sqlUpdateComandoAlumno.Parameters.Add(new SqlParameter("@APELLIDOS", SqlDbType.VarChar, 30, "APELLIDOS"));
            sqlUpdateComandoAlumno.Parameters.Add(new SqlParameter("@NOMBRE", SqlDbType.VarChar, 20, "NOMBRE"));
            adaptadorAlumnos.UpdateCommand = sqlUpdateComandoAlumno;

            sqlDeleteComandoAlumno = new SqlCommand();
            sqlDeleteComandoAlumno.Connection = sqlconexion;
            sqlDeleteComandoAlumno.CommandText = "DELETE FROM ALUMNOS WHERE COD_ALU = @COD_ALU AND COD_CUR = @COD_CUR";
            sqlDeleteComandoAlumno.Parameters.Add(new SqlParameter("@COD_ALU", SqlDbType.VarChar, 10, "COD_ALU"));
            sqlDeleteComandoAlumno.Parameters.Add(new SqlParameter("@COD_CUR", SqlDbType.VarChar, 10, "COD_CUR"));
            adaptadorAlumnos.DeleteCommand = sqlDeleteComandoAlumno;

            adaptadorAlumnos.Fill(datasetBDD, "ALUMNOS");
            tablaAlumnos = datasetBDD.Tables["ALUMNOS"];
            CargaAlumno();
        }

        public void CargaAlumno()
        {
            COD_ALU = tablaAlumnos.Rows[posicion]["COD_ALU"].ToString();
            COD_CUR = tablaAlumnos.Rows[posicion]["COD_CUR"].ToString();
            DNI = tablaAlumnos.Rows[posicion]["DNI"].ToString();
            APELLIDOS = tablaAlumnos.Rows[posicion]["APELLIDOS"].ToString();
            NOMBRE = tablaAlumnos.Rows[posicion]["NOMBRE"].ToString();
        }

        public void graba(string calu, string ccur, string cdni, string capellidos, string cnombre, int nuevo, int posi)
        {
            COD_ALU = calu;
            COD_CUR = ccur;
            DNI = cdni;
            APELLIDOS = capellidos;
            NOMBRE = cnombre;

            if (nuevo == 0)
            {
                sqlUpdateComandoAlumno.Parameters["@COD_ALU"].Value = COD_ALU;
                sqlUpdateComandoAlumno.Parameters["@COD_CUR"].Value = COD_CUR;
                sqlUpdateComandoAlumno.Parameters["@DNI"].Value = DNI;
                sqlUpdateComandoAlumno.Parameters["@APELLIDOS"].Value = APELLIDOS;
                sqlUpdateComandoAlumno.Parameters["@NOMBRE"].Value = NOMBRE;
                try
                {
                    sqlUpdateComandoAlumno.ExecuteNonQuery();
                    modiDataset(posi);


                }
                catch (SqlException e)
                {

                    throw new Exception(e.Message);
                }

            }
            else
            {
                sqlInsertComandoAlumno.Parameters["@COD_ALU"].Value = COD_ALU;
                sqlInsertComandoAlumno.Parameters["@COD_CUR"].Value = COD_CUR;
                sqlInsertComandoAlumno.Parameters["@DNI"].Value = DNI;
                sqlInsertComandoAlumno.Parameters["@APELLIDOS"].Value = APELLIDOS;
                sqlInsertComandoAlumno.Parameters["@NOMBRE"].Value = NOMBRE;

                sqlInsertComandoAlumno.ExecuteNonQuery();
                DataRow nuevaFila = tablaAlumnos.NewRow();
                nuevaFila["COD_ALU"] = COD_ALU;
                nuevaFila["COD_CUR"] = COD_CUR;
                nuevaFila["DNI"] = DNI;
                nuevaFila["APELLIDOS"] = APELLIDOS;
                nuevaFila["NOMBRE"] = NOMBRE;
                tablaAlumnos.Rows.Add(nuevaFila);
                posicion = tablaAlumnos.Rows.Count - 1;
                modiDataset();
            }
        }

        public void modiDataset()
        {
            tablaAlumnos.Rows[posicion][0] = COD_ALU;
            tablaAlumnos.Rows[posicion][1] = COD_CUR;
            tablaAlumnos.Rows[posicion][2] = DNI;
            tablaAlumnos.Rows[posicion][3] = APELLIDOS;
            tablaAlumnos.Rows[posicion][4] = NOMBRE;
            tablaAlumnos.Rows[posicion].AcceptChanges();
        }

        public void modiDataset(int i)
        {
            tablaAlumnos.Rows[i][0] = COD_ALU;
            tablaAlumnos.Rows[i][1] = COD_CUR;
            tablaAlumnos.Rows[i][2] = DNI;
            tablaAlumnos.Rows[i][3] = APELLIDOS;
            tablaAlumnos.Rows[i][4] = NOMBRE;
            tablaAlumnos.Rows[i].AcceptChanges();
        }


        public void Borra()
        {
            sqlDeleteComandoAlumno.Parameters["@COD_ALU"].Value = COD_ALU;
            sqlDeleteComandoAlumno.Parameters["@COD_CUR"].Value = COD_CUR;
            sqlDeleteComandoAlumno.ExecuteNonQuery();
            tablaAlumnos.Rows.RemoveAt(posicion);
            posicion--;
            if (posicion < 0)
                posicion = 0;
            CargaAlumno();
        }
        public DataTable Tabla()
        {
            return tablaAlumnos;
        }
    }
}
