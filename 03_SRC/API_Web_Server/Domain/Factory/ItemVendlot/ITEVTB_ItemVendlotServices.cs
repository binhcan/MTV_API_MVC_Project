using System.Threading.Tasks;

namespace API_Web_Server.Domain.Factory.ItemVendlot
{
    public interface ITEVTB_ItemVendlotServices
    {
        Task<TEVTB_ItemVendlotResponse> SaveAsync(TEVTB_ItemVendlot itemVendlot);
    }
}
