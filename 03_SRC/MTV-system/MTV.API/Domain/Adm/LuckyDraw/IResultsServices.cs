using System.Collections.Generic;
using System.Threading.Tasks;

namespace MTV.API.Domain.Adm.LuckyDraw
{
    public interface IResultsServices
    {
        Task<IEnumerable<Results>> ListAllResults();
        Task<Results> GetResultsAsyncByEcode(string Ecode);
        Task AddResultsAsync(Results results);
    }
}
