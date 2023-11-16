using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TorneoEjercicio.Data.EF;
using TorneoEjercicio.Servicio;

namespace TorneoEjercicios.Web.Controllers
{
    public class TorneoEjercicioController : Controller
    {
        private ITorneoServicio _servicio;
        public TorneoEjercicioController(ITorneoServicio servicio)
        {
            _servicio = servicio;
        }
        public ActionResult GrabarTorneo()
        {
            return View();
        }
        [HttpPost]
        public IActionResult GrabarTorneo(TorneoEjercicio.Data.EF.Torneo torneo)
        {
            if(torneo != null)
                torneo.Fecha=DateTime.Now.AddMonths(1);
                torneo.Habilitado = true;
                _servicio.GrabarTorneo(torneo);
            TempData["Exito"] = "Se ha registrado su torneo exitosamente";
            return Redirect("/TorneoEjercicio/Torneos");
        }
        [HttpGet]
        public IActionResult Torneos()
        {
            return View(_servicio.GetTorneos());
        }
        [HttpGet("{Id}")]
        public IActionResult DeshabilitarTorneo(int Id)
        {
            var torneo = _servicio.getTorneoPorId(Id);
            if(torneo != null)
            _servicio.DeshabilitarTorneo(torneo);
            return Redirect("/TorneoEjercicio/Torneos");
        }



    }
}
