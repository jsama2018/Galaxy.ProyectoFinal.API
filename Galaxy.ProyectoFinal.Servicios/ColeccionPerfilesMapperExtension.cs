using AutoMapper;
using Galaxy.ProyectoFinal.Servicios.Mapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Servicios
{
    public static class ColeccionPerfilesMapperExtension
    {
        public static IMapperConfigurationExpression AddPerfilesMapper(this IMapperConfigurationExpression config)
        {
  
            config.AddProfile<ProductosPerfil>();
            config.AddProfile<ClientePerfil>();
            config.AddProfile<VentasPerfil>();
            return config;
        }
    }
}
