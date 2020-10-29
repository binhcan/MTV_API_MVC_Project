using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Adm.LuckyDraw
{
    public interface IRoundsRepository
    {
        Task<IEnumerable<Rounds>> ListAllRoundss();
        Task<IEnumerable<Rounds>> ListAllStageByRound(int ronud);
        Task<Rounds> GetRoundsAsyncById(int Id);
        Task AddRoundsAsync(Rounds round);
    }
}
