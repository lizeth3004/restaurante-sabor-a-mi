using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace restaurante.Models
{
    public class clsOrdenRealizada
    {
        public string documento { get; set; }
        public string cliente { get; set; }
        public int nroMesa { get; set; }
        public string nombrePlato { get; set; }
        public int precioPlato { get; set; }
        public int dpcantidad { get; set; }
        public int total { get; set; }

        public clsOrdenRealizada(string inDocumento, string inCliente, int inNroMesa, string inNombrePlato, int inPrecioPlato, int? inCantidad, int? inTotal)
        {
            this.documento = inDocumento;
            this.cliente = inCliente;
            this.nroMesa = inNroMesa;
            this.nombrePlato = inNombrePlato;
            this.precioPlato = inPrecioPlato;
            this.dpcantidad = Convert.ToInt32(inCantidad);
            this.total = Convert.ToInt32(inTotal);
        }
    }
}