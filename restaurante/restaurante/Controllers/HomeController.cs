using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using restaurante.Models;

namespace restaurante.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        restauranteEntities entidad = new restauranteEntities();

        //CONSULTA PARA LAS ORDENES REALIZADAS
        //select c.nombreCliente + ' '+ c.apellidoCliente as 'cliente', CONCAT(t.nombreTipoDoc , ' - ' , c.nroTipoDoc) as 'documento',
        // p.nombrePlato, p.precioPlato, m.nroMesa, dp.cantidad, dp.total
        // from tblDetallePlato dp
        // inner join tblCliente c on dp.idCliente = c.idCliente
        // inner join tblTipoDoc t on c.idTipoDoc = t.idTipoDoc
        // inner join tblMesa m on dp.idMesa = m.idMesa
        // inner join tblPlato p on dp.idPlato= p.idPlato
        public List<clsOrdenRealizada> consultarOrdenRealizada()
        {
            var ordenRealizada = (from dp in entidad.tblDetallePlato 
                           join c in entidad.tblCliente on dp.idCliente equals c.idCliente
                           join t in entidad.tblTipoDoc on c.idTipoDoc equals t.idTipoDoc
                           join m in entidad.tblMesa on dp.idMesa equals m.idMesa
                           join p in entidad.tblPlato on dp.idPlato equals p.idPlato
                           select
                           new
                           {
                               documento = t.nombreTipoDoc + " - " + c.nroTipoDoc,
                               cliente = c.nombreCliente + " " + c.apellidoCliente,
                               nroMesa = m.nroMesa,
                               nombrePlato = p.nombrePlato,
                               precioPlato = p.precioPlato,
                               dpcantidad = dp.cantidad,
                               total = p.precioPlato * dp.cantidad
                           }
                       ).ToArray();

            List<clsOrdenRealizada> lista = new List<clsOrdenRealizada>();

            foreach (var item in ordenRealizada)
            {
                lista.Add(new clsOrdenRealizada(item.documento,item.cliente,item.nroMesa,item.nombrePlato,item.precioPlato,item.dpcantidad,item.total));
            }

            return lista;
        }
        

        public ActionResult Index()
        {
            var varTipoDoc = (from td in entidad.tblTipoDoc
                              select td).ToList();
            var listTipDoc = new SelectList(varTipoDoc, "idTipoDoc", "nombreTipoDoc");
            ViewData["TipoDocumento"] = listTipDoc;

            var varMesa = (from td in entidad.tblMesa
                              select td).ToList();
            var listMesa = new SelectList(varMesa, "idMesa", "nroMesa");
            ViewData["Mesa"] = listMesa;

            var varPlato = (from td in entidad.tblPlato
                            select new { idPlato = td.idPlato, nombrePlato = td.nombrePlato + " - " + td.precioPlato + "$" }).ToList();
            var listPlato = new SelectList(varPlato, "idPlato", "nombrePlato");
            ViewData["Plato"] = listPlato;

            ViewData["ordenesRealizadas"] = consultarOrdenRealizada();

            return View();
            
        }
    }
}