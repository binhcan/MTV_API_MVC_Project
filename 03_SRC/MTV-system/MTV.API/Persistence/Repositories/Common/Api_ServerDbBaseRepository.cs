using MTV.API.Persistence.Contexts;

namespace MTV.API.Persistence.Repositories.Common
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
