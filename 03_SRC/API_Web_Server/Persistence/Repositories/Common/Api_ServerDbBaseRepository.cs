using API_Web_Server.Persistence.Contexts;

namespace API_Web_Server.Persistence.Repositories.Common
{
    public abstract class Api_ServerDbBaseRepository
    {
        protected readonly Api_ServerDbContext _context;

        public Api_ServerDbBaseRepository(Api_ServerDbContext context)
        {
            _context = context;
        }
    }
}
