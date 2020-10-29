using MTV.API.Domain.Factory.ItemVendlot;
using MTV.API.Extensions;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using MTV.API.Domain.Home.RolesToPermission;
using MTV.API.Domain.Home.PermissionPart;

namespace MTV.API.Controllers.Factory
{
    [Authorize]
    [EnableCors("CorsPolicy")]
    [Route("factory/Vendorlot")]
    [ApiController]
    [HasPermission(Permissions.LOG)]
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
        [HasPermission(Permissions.PR1_CREATE)]
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
