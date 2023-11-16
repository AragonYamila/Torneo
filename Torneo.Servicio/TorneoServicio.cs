using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using TorneoEjercicio.Data.EF;

namespace TorneoEjercicio.Servicio
{
    public interface ITorneoServicio
    {
        List<Torneo> GetTorneos();
        void GrabarTorneo(Torneo torneo);
        void DeshabilitarTorneo(Torneo torneo);
        Torneo getTorneoPorId(int Id);
        Task<string> NombreDelTorneoConMayorCantidadDeParticipantes();
    }
    public class TorneoServicio : ITorneoServicio
    {
        private TorneoDatabaseContext _context;
        public TorneoServicio(TorneoDatabaseContext context)
        {
            _context = context;
        }

        public List<Torneo> GetTorneos()
        {
            return _context.Torneos.Where(t => t.Fecha > DateTime.Now).ToList();
        }

        public void GrabarTorneo(Torneo torneo)
        {
            _context.Torneos.Add( torneo );
            _context.SaveChanges();
        }
        public void DeshabilitarTorneo(Torneo torneo)
        {
           
            if (torneo != null)
            {
                if (torneo.Habilitado)
                {
                    torneo.Habilitado = false;
                    _context.SaveChanges();
                }
            }
        }
        public Torneo getTorneoPorId(int Id)
        {
            return _context.Torneos.Find(Id);
        }
        public async Task<string> NombreDelTorneoConMayorCantidadDeParticipantes()
        {
           /* Method Syntax
            
            * var mayorcantidad = await _context.Torneos.MaxAsync(t => t.CantidadParticipantes);
            var torneo = await _context.Torneos.FirstOrDefaultAsync(x => x.CantidadParticipantes == mayorcantidad);*/
           
            /*Query Syntax*/

            var cantQuery = await (from t in _context.Torneos
                                   select t).MaxAsync(x =>x.CantidadParticipantes);
           
            var torneoQuery = await (from t in _context.Torneos
                                     where t.CantidadParticipantes == cantQuery
                                     select t).FirstOrDefaultAsync();
            return torneoQuery.Nombre;
        }
    }
}
