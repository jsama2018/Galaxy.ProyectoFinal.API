using System;
using System.Collections.Generic;

namespace Galaxy.ProyectoFinal.AccesoDatos.Contexto;

public partial class TbMaestro : EntidadBase
{

    /// <summary>
    /// Valor constante para acceder al registro
    /// </summary>
    public string Codigo { get; set; } = null!;

    /// <summary>
    /// Nombre del maestro
    /// </summary>
    public string Nombre { get; set; } = null!;

    /// <summary>
    /// Descripcion del maestro
    /// </summary>
    public string? Descripcion { get; set; }

    /// <summary>
    /// Define el tipo de maestro: MAE: maestro, CFG: configuracion
    /// </summary>
    public string? TipoMaestro { get; set; }

    
    public virtual ICollection<TbMaestroDetalle> TbMaestroDetalles { get; set; } = new List<TbMaestroDetalle>();
}
