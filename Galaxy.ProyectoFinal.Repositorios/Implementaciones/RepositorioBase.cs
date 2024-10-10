using Galaxy.ProyectoFinal.AccesoDatos.Contexto;
using Galaxy.ProyectoFinal.Repositorios.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Repositorios.Implementaciones
{
    public class RepositorioBase<TEntity> : IRepositorioBase<TEntity> where TEntity : EntidadBase
    {
        protected readonly ProyectoFinalContext Contexto;

        public RepositorioBase(ProyectoFinalContext contexto)
        {
            Contexto = contexto;
        }

        public async Task<ICollection<TEntity>> ListAsync()
        {
            return await Contexto.Set<TEntity>()
                .Where(p => p.Estado)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<ICollection<TEntity>> ListAsync(Expression<Func<TEntity, bool>> predicado)
        {
            return await Contexto.Set<TEntity>()
                .Where(predicado)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<ICollection<TInfo>> ListAsync<TInfo>(
            Expression<Func<TEntity, bool>> predicado,
            Expression<Func<TEntity, TInfo>> selector)
        {
            var resultado = await Contexto.Set<TEntity>()
                .Where(predicado)
                .AsNoTracking()
                .Select(selector)
                .ToListAsync();

            var total = await Contexto.Set<TEntity>()
                .Where(predicado)
                .CountAsync();

            return (resultado);
        }
        public async Task<(ICollection<TInfo> Collection, int TotalRegistros)> ListAsync<TInfo, TKey>(
            Expression<Func<TEntity, bool>> predicado,
            Expression<Func<TEntity, TInfo>> selector,
            Expression<Func<TEntity, TKey>> orderBy,
            int pagina = 1, int filas = 5)
        {
            var resultado = await Contexto.Set<TEntity>()
                .Where(predicado)
                .AsNoTracking()
                .OrderBy(orderBy)
                .Skip((pagina -1)* filas)
                .Take(filas)
                .Select(selector)
                .ToListAsync();

            var total = await Contexto.Set<TEntity>()
                .Where(predicado)
                .CountAsync();

            return (resultado, total);
        }

        public async Task<TEntity?> FindByIdAsync(int id)
        {
            return await Contexto.Set<TEntity>().FindAsync(id);
        }
        public async Task<TEntity?> AddAsync(TEntity entity)
        { 
            var resultado = await Contexto.Set<TEntity>().AddAsync(entity);
            await Contexto.SaveChangesAsync();
            return resultado.Entity;
        }

    }
}
