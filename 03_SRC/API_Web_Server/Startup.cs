using System;
using AutoMapper;
using System.Net;
using System.Text;
using System.Security.Claims;
using System.Threading.Tasks;
using API_Web_Server.Domain;
using API_Web_Server.Domain.Adm.LuckyDraw;
using API_Web_Server.Domain.Departments;
using API_Web_Server.Domain.Factory.ItemVendlot;
using API_Web_Server.Domain.Home;
using API_Web_Server.Domain.Home.RolesToPermission;
using API_Web_Server.Domain.Syteline.PoItem;
using API_Web_Server.Domain.Uploaders;
using API_Web_Server.Domain.Users;
using API_Web_Server.Helper;
using API_Web_Server.Persistence.Contexts;
using API_Web_Server.Persistence.Repositories;
using API_Web_Server.Persistence.Repositories.Adm.LuckyDraw;
using API_Web_Server.Persistence.Repositories.Common;
using API_Web_Server.Persistence.Repositories.Factory;
using API_Web_Server.Persistence.Repositories.Syteline;
using API_Web_Server.Services;
using API_Web_Server.Services.Adm.LuckyDraw;
using API_Web_Server.Services.Factory;
using API_Web_Server.Services.Syteline;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using System.Collections.Generic;
using Microsoft.AspNetCore.CookiePolicy;
using API_Web_Server.Persistence.Repositories.Roles;
using API_Web_Server.Persistence.Repositories.Home;
using API_Web_Server.Domain.Mobile_App;
using API_Web_Server.Services.Mobile_App;
using API_Web_Server.Persistence.Repositories.Mobile_App;
using Microsoft.Data.SqlClient;

namespace API_Web_Server
{
    public class Startup
    {
        private readonly Microsoft.AspNetCore.Hosting.IHostingEnvironment Environment;
        public static class Setting
        {
            public static IConfiguration Configuration;
        }

        public Startup(IConfiguration configuration, Microsoft.AspNetCore.Hosting.IHostingEnvironment env)
        {
            Configuration = configuration;
            Setting.Configuration = configuration;
            Environment = env;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                //options.MinimumSameSitePolicy = SameSiteMode.None;
                options.MinimumSameSitePolicy = SameSiteMode.Lax;
                //options.HttpOnly = HttpOnlyPolicy.None;
                //options.Secure = CookieSecurePolicy.Always;
            });

            services.AddControllersWithViews();
            services.AddControllers();

            //services.AddMvc(option => option.AllowCombiningAuthorizeFilters = false);
            services.AddMvc(option => option.EnableEndpointRouting = false);

            // Config session
            services.AddSession(options =>
            {
                options.IdleTimeout = TimeSpan.FromMinutes(30);
                options.Cookie.HttpOnly = true;
                options.Cookie.IsEssential = true;
            });
            // Config Application Cookie
            services.ConfigureApplicationCookie(options =>
            {
                //options.AccessDeniedPath = "/Home/Index";
                options.LoginPath = "/Home/Login";
                options.LogoutPath = "/Home/Logout";
                options.Cookie.HttpOnly = true;
                options.ExpireTimeSpan = TimeSpan.FromMinutes(30);
                options.Events.OnRedirectToLogin = context =>
                {
                    context.Response.StatusCode = StatusCodes.Status401Unauthorized;
                    return Task.CompletedTask;
                };
            });


            //Customize ASP.NET Core Identity and Entity Framework Core
            //services.AddIdentity<IdentityUser, IdentityRole>()
            //    .AddEntityFrameworkStores<Api_ServerDbContext>()
            //    .AddDefaultTokenProviders();

            services.AddIdentity<Users, UsersRoles>()
                .AddDefaultTokenProviders();

            services.AddTransient<IUserStore<Users>, UserStore>();
            services.AddTransient<IRoleStore<UsersRoles>, RoleStore>();

