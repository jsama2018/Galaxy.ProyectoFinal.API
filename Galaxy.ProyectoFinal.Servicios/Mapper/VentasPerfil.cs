using AutoMapper;
using Galaxy.ProyectoFinal.AccesoDatos.Contexto;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Clientes;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Ventas;
using Galaxy.ProyectoFinal.Transversal.DTO.Response.Clientes;
using Galaxy.ProyectoFinal.Transversal.DTO.Response.Ventas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Servicios.Mapper
{
    public class VentasPerfil : Profile
    {
        public VentasPerfil()
        {
            CreateMap<TbVenta, VentasDtoResponse>();
            CreateMap<VentasDtoRequest, TbVenta>();
        }
    }
}
