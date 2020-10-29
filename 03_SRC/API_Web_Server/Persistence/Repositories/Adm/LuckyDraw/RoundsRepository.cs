using API_Web_Server.Domain.Adm.LuckyDraw;
using API_Web_Server.Persistence.Contexts;
using API_Web_Server.Persistence.Repositories.Common;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Web_Server.Persistence.Repositories.Adm.LuckyDraw
{
    public class RoundsRepository : Api_ServerDbBaseRepository, IRoundsRepository
    {
        public RoundsRepository(Api_ServerDbContext context) : base(context) { }

        public async Task AddRoundsAsync(Rounds round)
        {
            await _context.Rounds.AddAsync(round);
        }

        public async Task<Rounds> GetRoundsAsyncById(int Id)
        {
            return await _context.Rounds.FindAsync(Id);
        }

        public async Task<IEnumerable<Rounds>> ListAllRoundss()
        {
            return await _context.Rounds.ToListAsync();
        }

        public async Task<IEnumerable<Rounds>> ListAllStageByRound(int ronud)
        {
            return await _context.Rounds.Where(rnd => rnd.Round == ronud).ToListAsync();
        }
    }
}
