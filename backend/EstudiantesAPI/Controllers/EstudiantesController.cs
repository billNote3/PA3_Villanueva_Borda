using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using EstudiantesAPI.Data;
using EstudiantesAPI.Models;

namespace EstudiantesAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class EstudiantesController : ControllerBase
    {
        private readonly AppDbContext _context;

        public EstudiantesController(AppDbContext context)
        {
            _context = context;
        }

        // 1. LISTAR (GET)
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Estudiante>>> Get() 
        {
            return await _context.Estudiantes.ToListAsync();
        }

        // 2. REGISTRAR (POST)
        [HttpPost]
        public async Task<ActionResult> Post([FromBody] Estudiante nuevoEstudiante) 
        {
            _context.Estudiantes.Add(nuevoEstudiante);
            await _context.SaveChangesAsync();
            return Ok(nuevoEstudiante);
        }


        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Estudiante estudianteActualizado)
        {
            var estudiante = await _context.Estudiantes.FindAsync(id);
            if (estudiante == null) return NotFound("Estudiante no encontrado");

            // Estas propiedades deben coincidir exactamente con Estudiante.cs
            estudiante.codigo = estudianteActualizado.codigo;
            estudiante.nombres = estudianteActualizado.nombres;
            estudiante.apellidos = estudianteActualizado.apellidos;
            estudiante.correo = estudianteActualizado.correo;
            estudiante.carrera = estudianteActualizado.carrera;

            await _context.SaveChangesAsync();
            return Ok(estudiante);
        }

        // 4. ELIMINAR (DELETE) - NUEVO PARA LA RÚBRICA
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var estudiante = await _context.Estudiantes.FindAsync(id);
            if (estudiante == null) return NotFound("Estudiante no encontrado");

            _context.Estudiantes.Remove(estudiante);
            await _context.SaveChangesAsync();
            return Ok(new { message = "Estudiante eliminado correctamente" });
        }
    }
}