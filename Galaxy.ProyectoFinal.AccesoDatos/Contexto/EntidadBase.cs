using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.AccesoDatos.Contexto
{
    public class EntidadBase
    {
        /// <summary>
        /// Identificador del registro, autoincrimental
        /// </summary>
        public int Id { get; set; }
     
        /// <summary>
        /// 0: inactivo / 1: Activo
        /// </summary>
        public bool Estado { get; set; } = true;

        /// <summary>
        /// Fecha de creacion del registro
        /// </summary>
        public DateTime FechaCreacion { get; set; } = DateTime.Now;

        /// <summary>
        /// Nombre de usuario del registro
        /// </summary>
        public string UsuarioCreacion { get; set; } = Environment.UserName;

        /// <summary>
        /// Fecha de ultima modificacion
        /// </summary>
        public DateTime? FechaModificacion { get; set; }

        /// <summary>
        /// Usuario de ultima modificacion
        /// </summary>
        public string? UsuarioModificacion { get; set; }
    }
}
