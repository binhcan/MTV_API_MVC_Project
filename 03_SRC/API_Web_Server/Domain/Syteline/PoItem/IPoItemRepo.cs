using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Syteline.PoItem
{
    public interface IPoItemRepo
    {
        Task<PoItemMst> GetPoItemMst(string po, short line, short release);
    }
}
