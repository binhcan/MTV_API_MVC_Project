using API_Web_Server.Domain.Syteline.PoItem;
using System.Threading.Tasks;

namespace API_Web_Server.Services.Syteline
{
    public class PoItemMstService : IPoItemMstService
    {
        private readonly IPoItemRepo _poItemRepo;

        public PoItemMstService(IPoItemRepo poItemRepo)
        {
            this._poItemRepo = poItemRepo;
        }

        public async Task<PoItemMst> GetPoItemMst(string po, short line, short release)
        {
            return await _poItemRepo.GetPoItemMst(po, line, release);
        }
    }
}
