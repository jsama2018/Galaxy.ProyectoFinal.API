using AutoMapper;
using Galaxy.ProyectoFinal.AccesoDatos.Contexto;
using Galaxy.ProyectoFinal.Repositorios.Interfaces;
using Galaxy.ProyectoFinal.Servicios.Interfaces;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Clientes;
using Galaxy.ProyectoFinal.Transversal.DTO.Response;
using Galaxy.ProyectoFinal.Transversal.DTO.Response.Clientes;
using Galaxy.ProyectoFinal.Transversal.DTO.Response.Productos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Servicios.Implementaciones
{
    public class ClienteServicio : IClientesServicio
    {
        private readonly IClientesRepositorio _repositorio;
        private readonly IMapper _mapper;

        public ClienteServicio(IClientesRepositorio repositorio, IMapper mapper)
        {
            _repositorio = repositorio;
            _mapper= mapper;
        }

        public async Task<RespuestaBaseDto<List<ClientesDtoResponse>>> Listar()
        {
            RespuestaBaseDto<List<ClientesDtoResponse>> respuesta = new RespuestaBaseDto<List<ClientesDtoResponse>>();

            try
            {
                var resultado =await _repositorio.ListAsync(
                    predicado: p => true,
                    selector: p=> _mapper.Map<ClientesDtoResponse>(p)
                    );
                respuesta.Data = resultado.ToList();
                respuesta.success = true;
            }
            catch (Exception ex) 
            {
                respuesta.success = false;
                respuesta.message = ex.Message;
            }
            return respuesta;
        }
        public async Task<RespuestaBaseDto<ClientesDtoResponse>> ObtenerPordocumento(string documento)
        {
            RespuestaBaseDto<ClientesDtoResponse> respuesta = new RespuestaBaseDto<ClientesDtoResponse>();
            try
            {
                var resultado = await _repositorio.ListAsync(
                    predicado: p => p.DocumentoIdentidad.Equals(documento),
                    selector: p => new ClientesDtoResponse
                    {
                        DocumentoIdentidad = p.DocumentoIdentidad,
                        Nombre = p.Nombre,
                        RazonSocial = p.RazonSocial,
                        Id = p.Id,
                        TipoDocumento = p.IdMaeTipoDocumentoNavigation.Valor
                    });

                respuesta.Data = resultado.FirstOrDefault();
                respuesta.success = true;
                respuesta.message = "Cliente encontrado";
            }
            catch (Exception ex)
            {
                respuesta.success = false;
                respuesta.message = ex.Message;
            }
            return respuesta;
        }
        public async Task<RespuestaBaseDto<ClientesDtoResponse>> Registrar(ClienteDtoRequest request)
        {
            RespuestaBaseDto<ClientesDtoResponse> respuesta = new();
            try
            {
                var cliente = _mapper.Map<TbCliente>(request);
                var nuevo = await _repositorio.AddAsync(cliente);
                respuesta.Data = _mapper.Map<ClientesDtoResponse>(nuevo);
                respuesta.success = true;
                respuesta.message = "Cliente registrado exitosamente";
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
