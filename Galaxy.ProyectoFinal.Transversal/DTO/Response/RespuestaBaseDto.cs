using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Transversal.DTO.Response
{
    public class RespuestaBaseDto
    {
        public string message { get; set; }
        public bool success { get; set; }

    }

    public class RespuestaBaseDto<T> : RespuestaBaseDto
    { 
        public T? Data { get; set; }

    }
}
