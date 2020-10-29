using MTV.API.Persistence.Contexts;

namespace MTV.API.Persistence.Repositories.Common
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
