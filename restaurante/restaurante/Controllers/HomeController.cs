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
                            select td).ToList();
            var listPlato = new SelectList(varPlato, "idPlato", "nombrePlato");
            ViewData["Plato"] = listPlato;


            //grid view
            //var platos = new List<tblPlato>();
            //platos = entidad.tblPlato.ToList();

            return View();
            
        }
    }
}