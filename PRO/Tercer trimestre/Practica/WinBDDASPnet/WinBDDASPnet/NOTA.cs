namespace WinBDDASPnet
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NOTAS")]
    public partial class NOTA
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string COD_CUR { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string COD_ALU { get; set; }

        public int? NOTA1 { get; set; }

        public int? NOTA2 { get; set; }

        public int? NOTA3 { get; set; }

        public int? MEDIA { get; set; }

        public virtual ALUMNO ALUMNO { get; set; }

        public virtual CURSO CURSO { get; set; }
    }
}
