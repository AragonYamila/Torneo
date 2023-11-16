using Microsoft.AspNetCore.Mvc;
using TorneoEjercicio.Servicio;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace TorneoApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TorneoAPIController : ControllerBase
    {
        private ITorneoServicio _servicio;
        public TorneoAPIController(ITorneoServicio servicio) { 
            _servicio = servicio;
        }

        // GET: api/<TorneoAPIController>
        [HttpGet]
        public async Task<ActionResult<string>> GetNombreMayorCantidadaParticipantes()
        {
          var nombreTorneo = await  _servicio.NombreDelTorneoConMayorCantidadDeParticipantes();
            if(nombreTorneo == null)
            {
                return NotFound();
            }
            return Ok(nombreTorneo);
        }


    }
}
