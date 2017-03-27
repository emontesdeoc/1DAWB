namespace WinBDDASPnet
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CURSOS")]
    public partial class CURSO
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CURSO()
        {
            ALUMNOS = new HashSet<ALUMNO>();
            NOTAS = new HashSet<NOTA>();
        }

        [Key]
        [StringLength(10)]
        public string COD_CUR { get; set; }

        [StringLength(30)]
        public string DESCRIPCION { get; set; }

        public int? HORAS { get; set; }

        [StringLength(30)]
        public string TUTOR { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ALUMNO> ALUMNOS { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NOTA> NOTAS { get; set; }
    }
}
