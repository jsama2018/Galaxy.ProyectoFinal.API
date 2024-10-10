using Galaxy.ProyectoFinal.AccesoDatos.Contexto;
using Galaxy.ProyectoFinal.Repositorios.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Repositorios.Implementaciones
{
    public class UsuariosRepositorio : RepositorioBase<TbUsuarios>, IUsuariosRepositorio
    {
        private ProyectoFinalContext _proyectoFinalContext;

        public UsuariosRepositorio(ProyectoFinalContext proyectoFinalContext) : base(proyectoFinalContext)
        {
            _proyectoFinalContext = proyectoFinalContext;
        }
    }
}
