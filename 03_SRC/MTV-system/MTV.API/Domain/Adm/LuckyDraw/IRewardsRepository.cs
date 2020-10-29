using System.Collections.Generic;
using System.Threading.Tasks;

namespace MTV.API.Domain.Adm.LuckyDraw
{
    public interface IRewardsRepository
    {
        Task<IEnumerable<Rewards>> ListAllRewards();
        Task<Rewards> GetAsyncById(int id);
        Task AddAsync(Rewards reward);
        Task PutAsync(Rewards reward, int id);
        Task<Rewards> DeleteAsync(int id);
    }
}
