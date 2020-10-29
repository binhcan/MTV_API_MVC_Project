using MTV.API.Domain.Syteline.PoItem;
using MTV.API.Helper;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Threading.Tasks;
using MTV.Utilities;

namespace MTV.API.Controllers.Syteline
{
    [Authorize]
    [EnableCors("CorsPolicy")]
    [Route("syteline/[controller]")]
    [ApiController]
    public class PoItemMstController : Controller
    {
        private readonly IMapper _mapper;

        private readonly IPoItemMstService _poItemMstService;

        public PoItemMstController(IMapper mapper, IPoItemMstService poItemMstService)
        {
            _mapper = mapper;
            _poItemMstService = poItemMstService;
        }

        [HttpGet("{po}/{line}/{release}")]
        //public async Task<PoItemMstResource> GetPoItemMstAsync(string po)
        public async Task<IActionResult> GetPoItemMstAsync(string po, Int16 line, Int16 release)
        {
            try
            {
                var poItemMst = await _poItemMstService.GetPoItemMst(po, line, release);
                var poItemMstResources = _mapper.Map<PoItemMst, PoItemMstResource>(poItemMst);
                return Ok(poItemMstResources);
            }
            catch (AggregateException ex)
            {
                Logging.iLogger.LogError(ex.Message);
                return BadRequest(String.Format(API_Message.error("E-LOG-001")));
            }
            catch (Exception ex)
            {
                Logging.iLogger.LogError(ex.Message);
                return BadRequest(String.Format(API_Message.error("E-LOG-002")));
            }

        }
    }
}
