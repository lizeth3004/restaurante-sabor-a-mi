//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace restaurante.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblDetallePlato
    {
        public int cantidad { get; set; }
        public int precioPlato { get; set; }
        public int total { get; set; }
        public int idReserva { get; set; }
        public int idPlato { get; set; }
    
        public virtual tblPlato tblPlato { get; set; }
        public virtual tblReserva tblReserva { get; set; }
    }
}
