using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace TorneoEjercicio.Data.EF
{
    public partial class TorneoDatabaseContext : DbContext
    {
        public TorneoDatabaseContext()
        {
        }

        public TorneoDatabaseContext(DbContextOptions<TorneoDatabaseContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Torneo> Torneos { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=.\\SQLExpress;Database=TorneoDatabase;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Torneo>(entity =>
            {
                entity.ToTable("Torneo");

                entity.Property(e => e.Fecha).HasColumnType("date");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
