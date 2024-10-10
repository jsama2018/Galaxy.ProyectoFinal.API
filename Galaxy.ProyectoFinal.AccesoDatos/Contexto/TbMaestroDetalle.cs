using System;
using System.Collections.Generic;

namespace Galaxy.ProyectoFinal.AccesoDatos.Contexto;

public partial class TbMaestroDetalle : EntidadBase
{

    /// <summary>
    /// Identificador de la cabezera maestro
    /// </summary>
    public int IdMaestro { get; set; }

    /// <summary>
    /// Valor constante para acceder al registro
    /// </summary>
    public string Codigo { get; set; } = null!;

    /// <summary>
    /// Descripcion del maestro
    /// </summary>
    public string? Descripcion { get; set; }

    public string? Valor { get; set; }

    /// <summary>
    /// Define el tipo de maestro: MAE: maestro, CFG: configuracion
    /// </summary>
    public string? TipoMaestro { get; set; }

    public virtual TbMaestro IdMaestroNavigation { get; set; } = null!;

    public virtual ICollection<TbCliente> TbClientes { get; set; } = new List<TbCliente>();

    public virtual ICollection<TbProducto> TbProductoIdMaeCategoriaNavigations { get; set; } = new List<TbProducto>();

    public virtual ICollection<TbProducto> TbProductoIdMaeMarcaNavigations { get; set; } = new List<TbProducto>();

    public virtual ICollection<TbVenta> TbVenta { get; set; } = new List<TbVenta>();
}
