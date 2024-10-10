using AutoMapper;
using Galaxy.ProyectoFinal.AccesoDatos.Contexto;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Productos;
using Galaxy.ProyectoFinal.Transversal.DTO.Response.Productos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Servicios.Mapper
{
    public class ProductosPerfil : Profile
    {
        public ProductosPerfil()
        {
            CreateMap<TbProducto, ProductosDtoResponse>();
            CreateMap<ProductosDtoRequest, TbProducto>();
        }
    }
}
