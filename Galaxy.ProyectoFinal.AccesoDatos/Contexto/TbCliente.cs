using System;
using System.Collections.Generic;

namespace Galaxy.ProyectoFinal.AccesoDatos.Contexto;

public partial class TbCliente : EntidadBase
{

    /// <summary>
    /// Numero de documento de identidad
    /// </summary>
    public string DocumentoIdentidad { get; set; } = null!;

    /// <summary>
    /// Razon social
    /// </summary>
    public string RazonSocial { get; set; } = null!;

    /// <summary>
    /// Nombre cliente
    /// </summary>
    public string Nombre { get; set; } = null!;

    /// <summary>
    /// Identificador del tipo de documento de identidad
    /// </summary>
    public int IdMaeTipoDocumento { get; set; }

    public virtual TbMaestroDetalle IdMaeTipoDocumentoNavigation { get; set; } = null!;

    public virtual ICollection<TbVenta> TbVenta { get; set; } = new List<TbVenta>();
}
