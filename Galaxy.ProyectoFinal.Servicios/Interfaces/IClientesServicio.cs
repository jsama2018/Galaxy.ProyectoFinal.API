using Galaxy.ProyectoFinal.Transversal.DTO.Request.Productos;
using Galaxy.ProyectoFinal.Transversal.DTO.Request;
using Galaxy.ProyectoFinal.Transversal.DTO.Response.Productos;
using Galaxy.ProyectoFinal.Transversal.DTO.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Galaxy.ProyectoFinal.Transversal.DTO.Response.Clientes;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Clientes;

namespace Galaxy.ProyectoFinal.Servicios.Interfaces
{
    public interface IClientesServicio
    {
        Task<RespuestaBaseDto<ClientesDtoResponse>> ObtenerPordocumento(string Codigo);
        Task<RespuestaBaseDto<ClientesDtoResponse>> Registrar(ClienteDtoRequest request);
        Task<RespuestaBaseDto<List<ClientesDtoResponse>>> Listar();
    }
}
