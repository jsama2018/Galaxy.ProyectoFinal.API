using AutoMapper;
using Galaxy.ProyectoFinal.AccesoDatos.Contexto;
using Galaxy.ProyectoFinal.Repositorios.Interfaces;
using Galaxy.ProyectoFinal.Servicios.Interfaces;
using Galaxy.ProyectoFinal.Transversal.DTO.Request;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Productos;
using Galaxy.ProyectoFinal.Transversal.DTO.Response;
using Galaxy.ProyectoFinal.Transversal.DTO.Response.Productos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Servicios.Implementaciones
{
    public class ProductoServicio : IProductoServicio
    {
        private readonly IProductosRepositorio _repositorio;
        private readonly IMapper _mapper;

        public ProductoServicio(IProductosRepositorio repositorio, IMapper mapper)
        {
            _repositorio = repositorio;
            _mapper = mapper;
        }

        public Task<RespuestaPaginationDto<ProductosDtoResponse>> Listar(PaginationDtoRequest request)
        {
            throw new NotImplementedException();
        }

        public async Task<RespuestaBaseDto<ProductosDtoResponse>> ObtenerPorCodigo(string Codigo)
        {
            RespuestaBaseDto<ProductosDtoResponse> respuesta = new RespuestaBaseDto<ProductosDtoResponse>();
            try
            {
                var resultado = await _repositorio.ListAsync(
                    predicado: p => p.Codigo.Equals(Codigo),
                    selector: p => new ProductosDtoResponse
                    {
                        Codigo = p.Codigo,
                        Nombre = p.Nombre,
                        Descripcion = p.Descripcion,
                        Id = p.Id,
                        Categoria = p.IdMaeCategoriaNavigation.Valor,
                        Marca = p.IdMaeMarcaNavigation.Valor
                    });

                respuesta.Data = resultado.FirstOrDefault();
                respuesta.success = true;
                respuesta.message = "Producto encontrado";
            }
            catch (Exception ex)
            {
                respuesta.success = false;
                respuesta.message = ex.Message;
            }
            return respuesta;
        }

        public async Task<RespuestaBaseDto<ProductosDtoResponse>> Registrar(ProductosDtoRequest request)
        {
            RespuestaBaseDto<ProductosDtoResponse> respuesta = new();
            try
            {
                var producto = _mapper.Map<TbProducto>(request);
                var nuevo = await _repositorio.AddAsync(producto);
                var result = _mapper.Map<ProductosDtoResponse>(nuevo);

                respuesta.Data = result;
                respuesta.success = true;
                respuesta.message = "Producto registrado exitosamente";
            }
            catch (Exception ex)
            {
                respuesta.success = false;
                respuesta.message = ex.Message;
            }
            return respuesta;
        }
    }
}
