using Galaxy.ProyectoFinal.Servicios.Interfaces;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Clientes;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Ventas;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Galaxy.ProyectoFinal.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VentasController : ControllerBase
    {
        private IVentasServicio _servicio;

        public VentasController(IVentasServicio servicio)
        {
            _servicio = servicio;
        }
        [HttpPost]
        public async Task<IActionResult> Post(VentasDtoRequest request)
        {
            var resultado = await _servicio.Registrar(request);
            return resultado.success ? Ok(resultado) : BadRequest(resultado);
        }
    }
}
