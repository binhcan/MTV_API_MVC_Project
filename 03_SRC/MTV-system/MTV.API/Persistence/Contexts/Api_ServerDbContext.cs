using MTV.API.Domain.Adm.LuckyDraw;
using MTV.API.Domain.Departments;
using MTV.API.Domain.Home;
using MTV.API.Domain.Mobile_App;
using MTV.API.Domain.Uploaders;
using MTV.API.Domain.Users;
using Microsoft.EntityFrameworkCore;
using MTV.API.Domain.Home.PermissionContext;
using MTV.API.Domain.QC;

namespace MTV.API.Persistence.Contexts
{
    public class Api_ServerDbContext : DbContext
    {
        public DbSet<Users> Users { get; set; }
        public DbSet<Files> Files { get; set; }
        public DbSet<Departments> Departments { get; set; }
        public DbSet<RolesInDepartments> RolesInDepartment { get; set; }
        public DbSet<UsersRoles> UserWithRoles { get; set; }
        public DbSet<RoleToPermissions> RoleToPermissions { get; set; }
        public DbSet<ModulesForUser> ModulesForUsers { get; set; }
        public DbSet<Mobile_Applications> Mobile_Applications { get; set; }
        public DbSet<UserRoleInProjects> UserRoleInProjects { get; set; }
        public DbSet<RoleInProjects> RoleInProjects { get; set; }
        public DbSet<Projects> Projects { get; set; }
        public DbSet<LotSerial> Lotserials { get; set; }

        public DbSet<Rewards> Rewards { get; set; }
        public DbSet<Results> Results { get; set; }
        public DbSet<Rounds> Rounds { get; set; }

        public Api_ServerDbContext(DbContextOptions<Api_ServerDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.HasDefaultSchema("dbo");
            builder.Query<UserFullInfo>();
            builder.Entity<Users>()
                .HasKey(us => us.Id);
            builder.Entity<Files>()
                .HasKey(fi => fi.Id);
            builder.Entity<Departments>()
                .HasKey(de => de.Id);
            builder.Entity<UsersRoles>()
                .HasKey(ur => ur.Id);
            builder.Entity<RolesInDepartments>()
                .HasKey(rd => new { rd.Id, rd.DeptId });
            builder.Entity<Rewards>()
                .HasKey(re => re.Id);
            builder.Entity<Results>()
                .HasKey(result => result.Id);
            builder.Entity<Rounds>()
                .HasKey(rounds => rounds.Id);
            builder.Entity<RoleToPermissions>().Property<string>("_permissionsInRole")
                .IsUnicode(false).HasColumnName("PermissionsInRole").IsRequired();
            builder.Entity<Mobile_Applications>()
                .HasKey(app => app.Id);
            builder.Entity<ModulesForUser>()
                .HasKey(mfu => mfu.Id);
            builder.Entity<UserRoleInProjects>()
                .HasKey(urip => urip.Id);
            builder.Entity<RoleInProjects>()
                .HasKey(rip => rip.Id);
            builder.Entity<Projects>()
                .HasKey(pr => pr.Id);
            builder.Entity<LotSerial>()
                .HasKey(lot => lot.ID_Scan);
        }

    }
}
