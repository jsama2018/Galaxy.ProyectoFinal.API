using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Transversal.DTO.Response.Productos
{
    public class ProductosDtoResponse
    {
        public int Id { get; set; }
        public string Codigo {  get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Marca { get; set; }
        public string Categoria { get; set; }
    }
}
