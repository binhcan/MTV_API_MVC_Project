using MTV.API.Domain.Adm.LuckyDraw;
using MTV.API.Helper;
using MTV.API.Persistence.Contexts;
using MTV.API.Persistence.Repositories.Common;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MTV.Utilities;

namespace MTV.API.Persistence.Repositories.Adm.LuckyDraw
{
    public class RewardsRepository : Api_ServerDbBaseRepository, IRewardsRepository
    {
        public RewardsRepository(Api_ServerDbContext context) : base(context) { }

        public async Task AddAsync(Rewards reward)
        {
            await _context.Rewards.AddAsync(reward);
        }

        public async Task<Rewards> DeleteAsync(int id)
        {
            Rewards rewards = await _context.Rewards.FindAsync(id);
            if (rewards != null)
            {
                _context.Rewards.Remove(rewards);
                return rewards;
            }
            else
            {
                throw new Exception(API_Message.error("E-ADM-001"));
            }
        }

        public async Task<Rewards> GetAsyncById(int id)
        {
            return await _context.Rewards.FindAsync(id);
        }

        public async Task<IEnumerable<Rewards>> ListAllRewards()
        {
            return await _context.Rewards.OrderBy(x => x.Round).ToListAsync();
        }

        public async Task PutAsync(Rewards reward, int id)
        {
            var tmp = await _context.Rewards.FindAsync(id);
            if (tmp != null)
            {
                foreach (var prop in reward.GetType().GetProperties())
                {
                    foreach (var tmp_prop in tmp.GetType().GetProperties())
                    {
                        if (tmp_prop == prop)
                        {
                            if (tmp_prop.Name != "Id")
                            {
                                var x_value = prop.GetValue(reward, null) ?? tmp_prop.GetValue(tmp, null);
                                tmp_prop.SetValue(tmp, x_value);
                            }

                        }
                    }
                }
                _context.Entry(tmp).State = EntityState.Modified;
            }
            else
            {
                throw new Exception(API_Message.error("E-ADM-001"));
            }
        }
    }
}
