using AutoMapper;
using Galaxy.ProyectoFinal.AccesoDatos.Contexto;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Clientes;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Productos;
using Galaxy.ProyectoFinal.Transversal.DTO.Response.Clientes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Servicios.Mapper
{
    public class ClientePerfil : Profile
    {
        public ClientePerfil() {
            CreateMap<TbCliente, ClientesDtoResponse>();
            CreateMap<ClienteDtoRequest, TbCliente>();
        }
    }
}
