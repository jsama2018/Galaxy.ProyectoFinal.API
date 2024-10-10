using Galaxy.ProyectoFinal.AccesoDatos.Contexto;
using Galaxy.ProyectoFinal.Repositorios.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Repositorios.Implementaciones
{
    public class ClientesRepositorio : RepositorioBase<TbCliente>, IClientesRepositorio
    {
        private ProyectoFinalContext _proyectoFinalContext;

        public ClientesRepositorio(ProyectoFinalContext proyectoFinalContext) : base(proyectoFinalContext)
        {
            _proyectoFinalContext = proyectoFinalContext;
        }


    }
}
