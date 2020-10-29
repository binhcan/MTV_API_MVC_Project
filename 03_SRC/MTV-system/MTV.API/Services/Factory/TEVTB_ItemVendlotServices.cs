using MTV.API.Domain;
using MTV.API.Domain.Factory.ItemVendlot;
using MTV.API.Helper;
using Microsoft.Extensions.Logging;
using System;
using System.Threading.Tasks;
using MTV.Utilities;

namespace MTV.API.Services.Factory
{
    public class TEVTB_ItemVendlotServices : ITEVTB_ItemVendlotServices
    {
        private readonly ITEVTB_ItemVendlotRepository _itemVendlotRepository;
        private readonly IUnitOfWork _unitOfWork;

        public TEVTB_ItemVendlotServices(ITEVTB_ItemVendlotRepository itemVendlotRepository, IUnitOfWork unitOfWork)
        {
            _itemVendlotRepository = itemVendlotRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<TEVTB_ItemVendlotResponse> SaveAsync(TEVTB_ItemVendlot itemVendlot)
        {
            try
            {
                await _itemVendlotRepository.AddAsync(itemVendlot);
                await _unitOfWork.CompleteFactoryAsync();

                return new TEVTB_ItemVendlotResponse(itemVendlot);
            }
            catch (Exception ex)
            {
                Logging.iLogger.LogError(ex.Message);
                if (ex.Message == API_Message.error("E-LOG-003") || ex.Message == API_Message.error("E-LOG-004"))
                {
                    return new TEVTB_ItemVendlotResponse(ex.Message);
                }
                else
                {
                    return new TEVTB_ItemVendlotResponse(ex.Message);
                }
            }
        }
    }
}
