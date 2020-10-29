using System;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Syteline.PoItem
{
    public interface IPoItemMstService
    {
        Task<PoItemMst> GetPoItemMst(string po, short line, short release);
    }
}
