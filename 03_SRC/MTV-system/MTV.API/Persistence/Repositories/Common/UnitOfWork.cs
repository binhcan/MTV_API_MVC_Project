using MTV.API.Domain;
using MTV.API.Helper;
using MTV.API.Persistence.Contexts;
using Microsoft.EntityFrameworkCore.Storage;
using Microsoft.Extensions.Logging;
using System.Threading.Tasks;

namespace MTV.API.Persistence.Repositories.Common
{
    public class UnitOfWork : IUnitOfWork
    {
        IDbContextTransaction _apiTransaction;
        //IDbContextTransaction _sytelineTransaction;
        //IDbContextTransaction _factoryTransaction;
        private readonly Api_ServerDbContext _apiDbContext;
        private readonly SytelineDbContext _sytelineDbContext;
        private readonly FactoryDbContext _factoryDbContext;

        public UnitOfWork(Api_ServerDbContext apiDbContext, SytelineDbContext sytelineDbContext, FactoryDbContext factoryDbContext)
        {
            _apiDbContext = apiDbContext;
            _sytelineDbContext = sytelineDbContext;
            _factoryDbContext = factoryDbContext;
        }

        public async Task CreateApiTransactionAsync()
        {
            _apiTransaction = await _apiDbContext.Database.BeginTransactionAsync();
        }

        public async Task CommitApiAsync()
        {
            await _apiTransaction.CommitAsync();
        }

        public async Task RollbackApiAsync()
        {
            await _apiTransaction.RollbackAsync();
            await _apiTransaction.DisposeAsync();
        }

        public async Task CompleteApiAsync()
        {
            await _apiDbContext.SaveChangesAsync();
        }

        public async Task CompleteSytelineAsync()
        {
            await _sytelineDbContext.SaveChangesAsync();
        }

        public async Task CompleteFactoryAsync()
        {
            await _factoryDbContext.SaveChangesAsync();
        }

        public Task CreateSytelineTransactionAsync()
        {
            throw new System.NotImplementedException();
        }

        public Task CommitSytelineAsync()
        {
            throw new System.NotImplementedException();
        }

        public Task RollbackSytelineAsync()
        {
            throw new System.NotImplementedException();
        }

        public Task CreateFactoryTransactionAsync()
        {
            throw new System.NotImplementedException();
        }

        public Task CommitFactoryAsync()
        {
            throw new System.NotImplementedException();
        }

        public Task RollbackFactoryAsync()
        {
            throw new System.NotImplementedException();
        }
    }
}
