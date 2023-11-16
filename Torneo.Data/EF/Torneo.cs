using System;
using System.Collections.Generic;

namespace TorneoEjercicio.Data.EF
{
    public partial class Torneo
    {
        public int Id { get; set; }
        public string? Nombre { get; set; }
        public int CantidadParticipantes { get; set; }
        public DateTime Fecha { get; set; }
        public bool Habilitado { get; set; }
    }
}
