namespace WinBDDRazor
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ALUMNOS")]
    public partial class ALUMNO
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ALUMNO()
        {
            NOTAS = new HashSet<NOTA>();
        }

        [Key]
        [StringLength(10)]
        public string COD_ALU { get; set; }

        [Required]
        [StringLength(10)]
        public string COD_CUR { get; set; }

        [StringLength(10)]
        public string DNI { get; set; }

        [StringLength(30)]
        public string APELLIDOS { get; set; }

        [StringLength(20)]
        public string NOMBRE { get; set; }

        public virtual CURSO CURSO { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NOTA> NOTAS { get; set; }
    }
}