            // configure strongly typed settings objects
            var appSettingsSection = Configuration.GetSection("AppSettings");
            services.Configure<AppSettings>(appSettingsSection);

            // configure jwt authentication
            var appSettings = appSettingsSection.Get<AppSettings>();
            var key = Encoding.ASCII.GetBytes(appSettings.Secret);
            services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddCookie(options =>
            {
                options.Cookie.HttpOnly = true;
                //options.Cookie.SecurePolicy = _environment.IsDevelopment()
                //  ? CookieSecurePolicy.None : CookieSecurePolicy.Always;
                options.Cookie.SecurePolicy = CookieSecurePolicy.Always;
                options.Cookie.SameSite = SameSiteMode.Lax;
            })
            .AddJwtBearer(x =>
            {
                x.RequireHttpsMetadata = false;
                x.SaveToken = true;
                x.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    NameClaimType = ClaimTypes.Name,
                    RoleClaimType = ClaimTypes.Role,
                };
                //Additional config snipped
                x.Events = new JwtBearerEvents
                {
                    OnTokenValidated = async ctx =>
                    {
                        var claims = new List<Claim>
                        {
                            new Claim("Permissions", ctx.HttpContext.Session.GetString("Permissions") ?? ""),
                            new Claim("Darkmode", ctx.HttpContext.Session.GetString("SettingDarkMode") ?? ""),
                            new Claim("SidebarColor", ctx.HttpContext.Session.GetString("SidebarColor") ?? ""),
                        };
                        var appIdentity = new ClaimsIdentity(claims);

                        ctx.Principal.AddIdentity(appIdentity);
                    }
                };

            });

            // Register the Claim Identity handlers
            //services.AddScoped<IClaimsTransformation, ClaimsProvider>();
            //services.AddScoped<IUserClaimsPrincipalFactory<IdentityUser>, AddPermissionsToUserClaims>();

            //Register the Permission policy handlers
            services.AddSingleton<IAuthorizationPolicyProvider, AuthorizationPolicyProvider>();
            services.AddSingleton<IAuthorizationHandler, PermissionHandler>();

            //This is needed by PersonalDbContext to get the userId from claims
            services.AddAutoMapper(typeof(Startup));
            services.AddCors(options =>
            {
                options.AddPolicy("CorsPolicy",
                    builder => builder.AllowAnyOrigin()
                        .AllowAnyMethod()
                        .AllowAnyHeader()
                        .DisallowCredentials());
                //.AllowAnyHeader().DisallowCredentials());
            });

            if (Environment.IsProduction())
            {
                var api_cnn_builder = new SqlConnectionStringBuilder(Configuration.GetConnectionString("api_server_db"))
                {
                    UserID = Configuration["api_id"],
                    Password = Configuration["api_password"],
                };

                services.AddDbContext<Api_ServerDbContext>(options =>
                {
                    options.UseSqlServer(api_cnn_builder.ConnectionString);
                });

                var syteline_cnn_builder = new SqlConnectionStringBuilder(Configuration.GetConnectionString("syteline_db"))
                {
                    Password = Configuration["syteline_id"],
                    UserID = Configuration["syteline_password"],
                };
                services.AddDbContext<SytelineDbContext>(options =>
                {
                    options.UseSqlServer(syteline_cnn_builder.ConnectionString);
                });

                var factory_cnn_builder = new SqlConnectionStringBuilder(Configuration.GetConnectionString("factory_db"))
                {
                    Password = Configuration["factory_id"],
                    UserID = Configuration["factory_password"],
                };

                services.AddDbContext<FactoryDbContext>(options =>
                {
                    options.UseSqlServer(Configuration.GetConnectionString("factory_db"));
                });
            }
            else
            {
                services.AddDbContext<Api_ServerDbContext>(options =>
                {
                    options.UseSqlServer(Configuration.GetConnectionString("api_server_db"));
                });

                services.AddDbContext<SytelineDbContext>(options =>
                {
                    options.UseSqlServer(Configuration.GetConnectionString("syteline_db"));
                });

                services.AddDbContext<FactoryDbContext>(options =>
                {
                    options.UseSqlServer(Configuration.GetConnectionString("factory_db"));
                });
            }

            //Configuration Multipart body length limit
            services.Configure<FormOptions>(options =>
            {
                // Set the limit to 10 MB
                options.MultipartBodyLengthLimit = (long)(1024 * 1024 * 10);
            });
            services.AddControllersWithViews();
            //Adding Scope common
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddTransient<IUploadersService, UploadersService>();
            services.AddTransient<IImageUploaders, ImageUploaders>();

            //Adding Scope single Model
            services.AddScoped<IUsersService, UsersService>();
            services.AddScoped<IUsersRepository, UsersRepository>();
            //Adding Scope PoItemMst Model
            services.AddScoped<IPoItemMstService, PoItemMstService>();
            services.AddScoped<IPoItemRepo, PoItemRepo>();

            //Adding Scope Departments Model
            services.AddScoped<IDepartmentsService, DepartmentsService>();
            services.AddScoped<IDepartmentsRepository, DepartmentsRepository>();

            //Adding Scope Departments Model
            services.AddScoped<ITEVTB_ItemVendlotServices, TEVTB_ItemVendlotServices>();
            services.AddScoped<ITEVTB_ItemVendlotRepository, TEVTB_ItemVendlotRepository>();

            //Adding Scope single Model
            services.AddScoped<IUsersRolesServices, UsersRolesServices>();
            services.AddScoped<IUsersRolesRepository, UsersRolesRepository>();

            //Adding Scope single Model
            //services.AddScoped<IRolesInDepartmentServices, RolesInDepartmentServices>();
            services.AddScoped<IRolesInDepartmentRepository, RolesInDepartmentRepository>();

            //Adding Scope single Model
            services.AddScoped<IModulesForUserRepository, ModulesForUserRepository>();

            //Adding Scope single Model
            services.AddScoped<IRoleToPermissionsRepository, RoleToPermissionsRepository>();

            //Adding Scope single Model
            services.AddScoped<IRewardsService, RewardsServices>();
            services.AddScoped<IRewardsRepository, RewardsRepository>();

            //Adding Scope single Model
            services.AddScoped<IResultsServices, ResultsServices>();
            services.AddScoped<IResultsRepository, ResultsRepository>();

            //Adding Scope single Model
            services.AddScoped<IRoundsServices, RoundsServices>();
            services.AddScoped<IRoundsRepository, RoundsRepository>();

            //Adding Scope single Model
            services.AddScoped<IMobile_AppsService, Mobile_AppsService>();
            services.AddScoped<IMobile_AppsRepository, Mobile_AppsRepository>();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory, ILogger<Startup> logger)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseStaticFiles();

            app.UseHttpsRedirection();

            app.UseSession();

            app.Use(async (context, next) =>
            {
                var JWToken = context.Session.GetString("JWToken");
                if (!string.IsNullOrEmpty(JWToken))
                {
                    context.Request.Headers.Add("Authorization", "Bearer " + JWToken);
                }
                await next();
            });

            app.UseStatusCodePages(async (context) =>
            {
                var response = context.HttpContext.Response;

                if (response.StatusCode == (int)HttpStatusCode.Unauthorized ||
                    response.StatusCode == (int)HttpStatusCode.Forbidden)
                    response.Redirect("/Home/Login");
                if (response.StatusCode == (int)HttpStatusCode.NotFound)
                    response.Redirect("/Home/PageNotFound");
            });
            //Add JWToken Authentication service
            app.UseCookiePolicy();
            app.UseAuthentication();

            app.UseRouting();

            app.UseCors("CorsPolicy");

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");

            });

            Logging.ConfigureLogger(loggerFactory, logger);
            Logging.LoggerFactory = loggerFactory;
            Logging.iLogger = logger;
        }
    }
}