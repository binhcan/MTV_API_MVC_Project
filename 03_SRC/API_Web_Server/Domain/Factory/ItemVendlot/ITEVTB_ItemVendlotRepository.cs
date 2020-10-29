using System.Threading.Tasks;

namespace API_Web_Server.Domain.Factory.ItemVendlot
{
    public interface ITEVTB_ItemVendlotRepository
    {
        Task AddAsync(TEVTB_ItemVendlot itemVendlot);
    }
}
