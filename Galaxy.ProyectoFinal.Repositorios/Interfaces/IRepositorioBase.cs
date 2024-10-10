using Galaxy.ProyectoFinal.AccesoDatos.Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Galaxy.ProyectoFinal.Repositorios.Interfaces
{
    public interface IRepositorioBase<TEntity> where TEntity : EntidadBase
    {
        Task<ICollection<TEntity>> ListAsync();
        Task<ICollection<TEntity>> ListAsync(Expression<Func<TEntity, bool>> predicado);
        Task<ICollection<TInfo>> ListAsync<TInfo>(
            Expression<Func<TEntity, bool>> predicado,
            Expression<Func<TEntity, TInfo>> selector);
        Task<(ICollection<TInfo> Collection, int TotalRegistros)> ListAsync<TInfo, TKey>(
            Expression<Func<TEntity, bool>> predicado,
            Expression<Func<TEntity, TInfo>> selector,
            Expression<Func<TEntity, TKey>> orderBy,
            int pagina = 1, int filas = 5);
        Task<TEntity?> FindByIdAsync(int id);
        Task<TEntity?> AddAsync(TEntity entity);
    }
}
