using API_Web_Server.Persistence.Contexts;

namespace API_Web_Server.Persistence.Repositories.Common
{
    public class SytelineDbBaseRepository
    {
        protected readonly SytelineDbContext _context;

        public SytelineDbBaseRepository(SytelineDbContext context)
        {
            _context = context;
        }
    }
}
