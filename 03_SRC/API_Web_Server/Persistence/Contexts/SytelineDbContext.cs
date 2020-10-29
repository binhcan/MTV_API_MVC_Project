using API_Web_Server.Domain.Syteline.PoItem;
using Microsoft.EntityFrameworkCore;

namespace API_Web_Server.Persistence.Contexts
{
    public class SytelineDbContext : DbContext
    {
        public SytelineDbContext(DbContextOptions<SytelineDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.HasDefaultSchema("dbo");
            builder.Query<PoItemMst>();
        }
    }
}
