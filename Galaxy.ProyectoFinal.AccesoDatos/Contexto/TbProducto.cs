using System;
using System.Collections.Generic;

namespace Galaxy.ProyectoFinal.AccesoDatos.Contexto;

public partial class TbProducto : EntidadBase
{
 
    /// <summary>
    /// Codigo del producto
    /// </summary>
    public string Codigo { get; set; } = null!;

    /// <summary>
    /// Nombre del producto
    /// </summary>
    public string Nombre { get; set; } = null!;

    /// <summary>
    /// Descripcion del producto
    /// </summary>
    public string Descripcion { get; set; } = null!;
        
    public int IdMaeMarca { get; set; }

    public int IdMaeCategoria { get; set; }

    public virtual TbMaestroDetalle IdMaeCategoriaNavigation { get; set; } = null!;

    public virtual TbMaestroDetalle IdMaeMarcaNavigation { get; set; } = null!;

    public virtual ICollection<TbVenta> TbVenta { get; set; } = new List<TbVenta>();
}
