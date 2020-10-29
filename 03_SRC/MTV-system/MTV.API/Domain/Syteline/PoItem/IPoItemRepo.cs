using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Domain.Syteline.PoItem
{
    public interface IPoItemRepo
    {
        Task<PoItemMst> GetPoItemMst(string po, short line, short release);
    }
}
