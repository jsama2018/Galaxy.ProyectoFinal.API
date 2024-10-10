using Galaxy.ProyectoFinal.AccesoDatos.Contexto;
using Galaxy.ProyectoFinal.Repositorios.Implementaciones;
using Galaxy.ProyectoFinal.Repositorios.Interfaces;
using Galaxy.ProyectoFinal.Servicios;
using Galaxy.ProyectoFinal.Servicios.Implementaciones;
using Galaxy.ProyectoFinal.Servicios.Interfaces;
using Galaxy.ProyectoFinal.Servicios.Mapper;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<ProyectoFinalContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("ProyectoFinal"));
});

builder.Services.AddAutoMapper(config => ColeccionPerfilesMapperExtension.AddPerfilesMapper(config));

builder.Services.AddScoped<IProductosRepositorio, ProductosRepositorio>();
builder.Services.AddScoped<IProductoServicio, ProductoServicio>();
builder.Services.AddScoped<IClientesRepositorio, ClientesRepositorio>();
builder.Services.AddScoped<IClientesServicio, ClienteServicio>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
