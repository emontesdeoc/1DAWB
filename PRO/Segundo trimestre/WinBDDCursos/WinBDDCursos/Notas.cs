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
        /// <summary>
        /// Codigo de alumno
        /// </summary>
        public string COD_ALU;
        /// <summary>
        /// Codigo de curso
        /// </summary>
        public string COD_CUR;
        /// <summary>
        /// Nota 1 del alumno
        /// </summary>
        public int NOTA1;
        /// <summary>
        /// Nota 2 del alumno
        /// </summary>
        public int NOTA2;
        /// <summary>
        /// Nota 3 del alumno
        /// </summary>
        public int NOTA3;
        /// <summary>
        /// Media del alumno
        /// </summary>
        public int MEDIA;

        /// <summary>
        /// Conexion a la base de datos
        /// </summary>
        public SqlConnection sqlconexion;
        /// <summary>
        /// Dataset creado en la clase BDD
        /// </summary>
        public DataSet datasetBDD;
        /// <summary>
        /// Comando Select
        /// </summary>
        public SqlCommand sqlSelectComandoNotas;
        /// <summary>
        /// Comando Insert
        /// </summary>
        public SqlCommand sqlInsertComandoNotas;
        /// <summary>
        /// Comando Update
        /// </summary>
        public SqlCommand sqlUpdateComandoNotas;
        /// <summary>
        /// Comando Delete
        /// </summary>
        public SqlCommand sqlDeleteComandoNotas;
        /// <summary>
        /// Adaptador
        /// </summary>
        public SqlDataAdapter adaptadorNotas;
        /// <summary>
        /// Datatable que devuelve la tabla de notas
        /// </summary>
        public DataTable tablaNotas { get; set; }
        /// <summary>
        /// Posicion, inutil para esta clase
        /// </summary>
        int posicion;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="sqlconexion1">Conexion a BD</param>
        /// <param name="ds1">Dataset</param>
        public Notas(SqlConnection sqlconexion1, DataSet ds1)
        {
            //Posision 0, heredado de la copia de la clase Curso, no sirve para esta parte de la practica
            posicion = 0;
            /// Instanciando variables de conexion y dataset
            adaptadorNotas = new SqlDataAdapter();
            sqlconexion = sqlconexion1;
            datasetBDD = ds1;

            ///Creando el comando Select y añadiedolo al adaptador de notas
            sqlSelectComandoNotas = new SqlCommand();
            sqlSelectComandoNotas.Connection = sqlconexion;
            sqlSelectComandoNotas.CommandText = "SELECT COD_ALU, COD_CUR, NOTA1, NOTA2, NOTA3, MEDIA FROM NOTAS";
            adaptadorNotas.SelectCommand = sqlSelectComandoNotas;


            //Creando el comando Insert y añadiendolo al adaptador de notas
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


            //Creando el comando Update y añadiendolo al adaptador de notas
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


            //Creando el comando Delete y añadiendolo al adaptador de notas
            sqlDeleteComandoNotas = new SqlCommand();
            sqlDeleteComandoNotas.Connection = sqlconexion;
            sqlDeleteComandoNotas.CommandText = "DELETE FROM NOTAS WHERE COD_ALU = @COD_ALU AND COD_CUR = @COD_CUR";
            sqlDeleteComandoNotas.Parameters.Add(new SqlParameter("@COD_ALU", SqlDbType.VarChar, 10, "COD_ALU"));
            sqlDeleteComandoNotas.Parameters.Add(new SqlParameter("@COD_CUR", SqlDbType.VarChar, 10, "COD_CUR"));
            adaptadorNotas.DeleteCommand = sqlDeleteComandoNotas;

            // Rellenando el adaptador con la tabla NOTAS del dataset
            adaptadorNotas.Fill(datasetBDD, "NOTAS");
            // Asignando el la tabla del dataset a tablaNotas para que sea mas facil su uso ( solo direcciona ).
            tablaNotas = datasetBDD.Tables["NOTAS"];
            tablaNotas.Constraints.Add("key1", tablaNotas.Columns[0], true);
            try
            {
                //Carga las notas, esta en un try catch porque si devuelve 0, porque la tabla de notas no tiene nada, se arregla
                //cuando se pulsa el boton Nueva Notas que rellena toda la tabla de notas.
                CargaNota();
            }
            catch (Exception)
            {
            }
        }

        /// <summary>
        /// Metodo que carga las notas para el alumno con posicion 0, este metodo no es muy util ya que siempre devuelve la misma nota
        /// </summary>
        public void CargaNota()
        {
            COD_ALU = tablaNotas.Rows[posicion]["COD_ALU"].ToString();
            COD_CUR = tablaNotas.Rows[posicion]["COD_CUR"].ToString();
            NOTA1 = Convert.ToInt32(tablaNotas.Rows[posicion]["NOTA1"]);
            NOTA2 = Convert.ToInt32(tablaNotas.Rows[posicion]["NOTA2"]);
            NOTA3 = Convert.ToInt32(tablaNotas.Rows[posicion]["NOTA3"]);
            MEDIA = Convert.ToInt32(tablaNotas.Rows[posicion]["MEDIA"]);
        }

        /// <summary>
        /// Metodo que carga la nota de un alumno pasandole una fila exacta.
        /// </summary>
        /// <param name="i">Fila</param>
        public void CargaNota(int i)
        {
            COD_ALU = tablaNotas.Rows[i]["COD_ALU"].ToString();
            COD_CUR = tablaNotas.Rows[i]["COD_CUR"].ToString();
            NOTA1 = Convert.ToInt32(tablaNotas.Rows[i]["NOTA1"]);
            NOTA2 = Convert.ToInt32(tablaNotas.Rows[i]["NOTA2"]);
            NOTA3 = Convert.ToInt32(tablaNotas.Rows[i]["NOTA3"]);
            MEDIA = Convert.ToInt32(tablaNotas.Rows[i]["MEDIA"]);
        }


        /// <summary>
        /// Metodo que graba o actualiza la tabla de notas
        /// </summary>
        /// <param name="COD_ALU">Codigo de alumno</param>
        /// <param name="COD_CUR">Codigo de curso</param>
        /// <param name="NOTA1">Nota 1 de alumno</param>
        /// <param name="NOTA2">Nota 2 de alumno</param>
        /// <param name="NOTA3">Nota 3 de alumno</param>
        /// <param name="MEDIA">Media de alumno</param>
        /// <param name="nuevo">Entero que determina si es nuevo o no</param>
        public void GrabarAlumno(string COD_ALU, string COD_CUR, int NOTA1, int NOTA2, int NOTA3, int MEDIA, int nuevo)
        {

            //Asigna valores introducidos al objeto nota.
            this.COD_ALU = COD_ALU;
            this.COD_CUR = COD_CUR;
            this.NOTA1 = NOTA1;
            this.NOTA2 = NOTA2;
            this.NOTA3 = NOTA3;
            this.MEDIA = MEDIA;

            //Si la variable nuev es 0, significa que actualiza
            if (nuevo == 0)
            {


                sqlUpdateComandoNotas.Parameters["@COD_ALU"].Value = this.COD_ALU;
                sqlUpdateComandoNotas.Parameters["@COD_CUR"].Value = this.COD_CUR;
                sqlUpdateComandoNotas.Parameters["@NOTA1"].Value = this.NOTA1;
                sqlUpdateComandoNotas.Parameters["@NOTA2"].Value = this.NOTA2;
                sqlUpdateComandoNotas.Parameters["@NOTA3"].Value = this.NOTA3;
                sqlUpdateComandoNotas.Parameters["@MEDIA"].Value = this.MEDIA;
                try
                {
                    //ExecuteNonQuery ejecuta el comando SQL en la base de datos
                    sqlUpdateComandoNotas.ExecuteNonQuery();

                    DataRow Dfila = tablaNotas.Rows.Find(COD_ALU);
                    Dfila["COD_ALU"] = COD_ALU;
                    Dfila["COD_CUR"] = COD_CUR;
                    Dfila["NOTA1"] = NOTA1;
                    Dfila["NOTA2"] = NOTA2;
                    Dfila["NOTA3"] = NOTA3;
                    Dfila["MEDIA"] = MEDIA;
                    tablaNotas.AcceptChanges();
                    //modifica el dataset
                    //modiDataset();
                }
                catch (SqlException e)
                {

                    throw new Exception(e.Message);
                }

            }
            else
            {
                //Si la variasble nuevo no es 0, significa que es nuevo
                sqlInsertComandoNotas.Parameters["@COD_ALU"].Value = this.COD_ALU;
                sqlInsertComandoNotas.Parameters["@COD_CUR"].Value = this.COD_CUR;
                sqlInsertComandoNotas.Parameters["@NOTA1"].Value = this.NOTA1;
                sqlInsertComandoNotas.Parameters["@NOTA2"].Value = this.NOTA2;
                sqlInsertComandoNotas.Parameters["@NOTA3"].Value = this.NOTA3;
                sqlInsertComandoNotas.Parameters["@MEDIA"].Value = this.MEDIA;

                //Ejecuta el comando Insert en la base de datos
                sqlInsertComandoNotas.ExecuteNonQuery();

                //Hay que crear una nueva fila en el DATASET
                DataRow nuevaFila = tablaNotas.NewRow();
                nuevaFila["COD_ALU"] = COD_ALU;
                nuevaFila["COD_CUR"] = COD_CUR;
                nuevaFila["NOTA1"] = NOTA1;
                nuevaFila["NOTA2"] = NOTA2;
                nuevaFila["NOTA3"] = NOTA3;
                nuevaFila["MEDIA"] = MEDIA;
                //Añade la fila creada al dataset de tablaNotas
                tablaNotas.Rows.Add(nuevaFila);
                //Asigna la posicion a la ultima de la tabla de notas
                posicion = tablaNotas.Rows.Count - 1;
                //Modifica el dataset
                modiDataset();
            }
        }

        /// <summary>
        /// Modifica el dataset
        /// </summary>
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



        /// <summary>
        /// Metodo que devuelve la tabla
        /// </summary>
        /// <returns>Devuelve datatable de tablaNotas</returns>
        public DataTable Tabla()
        {
            return tablaNotas;
        }

        /// <summary>
        /// Metodo que borra todo de la tabla notas y actualiza el dataset
        /// </summary>
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
