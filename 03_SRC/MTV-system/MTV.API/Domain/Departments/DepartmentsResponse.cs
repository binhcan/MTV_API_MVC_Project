using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Domain.Departments
{
    public class DepartmentsResponse : BaseResponse
    {
        public Departments Departments { get; private set; }

        private DepartmentsResponse(bool success, string message, Departments departments) : base(success, message)
        {
            Departments = departments;
        }

        public DepartmentsResponse(Departments departments) : this(true, string.Empty, departments)
        {
            throw new Exception();
            //Logging.iLogger.LogInformation(String.Format(API_Message.success("S001"), "Departments", departments.DepartmentName));
        }

        public DepartmentsResponse(string message, Departments departments) : this(false, message, departments)
        {
            throw new Exception();
            //Logging.iLogger.LogError(String.Format(API_Message.error("E001"), "Departments", message));
        }

        public DepartmentsResponse(string message) : this(false, message, null)
        {
            throw new Exception();
            //Logging.iLogger.LogError(message);
        }
    }
}
