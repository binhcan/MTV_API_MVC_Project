﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Domain.Departments
{
    public interface IDepartmentsRepository
    {
        Task<IEnumerable<Departments>> ListAllDepartments();
        Task<Departments> GetDepartmentsById(int Id);
    }
}