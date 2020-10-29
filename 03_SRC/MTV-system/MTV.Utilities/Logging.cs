using Microsoft.Extensions.Logging;

namespace MTV.Utilities
{
	public class Logging
	{
		private static ILoggerFactory _Factory = null;

		private static ILogger _logger;

		public static void ConfigureLogger(ILoggerFactory factory, ILogger logger)
		{
			//factory.AddDebug(LogLevel.None).AddStackify();
			factory.AddFile(Setting.Configuration["Logging:Files"]);
			_logger = logger;
		}

		public static ILogger iLogger
		{
			get
			{
				if (_Factory == null)
				{
					_Factory = new LoggerFactory();
					ConfigureLogger(_Factory, _logger);
				}
				return _logger;
			}
			set { _logger = value; }
		}

		public static ILoggerFactory LoggerFactory
		{
			get
			{
				if (_Factory == null)
				{
					_Factory = new LoggerFactory();
					ConfigureLogger(_Factory, _logger);
				}
				return _Factory;
			}
			set { _Factory = value; }
		}
	}
}
