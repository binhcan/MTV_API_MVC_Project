using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace MTV.Web
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureAppConfiguration((hostingContext, config) =>
                {
                    //config.AddInMemoryCollection(arrayDict);
                    config.AddJsonFile("setting.json", optional: false, reloadOnChange: true)
                    .AddJsonFile($"appsettings.{hostingContext.HostingEnvironment.EnvironmentName}.json", optional: true);
                    if (hostingContext.HostingEnvironment.IsProduction())
                    {
                        config.AddUserSecrets<Program>();
                    }
                })
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                })
                .ConfigureLogging(logBuilder =>
                {
                    logBuilder.ClearProviders();
                    logBuilder.AddConsole();
                    logBuilder.AddTraceSource("Information, ActivityTracing");
                });
    }
}
