using Galaxy.ProyectoFinal.Transversal.DTO.Response.Productos;
using Galaxy.ProyectoFinal.Transversal.DTO.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Galaxy.ProyectoFinal.Transversal.DTO.Request;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Productos;

namespace Galaxy.ProyectoFinal.Servicios.Interfaces
{
    public interface IProductoServicio
    {
        Task<RespuestaBaseDto<ProductosDtoResponse>> ObtenerPorCodigo(string Codigo);
        Task<RespuestaPaginationDto<ProductosDtoResponse>> Listar(PaginationDtoRequest request);
        Task<RespuestaBaseDto<ProductosDtoResponse>> Registrar(ProductosDtoRequest request);
    }
}
