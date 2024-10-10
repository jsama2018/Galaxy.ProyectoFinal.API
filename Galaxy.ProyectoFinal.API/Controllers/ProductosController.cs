using Galaxy.ProyectoFinal.Repositorios.Interfaces;
using Galaxy.ProyectoFinal.Servicios.Interfaces;
using Galaxy.ProyectoFinal.Transversal.DTO.Request;
using Galaxy.ProyectoFinal.Transversal.DTO.Request.Productos;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Galaxy.ProyectoFinal.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductosController : ControllerBase
    {
        private IProductoServicio _servicio;

        public ProductosController(IProductoServicio servicio)
        {
            _servicio = servicio;
        }
        [HttpGet("GetByCodigo/{Codigo}")]
        public async Task<IActionResult> Get(string Codigo)
        {
            var resultado = await _servicio.ObtenerPorCodigo(Codigo);

            if (resultado.success)
                return Ok(resultado);
            else
                return BadRequest(resultado);
        }

        //[HttpGet]
        //public async Task<IActionResult> Get([FromQuery] PaginationDtoRequest request)
        //{
        //    var resultado = await _productosRepositorio.Listar(request);

        //    if (resultado.success)
        //        return Ok(resultado);
        //    else
        //        return BadRequest(resultado);

        //}

        //[HttpGet("ListarTodos")]
        //public async Task<IActionResult> GetAll()
        //{
        //    var resultado = await _productosRepositorio.ListarTodos();

        //    if (resultado.success)
        //        return Ok(resultado);
        //    else
        //        return BadRequest(resultado);

        //}

        [HttpPost]
        public async Task<IActionResult> Post(ProductosDtoRequest request)
        {
            var resultado = await _servicio.Registrar(request);

            if (resultado.success)
                return Ok(resultado);
            else
                return BadRequest(resultado);
        }
    }
}
