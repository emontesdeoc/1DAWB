using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace WinBDDCursos
{
    class BDD_Conexion
    {
        public SqlConnection sqlconexion;
        public DataSet datasetBDD;

        public BDD_Conexion()
        {
            sqlconexion = new SqlConnection();
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
            builder.DataSource = @"EMI-LAPTOP";
            //builder.DataSource = @"EMI-DESKTOP";
            builder.InitialCatalog = "OCUPACIONAL";
            builder.IntegratedSecurity = true;
            sqlconexion.ConnectionString = builder.ConnectionString;
            datasetBDD = new DataSet();
        }

        public bool abrirConexion()
        {
            try
            {
                sqlconexion.Open();
                return (true);
            }
            catch (SqlException)
            {
                return (false);
            }
        }

        public void cerrarConexion()
        {
            sqlconexion.Close();
        }
    }
}
