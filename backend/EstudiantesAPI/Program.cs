using Microsoft.EntityFrameworkCore;
using EstudiantesAPI.Data;

var builder = WebApplication.CreateBuilder(args);

var conexion = builder.Configuration.GetConnectionString("ConexionBD");
builder.Services.AddDbContext<AppDbContext>(opciones => 
    opciones.UseMySql(conexion, ServerVersion.AutoDetect(conexion)));

builder.Services.AddCors(opciones => {
    opciones.AddPolicy("PermitirTodo", policy => {
        policy.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader();
    });
});

builder.Services.AddControllers();
var app = builder.Build();

app.UseCors("PermitirTodo");
app.MapControllers();
app.Run();