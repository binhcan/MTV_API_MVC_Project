using Microsoft.EntityFrameworkCore;
using MTV.API.Domain.QC;
using MTV.API.Persistence.Contexts;
using MTV.API.Persistence.Repositories.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Persistence.Repositories.QC
{
    public class LotSerialRepository : Api_ServerDbBaseRepository, ILotSerialRepository
    {
        public LotSerialRepository(Api_ServerDbContext context) : base(context) { }

        public async Task<IEnumerable<LotSerial>> FullListLotSerial()
        {
            return await _context.Lotserials.ToListAsync();
        }

        //public Task<LotSerial> GetList()
        //{
        //    throw new NotImplementedException();
        //}

    }
}
