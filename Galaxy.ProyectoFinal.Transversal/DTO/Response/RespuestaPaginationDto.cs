using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Transversal.DTO.Response
{
    public class RespuestaPaginationDto<T> : RespuestaBaseDto
    {
        public List<T>? Data { get; set; }
        public int TotalPagina { get; set; }
        public int TotalFilas { get; set; }
    }
}
