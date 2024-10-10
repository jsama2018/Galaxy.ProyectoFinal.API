using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Galaxy.ProyectoFinal.AccesoDatos.Contexto;

public partial class ProyectoFinalContext : DbContext
{
    public ProyectoFinalContext()
    {
    }

    public ProyectoFinalContext(DbContextOptions<ProyectoFinalContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TbCliente> TbClientes { get; set; }

    public virtual DbSet<TbMaestro> TbMaestros { get; set; }

    public virtual DbSet<TbMaestroDetalle> TbMaestroDetalles { get; set; }

    public virtual DbSet<TbProducto> TbProductos { get; set; }

    public virtual DbSet<TbVenta> TbVentas { get; set; }
    

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) {}


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TbCliente>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__TbClient__3214EC0779DB3E92");

            entity.Property(e => e.Id).HasComment("Identificador del registro, autoincrimental");
            entity.Property(e => e.DocumentoIdentidad)
                .HasMaxLength(12)
                .IsUnicode(false)
                .IsFixedLength()
                .HasComment("Numero de documento de identidad");
            entity.Property(e => e.Estado)
                .HasDefaultValue(true)
                .HasComment("0: inactivo / 1: Activo");
            entity.Property(e => e.FechaCreacion)
                .HasDefaultValueSql("(getdate())")
                .HasComment("Fecha de creacion del registro")
                .HasColumnType("datetime");
            entity.Property(e => e.FechaModificacion)
                .HasComment("Fecha de ultima modificacion")
                .HasColumnType("datetime");
            entity.Property(e => e.IdMaeTipoDocumento).HasComment("Identificador del tipo de documento de identidad");
            entity.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasComment("Nombre cliente");
            entity.Property(e => e.RazonSocial)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasComment("Razon social");
            entity.Property(e => e.UsuarioCreacion)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("sql")
                .HasComment("Nombre de usuario del registro");
            entity.Property(e => e.UsuarioModificacion)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasComment("Usuario de ultima modificacion");

