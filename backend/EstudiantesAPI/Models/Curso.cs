using System.ComponentModel.DataAnnotations.Schema;

namespace EstudiantesAPI.Models
{
    [Table("cursos")]
    public class Curso 
    {
        public int id { get; set; }
        public string? codigo { get; set; }
        public string? nombre { get; set; }
        public int creditos { get; set; }
        public string? docente { get; set; }
    }
}