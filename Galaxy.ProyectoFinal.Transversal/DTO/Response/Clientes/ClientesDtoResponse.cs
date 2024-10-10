using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Transversal.DTO.Response.Clientes
{
    public class ClientesDtoResponse
    {
        public int Id { get; set; }
        public string DocumentoIdentidad { get; set; }
        public string RazonSocial { get; set; }
        public string Nombre { get; set; }
        public string TipoDocumento { get; set; }
    }
}
