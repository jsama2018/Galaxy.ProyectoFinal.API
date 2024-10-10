using Galaxy.ProyectoFinal.Servicios.Interfaces;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Clientes;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Galaxy.ProyectoFinal.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientesController : ControllerBase
    {
        private IClientesServicio _servicio;

        public ClientesController(IClientesServicio servicio)
        {
            _servicio = servicio;
        }
        [HttpGet]
        public async Task<IActionResult> Get() {
            var respuesta =await _servicio.Listar();
            return respuesta.success ? Ok(respuesta) : BadRequest(respuesta);
        }
        [HttpGet("GetByCodigo/{documento}")]
        public async Task<IActionResult> Getall(string documento)
        {
            var resultado = await _servicio.ObtenerPordocumento(documento);

            if (resultado.success)
                return Ok(resultado);
            else
                return BadRequest(resultado);
        }
        [HttpPost]
        public async Task<IActionResult> Post(ClienteDtoRequest request)
        {
            var resultado = await _servicio.Registrar(request);
            return resultado.success ? Ok(resultado) : BadRequest(resultado);
        }
    }
}
