using MTV.API.Domain.Syteline.PoItem;
using Microsoft.EntityFrameworkCore;

namespace MTV.API.Persistence.Contexts
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
