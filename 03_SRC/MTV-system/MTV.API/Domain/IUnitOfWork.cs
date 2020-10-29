using System.Threading.Tasks;

namespace MTV.API.Domain
{
    public interface IUnitOfWork
    {
        Task CreateApiTransactionAsync();
        Task CommitApiAsync();
        Task RollbackApiAsync();
        Task CompleteApiAsync();

        Task CreateSytelineTransactionAsync();
        Task CommitSytelineAsync();
        Task RollbackSytelineAsync();
        Task CompleteSytelineAsync();

        Task CreateFactoryTransactionAsync();
        Task CommitFactoryAsync();
        Task RollbackFactoryAsync();
        Task CompleteFactoryAsync();

    }
}
