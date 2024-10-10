using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Transversal.DTO.Request.Clientes
{
    public class ClienteDtoRequest
    {
        
        /// <summary>
        /// Razon social del cliente
        /// </summary>
        public string? RazonSocial { get; set; }

        
        /// <summary>
        /// Nombre comercial o nombre y apellidos del cliente
        /// </summary>
        public string Nombre { get; set; } = null!;


        
        /// <summary>
        /// Numero de documento de identidad
        /// </summary>
        public string DocumentoIdentidad { get; set; } = null!;

        
        /// <summary>
        /// Identificador del tipo de documento de identidad - Maestro
        /// </summary>
        public int IdMaeTipoDocumento { get; set; }

    }
}
