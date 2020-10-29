using API_Web_Server.Domain.Factory.ItemVendlot;
using API_Web_Server.Extensions;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace API_Web_Server.Controllers.Factory
{
    [Authorize]
    [EnableCors("CorsPolicy")]
    [Route("factory/Vendorlot")]
    [ApiController]
    public class TEVTB_ItemVendlotController : Controller
    {
        private readonly ITEVTB_ItemVendlotServices _itemVendlotService;
        private readonly IMapper _mapper;

        //Khởi tạo object
        public TEVTB_ItemVendlotController(ITEVTB_ItemVendlotServices itemVendlotService, IMapper mapper)
        {
            _itemVendlotService = itemVendlotService;
            _mapper = mapper;
        }

        // POST: api/Users
        [HttpPost]
        public async Task<IActionResult> PostAsync([FromBody] TEVTB_ItemVendlotRequest itemVendlotRequest)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState.GetErrorMessages());

            var itemVendlot = _mapper.Map<TEVTB_ItemVendlotRequest, TEVTB_ItemVendlot>(itemVendlotRequest);
            var result = await _itemVendlotService.SaveAsync(itemVendlot);

            if (!result.Success)
                return BadRequest(result.Message);

            var itemVendlotResource = _mapper.Map<TEVTB_ItemVendlot, TEVTB_ItemVendlotResource>(result.ItemVendlots);
            return Ok(itemVendlotResource);
        }
    }
}
