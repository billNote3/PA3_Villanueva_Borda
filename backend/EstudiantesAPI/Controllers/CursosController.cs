    using Microsoft.AspNetCore.Mvc;
    using Microsoft.EntityFrameworkCore;
    using EstudiantesAPI.Data;
    using EstudiantesAPI.Models;

    namespace EstudiantesAPI.Controllers
    {
        [ApiController]
        [Route("api/[controller]")]
        public class CursosController : ControllerBase
        {
            private readonly AppDbContext _context;

            public CursosController(AppDbContext context) { _context = context; }

[HttpGet]
public async Task<ActionResult<IEnumerable<Curso>>> Get() 
{
    try {
        return await _context.Cursos.ToListAsync();
    } catch (Exception ex) {
        return BadRequest(ex.Message); 
    }
}

            [HttpPost]
            public async Task<ActionResult> Post([FromBody] Curso nuevoCurso) 
            {
                _context.Cursos.Add(nuevoCurso);
                await _context.SaveChangesAsync();
                return Ok(nuevoCurso);
            }

            [HttpPut("{id}")]
            public async Task<IActionResult> Put(int id, [FromBody] Curso cursoActualizado)
            {
                var curso = await _context.Cursos.FindAsync(id);
                if (curso == null) return NotFound("Curso no encontrado");

                curso.codigo = cursoActualizado.codigo;
                curso.nombre = cursoActualizado.nombre;
                curso.creditos = cursoActualizado.creditos;
                curso.docente = cursoActualizado.docente;

                await _context.SaveChangesAsync();
                return Ok(curso);
            }

            [HttpDelete("{id}")]
            public async Task<IActionResult> Delete(int id)
            {
                var curso = await _context.Cursos.FindAsync(id);
                if (curso == null) return NotFound("Curso no encontrado");

                _context.Cursos.Remove(curso);
                await _context.SaveChangesAsync();
                return Ok(new { message = "Curso eliminado" });
            }
        }
    }