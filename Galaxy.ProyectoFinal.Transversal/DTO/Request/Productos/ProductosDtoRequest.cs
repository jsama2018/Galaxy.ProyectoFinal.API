using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Transversal.DTO.Request.Productos
{
    public class ProductosDtoRequest
    {
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int IdMaeMarca { get; set; }
        public int IdMaeCategoria { get; set; }

    }
}
