using Galaxy.ProyectoFinal.AccesoDatos.Contexto;
using Galaxy.ProyectoFinal.Transversal.DTO.Request;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Productos;
using Galaxy.ProyectoFinal.Transversal.DTO.Response;
using Galaxy.ProyectoFinal.Transversal.DTO.Response.Productos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Repositorios.Interfaces
{
    public interface IProductosRepositorio : IRepositorioBase<TbProducto>
    {
        Task<RespuestaBaseDto<List<ProductosDtoResponse>>> ListarTodos();
        //Task<RespuestaBaseDto<ProductosDtoResponse>> ObtenerPorCodigo(string Codigo);
        //Task<RespuestaPaginationDto<ProductosDtoResponse>> Listar(PaginationDtoRequest request);
        //Task<RespuestaBaseDto<ProductosDtoResponse>> Registrar(ProductosDtoRequest request);

    }
}
