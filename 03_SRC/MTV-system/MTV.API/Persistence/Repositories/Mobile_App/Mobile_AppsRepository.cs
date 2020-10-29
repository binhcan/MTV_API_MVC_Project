using MTV.API.Domain.Mobile_App;
using MTV.API.Helper;
using MTV.API.Persistence.Contexts;
using MTV.API.Persistence.Repositories.Common;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Linq;
using System.Threading.Tasks;
using MTV.Utilities;

namespace MTV.API.Persistence.Repositories.Mobile_App
{
    public class Mobile_AppsRepository : Api_ServerDbBaseRepository, IMobile_AppsRepository
    {
        public Mobile_AppsRepository(Api_ServerDbContext context) : base(context) { }

        public async Task AddAsyncApplication(Mobile_Applications app)
        {
            await _context.Mobile_Applications.AddAsync(app);
        }

        public async Task<Mobile_Applications> DeleteAsyncApplication(int id)
        {
            Mobile_Applications app = await _context.Mobile_Applications.FindAsync(id);
            if (app != null)
            {
                _context.Mobile_Applications.Remove(app);
                return app;
            }
            else
            {
                throw new Exception(API_Message.error("E-COM-010"));
            }
        }

        public async Task<Mobile_Applications> GetAsyncApplicationById(int id)
        {
            return await _context.Mobile_Applications.FindAsync(id);
        }

        public async Task<Mobile_Applications> GetReleaseVersionApplicationByName(string name)
        {
            return await _context.Mobile_Applications.Where(app => app.ApplicationName == name).OrderByDescending(x => x.Id).FirstAsync();
        }

        public async Task<IQueryable<Mobile_Applications>> ListAllApplications()
        {
            IQueryable<Mobile_Applications> data = from lstapp in _context.Mobile_Applications select lstapp;
            return await (Task<IQueryable<Mobile_Applications>>)data;
        }

        public async Task PutAsyncApplication(Mobile_Applications app, int id)
        {
            var tmp = await _context.Mobile_Applications.FindAsync(id);
            if (tmp != null)
            {
                foreach (var prop in app.GetType().GetProperties())
                {
                    foreach (var tmp_prop in tmp.GetType().GetProperties())
                    {
                        if (tmp_prop == prop)
                        {
                            if (tmp_prop.Name != "Id")
                            {
                                var x_value = prop.GetValue(app, null) ?? tmp_prop.GetValue(tmp, null);
                                tmp_prop.SetValue(tmp, x_value);
                            }

                        }
                    }
                }
                _context.Entry(tmp).State = EntityState.Modified;
            }
            else
            {
                throw new Exception(API_Message.error("E-COM-010"));
            }
        }
    }
}