            entity.HasOne(d => d.IdMaeTipoDocumentoNavigation).WithMany(p => p.TbClientes)
                .HasForeignKey(d => d.IdMaeTipoDocumento)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TbClientes_TbMaestroDetalle_TipoDocumento");
        });

        modelBuilder.Entity<TbMaestro>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__TbMaestr__3214EC07ADE62E61");

            entity.ToTable("TbMaestro");

            entity.HasIndex(e => e.Codigo, "UQ__TbMaestr__06370DAC09B6F197").IsUnique();

            entity.Property(e => e.Id).HasComment("Identificador del registro, autoincrimental");
            entity.Property(e => e.Codigo)
                .HasMaxLength(30)
                .IsUnicode(false)
                .IsFixedLength()
                .HasComment("Valor constante para acceder al registro");
            entity.Property(e => e.Descripcion)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasComment("Descripcion del maestro");
            entity.Property(e => e.FechaCreacion)
                .HasDefaultValueSql("(getdate())")
                .HasComment("Fecha de creacion del registro")
                .HasColumnType("datetime");
            entity.Property(e => e.FechaModificacion)
                .HasComment("Fecha de ultima modificacion")
                .HasColumnType("datetime");
            entity.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasComment("Nombre del maestro");
            entity.Property(e => e.TipoMaestro)
                .HasMaxLength(3)
                .IsUnicode(false)
                .IsFixedLength()
                .HasComment("Define el tipo de maestro: MAE: maestro, CFG: configuracion");
            entity.Property(e => e.UsuarioCreacion)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("sql")
                .HasComment("Nombre de usuario del registro");
            entity.Property(e => e.UsuarioModificacion)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasComment("Usuario de ultima modificacion");
        });

        modelBuilder.Entity<TbMaestroDetalle>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__TbMaestr__3214EC07F03F020C");

            entity.ToTable("TbMaestroDetalle");

            entity.HasIndex(e => e.Codigo, "UQ__TbMaestr__06370DACC1B1304A").IsUnique();

            entity.Property(e => e.Id).HasComment("Identificador del registro, autoincrimental");
            entity.Property(e => e.Codigo)
                .HasMaxLength(30)
                .IsUnicode(false)
                .IsFixedLength()
                .HasComment("Valor constante para acceder al registro");
            entity.Property(e => e.Descripcion)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasComment("Descripcion del maestro");
            entity.Property(e => e.FechaCreacion)
                .HasDefaultValueSql("(getdate())")
                .HasComment("Fecha de creacion del registro")
                .HasColumnType("datetime");
            entity.Property(e => e.FechaModificacion)
                .HasComment("Fecha de ultima modificacion")
                .HasColumnType("datetime");
            entity.Property(e => e.IdMaestro).HasComment("Identificador de la cabezera maestro");
            entity.Property(e => e.TipoMaestro)
                .HasMaxLength(3)
                .IsUnicode(false)
                .IsFixedLength()
                .HasComment("Define el tipo de maestro: MAE: maestro, CFG: configuracion");
            entity.Property(e => e.UsuarioCreacion)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("sql")
                .HasComment("Nombre de usuario del registro");
            entity.Property(e => e.UsuarioModificacion)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasComment("Usuario de ultima modificacion");
            entity.Property(e => e.Valor)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.IdMaestroNavigation).WithMany(p => p.TbMaestroDetalles)
                .HasForeignKey(d => d.IdMaestro)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TbMaestroDetalle_TbMaestro");
        });

        modelBuilder.Entity<TbProducto>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__TbProduc__3214EC07759175EE");

            entity.HasIndex(e => e.Codigo, "UQ__TbProduc__06370DAC7C1870C7").IsUnique();

            entity.Property(e => e.Id).HasComment("Identificador del registro, autoincrimental");
            entity.Property(e => e.Codigo)
                .HasMaxLength(10)
                .IsFixedLength()
                .HasComment("Codigo del producto");
            entity.Property(e => e.Descripcion)
                .HasMaxLength(10)
                .IsFixedLength()
                .HasComment("Descripcion del producto");
            entity.Property(e => e.Estado)
                .HasDefaultValue(true)
                .HasComment("0: inactivo / 1: Activo");
            entity.Property(e => e.FechaCreacion)
                .HasDefaultValueSql("(getdate())")
                .HasComment("Fecha de creacion del registro")
                .HasColumnType("datetime");
            entity.Property(e => e.FechaModificacion)
                .HasComment("Fecha de ultima modificacion")
                .HasColumnType("datetime");
            entity.Property(e => e.Nombre)
                .HasMaxLength(10)
                .IsFixedLength()
                .HasComment("Nombre del producto");
            entity.Property(e => e.UsuarioCreacion)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("sql")
                .HasComment("Nombre de usuario del registro");
            entity.Property(e => e.UsuarioModificacion)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasComment("Usuario de ultima modificacion");

            entity.HasOne(d => d.IdMaeCategoriaNavigation).WithMany(p => p.TbProductoIdMaeCategoriaNavigations)
                .HasForeignKey(d => d.IdMaeCategoria)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TbProductos_TbMaestroDetalle_Categoria");

            entity.HasOne(d => d.IdMaeMarcaNavigation).WithMany(p => p.TbProductoIdMaeMarcaNavigations)
                .HasForeignKey(d => d.IdMaeMarca)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TbProductos_TbMaestroDetalle_Marca");
        });

        modelBuilder.Entity<TbVenta>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__TbVentas__3214EC07C7C8E660");

            entity.Property(e => e.FechaCreacion)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.FechaModificacion).HasColumnType("datetime");
            entity.Property(e => e.PrecioUnitario).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.TotalBruto).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.TotalNeto).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.UsuarioCreacion)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("sql");
            entity.Property(e => e.UsuarioModificacion)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.IdClientesNavigation).WithMany(p => p.TbVenta)
                .HasForeignKey(d => d.IdClientes)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TbVentas_TbClientes_Id");

            entity.HasOne(d => d.IdMaeEstadoVentaNavigation).WithMany(p => p.TbVenta)
                .HasForeignKey(d => d.IdMaeEstadoVenta)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TbVentas_TbMaestroDetalle_id");

            entity.HasOne(d => d.IdProductosNavigation).WithMany(p => p.TbVenta)
                .HasForeignKey(d => d.IdProductos)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_TbVentas_TbProductos_Id");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
