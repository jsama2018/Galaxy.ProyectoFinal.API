﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Transversal.DTO.Request.Ventas
{
    public class VentasDtoRequest
    {
        public int IdClientes { get; set; }

        public int IdProductos { get; set; }

        public int IdMaeEstadoVenta { get; set; }

        public int Stock { get; set; }

        public decimal PrecioUnitario { get; set; }

        public decimal TotalBruto { get; set; }

        public decimal TotalNeto { get; set; }
    }
}