using System.Threading.Tasks;

namespace MTV.API.Domain.Factory.ItemVendlot
{
    public interface ITEVTB_ItemVendlotServices
    {
        Task<TEVTB_ItemVendlotResponse> SaveAsync(TEVTB_ItemVendlot itemVendlot);
    }
}
