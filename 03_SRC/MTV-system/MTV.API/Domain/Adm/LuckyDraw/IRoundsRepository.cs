using System.Collections.Generic;
using System.Threading.Tasks;

namespace MTV.API.Domain.Adm.LuckyDraw
{
    public interface IRoundsRepository
    {
        Task<IEnumerable<Rounds>> ListAllRoundss();
        Task<IEnumerable<Rounds>> ListAllStageByRound(int ronud);
        Task<Rounds> GetRoundsAsyncById(int Id);
        Task AddRoundsAsync(Rounds round);
    }
}
