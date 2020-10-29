using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Mobile_App
{
    public class Mobile_AppsRequest
    {
        public string ApplicationName { get; set; }
        public string Version { get; set; }
        public string Path { get; set; }
        public int BuildNumber { get; set; }
        public string Project { get; set; }
        public string Description { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime UpdateDate { get; set; }
    }
}
