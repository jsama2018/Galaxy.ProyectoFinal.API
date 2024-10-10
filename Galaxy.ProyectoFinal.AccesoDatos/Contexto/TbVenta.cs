using System;
using System.Collections.Generic;

namespace Galaxy.ProyectoFinal.AccesoDatos.Contexto;

public partial class TbVenta :  EntidadBase
{

    public int IdClientes { get; set; }

    public int IdProductos { get; set; }

    public int IdMaeEstadoVenta { get; set; }

    public int Stock { get; set; }

    public decimal PrecioUnitario { get; set; }

    public decimal TotalBruto { get; set; }

    public decimal TotalNeto { get; set; }

    public virtual TbCliente IdClientesNavigation { get; set; } = null!;

    public virtual TbMaestroDetalle IdMaeEstadoVentaNavigation { get; set; } = null!;

    public virtual TbProducto IdProductosNavigation { get; set; } = null!;
}
