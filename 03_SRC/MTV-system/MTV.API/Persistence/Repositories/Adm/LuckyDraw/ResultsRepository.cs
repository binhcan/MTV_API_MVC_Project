using MTV.API.Domain.Adm.LuckyDraw;
using MTV.API.Extensions;
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
    public class ResultsRepository : Api_ServerDbBaseRepository, IResultsRepository
    {
        public ResultsRepository(Api_ServerDbContext context) : base(context) { }

        public async Task AddResultsAsync(Results result)
        {
            await _context.Results.AddAsync(result);
        }

        public async Task<Results> GetResultsAsyncByEcode(string Ecode)
        {
            var result = await _context.Results.Where(re => re.Ecode == Ecode).SingleAsync();
            if (result != null)
            {
                return result;
            }
            else
            {
                throw new Exception(API_Message.error("E-ADM-003").FormatWith(Ecode));
            }
        }

        public async Task<IEnumerable<Results>> ListAllResults()
        {
            return await _context.Results.ToListAsync();
        }
    }
}
