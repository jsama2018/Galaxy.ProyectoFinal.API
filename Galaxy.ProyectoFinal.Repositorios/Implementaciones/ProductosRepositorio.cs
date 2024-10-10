using Galaxy.ProyectoFinal.AccesoDatos.Contexto;
using Galaxy.ProyectoFinal.Repositorios.Interfaces;
using Galaxy.ProyectoFinal.Transversal.DTO.Request;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Productos;
using Galaxy.ProyectoFinal.Transversal.DTO.Response;
using Galaxy.ProyectoFinal.Transversal.DTO.Response.Productos;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Galaxy.ProyectoFinal.Repositorios.Implementaciones
{
    public class ProductosRepositorio : RepositorioBase<TbProducto>, IProductosRepositorio
    {

        private ProyectoFinalContext _proyectoFinalContext;

        public ProductosRepositorio(ProyectoFinalContext proyectoFinalContext) : base(proyectoFinalContext) {
            _proyectoFinalContext = proyectoFinalContext;
        }

        public async Task<RespuestaBaseDto<List<ProductosDtoResponse>>> ListarTodos()
        {
            RespuestaBaseDto<List<ProductosDtoResponse>> respuesta = new RespuestaBaseDto<List<ProductosDtoResponse>>();

            try
            {
                var resultado = await ListAsync();
                var listaProducto = ( from item in resultado
                                      select new ProductosDtoResponse
                                      {
                                          Categoria = item.IdMaeCategoria.ToString(),
                                          Descripcion = item.Descripcion,
                                          Marca =  item.IdMaeMarca.ToString(),
                                          Id = item.Id,
                                          Nombre = item.Nombre,
                                          Codigo = item.Codigo
                                      }).ToList();

                respuesta.Data = listaProducto;
                respuesta.success = true;

            }
            catch (Exception ex) {
                respuesta.success = false;
                respuesta.message = ex.Message;
            }
            return respuesta;
        }
        //public async Task<RespuestaBaseDto<ProductosDtoResponse>> ObtenerPorCodigo(string Codigo)
        //{
        //    RespuestaBaseDto<ProductosDtoResponse> respuesta = new RespuestaBaseDto<ProductosDtoResponse>();
        //    try
        //    {
        //        var resultado = await (from item in _proyectoFinalContext.TbProductos
        //                               where item.Codigo.Equals(Codigo)
        //                               select new ProductosDtoResponse
        //                               {
        //                                   Codigo = item.Codigo,
        //                                   Nombre = item.Nombre,
        //                                   Descripcion = item.Descripcion,
        //                                   Id = item.Id,
        //                                   Marca = item.IdMaeMarcaNavigation.Valor!,
        //                                   Categoria = item.IdMaeCategoriaNavigation.Valor!

        //                               })
        //                         .AsNoTracking()
        //                         .FirstOrDefaultAsync();

        //        respuesta.Data = resultado;
        //        respuesta.success = true;
        //        respuesta.message = "Obtener producto por codigo";

        //    }
        //    catch (Exception ex)
        //    {
        //        respuesta.success = false;
        //        respuesta.message = ex.Message;
        //    }
        //    return respuesta;

        //}

        //public async Task<RespuestaPaginationDto<ProductosDtoResponse>> Listar(PaginationDtoRequest request)
        //{
        //    RespuestaPaginationDto<ProductosDtoResponse> respuesta = new RespuestaPaginationDto<ProductosDtoResponse>();
        //    try {
        //        var resultado = await (from item in _proyectoFinalContext.TbProductos
        //                         select new ProductosDtoResponse
        //                         {
        //                             Codigo = item.Codigo,
        //                             Nombre = item.Nombre,
        //                             Descripcion = item.Descripcion,
        //                             Id = item.Id,
        //                             Marca = item.IdMaeMarcaNavigation.Valor!,
        //                             Categoria = item.IdMaeCategoriaNavigation.Valor!

        //                         })
        //                         .Skip((request.NumeroPagina - 1) * request.TotalFilas)
        //                         .Take(request.TotalFilas)
        //                         .AsNoTracking()
        //                         .ToListAsync();

        //        var total = await _proyectoFinalContext.TbProductos.CountAsync();

        //        respuesta.Data = resultado;
        //        respuesta.TotalFilas = resultado.Count;
        //        respuesta.TotalPagina = (int)Math.Ceiling((double)total / request.TotalFilas);
        //        respuesta.success = true;
        //        respuesta.message = "Listado de productos exitoso";

        //    }
        //    catch (Exception ex)
        //    {
        //        respuesta.success = false;
        //        respuesta.message = ex.Message;
        //    }
        //    return respuesta;

        //}

        //public async Task<RespuestaBaseDto<ProductosDtoResponse>> Registrar(ProductosDtoRequest request)
        //{
        //    RespuestaBaseDto<ProductosDtoResponse> respuesta = new RespuestaBaseDto<ProductosDtoResponse>();
        //    try {
        //        TbProducto tbProducto = new()
        //        {
        //            Codigo = request.Codigo,
        //            Nombre = request.Nombre,
        //            Descripcion = request.Descripcion,
        //            IdMaeCategoria = request.IdCategoria,
        //            IdMaeMarca = request.IdMarca
        //        };

        //        var resultado = await _proyectoFinalContext.TbProductos.AddAsync(tbProducto);
        //        await _proyectoFinalContext.SaveChangesAsync();

        //        ProductosDtoResponse nuevo = new()
        //        {
        //            Codigo =  resultado.Entity.Codigo,
        //            Nombre = resultado.Entity.Nombre,
        //            Descripcion = resultado.Entity.Descripcion,
        //            Id = resultado.Entity.Id
        //        };

        //        respuesta.Data = nuevo;
        //        respuesta.success = true;
        //        respuesta.message = "Registro de producto exitoso";
        //    }
        //    catch(Exception ex) {
        //        respuesta.success = false;
        //        respuesta.message = ex.Message;
        //    }
        //    return respuesta;
        //}
    }
}
