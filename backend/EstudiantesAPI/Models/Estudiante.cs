using System.ComponentModel.DataAnnotations.Schema;

namespace EstudiantesAPI.Models
{
    [Table("estudiantes")]
    public class Estudiante
    {
        public int id { get; set; }
        public string? codigo { get; set; }
        public string? nombres { get; set; }
        public string? apellidos { get; set; }
        public string? correo { get; set; }
        public string? carrera { get; set; }
    }
}