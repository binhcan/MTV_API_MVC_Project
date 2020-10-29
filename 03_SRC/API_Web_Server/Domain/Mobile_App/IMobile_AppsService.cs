using System.Linq;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Mobile_App
{
    public interface IMobile_AppsService
    {
        Task<IQueryable<Mobile_Applications>> ListAllApplications();
        Task<Mobile_Applications> GetAsyncApplicationById(int id);
        Task AddAsyncApplication(Mobile_Applications app);
        Task PutAsyncApplication(Mobile_Applications app, int id);
        Task<Mobile_Applications> DeleteAsyncApplication(int id);
        Task<Mobile_Applications> GetReleaseVersionApplicationByName(string name);
    }
}
