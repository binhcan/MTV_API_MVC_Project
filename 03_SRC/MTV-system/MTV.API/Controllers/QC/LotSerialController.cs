using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MTV.API.Domain.QC;

namespace MTV.API.Controllers.QC
{
    [Route("all/[controller]")]
    [ApiController]
    public class LotSerialController : ControllerBase
    {
        private readonly ILotSerialService _LotSerialService;
        private readonly IMapper _mapper;

        public LotSerialController(ILotSerialService LotSerialService, IMapper mapper)
        {
            _LotSerialService = LotSerialService;
            _mapper = mapper;
        }

        [HttpGet]
        public async Task<IEnumerable<LotSerialResource>> FullListLotSerial()
        {
            var lotSerial = await _LotSerialService.FullListLotSerial();
            var lotSerialRes = _mapper.Map<IEnumerable<LotSerial>, IEnumerable<LotSerialResource>>(lotSerial);
            return lotSerialRes;
        }
    }
}
