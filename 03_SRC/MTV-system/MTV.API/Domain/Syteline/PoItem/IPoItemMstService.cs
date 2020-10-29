using System;
using System.Threading.Tasks;

namespace MTV.API.Domain.Syteline.PoItem
{
    public interface IPoItemMstService
    {
        Task<PoItemMst> GetPoItemMst(string po, short line, short release);
    }
}
