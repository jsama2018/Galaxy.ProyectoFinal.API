using Galaxy.ProyectoFinal.Transversal.DTO.Request.Clientes;
using Galaxy.ProyectoFinal.Transversal.DTO.Response.Clientes;
using Galaxy.ProyectoFinal.Transversal.DTO.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Galaxy.ProyectoFinal.Transversal.DTO.Response.Ventas;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Ventas;

namespace Galaxy.ProyectoFinal.Servicios.Interfaces
{
    public interface IVentasServicio
    {
        Task<RespuestaBaseDto<VentasDtoResponse>> Registrar(VentasDtoRequest request);
    }
}
