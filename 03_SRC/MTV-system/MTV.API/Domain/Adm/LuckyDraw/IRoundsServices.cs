using System.Collections.Generic;
using System.Threading.Tasks;

namespace MTV.API.Domain.Adm.LuckyDraw
{
    public interface IRoundsServices
    {
        Task<IEnumerable<Rounds>> ListAllRoundss();
        Task<Rounds> GetRoundsAsyncById(int Id);
        Task AddRoundsAsync(Rounds round);
        Task<IEnumerable<Rounds>> ListAllStageByRound(int ronud);
    }
}
