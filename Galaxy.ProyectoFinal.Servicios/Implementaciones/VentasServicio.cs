using AutoMapper;
using Galaxy.ProyectoFinal.AccesoDatos.Contexto;
using Galaxy.ProyectoFinal.Repositorios.Interfaces;
using Galaxy.ProyectoFinal.Servicios.Interfaces;
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

namespace Galaxy.ProyectoFinal.Servicios.Implementaciones
{
    public class VentasServicio : IVentasServicio
    {
        private readonly IVentasRepositorio _repositorio;
        private readonly IMapper _mapper;

        public VentasServicio(IVentasRepositorio repositorio, IMapper mapper)
        {
            _repositorio = repositorio;
            _mapper = mapper;
        }

        public async Task<RespuestaBaseDto<VentasDtoResponse>> Registrar(VentasDtoRequest request)
        {
            RespuestaBaseDto<VentasDtoResponse> respuesta = new();
            try
            {
                var venta = _mapper.Map<TbVenta>(request);
                var nuevo = await _repositorio.AddAsync(venta);
                respuesta.Data = _mapper.Map<VentasDtoResponse>(nuevo);
                respuesta.success = true;
                respuesta.message = "Venta registrada exitosamente";
                return respuesta;
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
