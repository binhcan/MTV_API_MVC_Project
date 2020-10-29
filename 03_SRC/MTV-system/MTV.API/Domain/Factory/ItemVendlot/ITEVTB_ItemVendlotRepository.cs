using System.Threading.Tasks;

namespace MTV.API.Domain.Factory.ItemVendlot
{
    public interface ITEVTB_ItemVendlotRepository
    {
        Task AddAsync(TEVTB_ItemVendlot itemVendlot);
    }
}
