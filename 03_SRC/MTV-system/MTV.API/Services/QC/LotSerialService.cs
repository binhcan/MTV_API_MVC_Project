using MTV.API.Domain.QC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Services.QC
{
    public class LotSerialService : ILotSerialService
    {
        private readonly ILotSerialRepository _LotSerialRepository;

        public LotSerialService(ILotSerialRepository LotSerialRepo)
        {
            _LotSerialRepository = LotSerialRepo;
        }
        public async Task<IEnumerable<LotSerial>> FullListLotSerial()
        {
            return await _LotSerialRepository.FullListLotSerial();
        }
    }
}
