using MTV.API.Domain.Users;
using MTV.API.Helper;
using MTV.API.Persistence.Contexts;
using MTV.API.Persistence.Repositories.Common;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTV.Utilities;

namespace MTV.API.Persistence.Repositories
{
    public class UsersRepository : Api_ServerDbBaseRepository, IUsersRepository
    {
        public UsersRepository(Api_ServerDbContext context) : base(context) { }

        public async Task<IQueryable<UserFullInfo>> ListAllUsers()
        {
            //return await _context.Users.ToListAsync();
            string sqlQuery = @"SELECT 
	                                [U].[Id],
	                                [U].[eCode],
	                                [U].[firstName],
	                                [U].[givenName],
	                                [U].[email],
	                                [U].[description],
	                                [U].[password],
                                    [UR].deptId,
	                                [DEP].departmentName,
	                                [RD].roleName
                                FROM 
	                                [dbo].[Users] as U
                                INNER JOIN 
	                                [dbo].[UserWithRoles] AS UR
                                ON 
	                                [U].[eCode] = [UR].[eCode]
                                INNER JOIN 
	                                [dbo].[RolesInDepartment] AS RD
                                ON 
	                                [UR].[roleId] = [RD].[id]
                                INNER JOIN 
	                                [dbo].[Departments] AS DEP
                                ON 
	                                [UR].[deptId] = [DEP].[id]";
            return _context.Query<UserFullInfo>().FromSqlRaw(sqlQuery);
        }

        public async Task AddAsync(Users user)
        {
            var pwHashed = HashSHA1(user.Password);
            user.Password = pwHashed;
            await _context.Users.AddAsync(user);
        }

        public async Task PutAsync(Users user, int id)
        {
            var tmp = await _context.Users.FindAsync(id);
            if (tmp != null)
            {
                foreach (var prop in user.GetType().GetProperties())
                {
                    foreach (var tmp_prop in tmp.GetType().GetProperties())
                    {
                        if (tmp_prop == prop)
                        {
                            if (tmp_prop.Name != "Id")
                            {
                                if (tmp_prop.Name == "Password")
                                {
                                    var x_value = prop.GetValue(user, null) == null ? tmp_prop.GetValue(tmp, null) : HashSHA1(prop.GetValue(user, null).ToString());
                                    tmp_prop.SetValue(tmp, x_value);
                                }
                                else
                                {
                                    var x_value = prop.GetValue(user, null) ?? tmp_prop.GetValue(tmp, null);
                                    tmp_prop.SetValue(tmp, x_value);
                                }
                            }

                        }
                    }
                }
                _context.Entry(tmp).State = EntityState.Modified;
            }
            else
            {
                throw new Exception(API_Message.error("E-COM-005"));
            }
        }

        public async Task<Users> GetAsyncById(int id)
        {
            var usID = new SqlParameter("userIDParam", id);
            string sqlQuery = @"SELECT 
	                                [U].[Id],
	                                [U].[eCode],
	                                [U].[firstName],
	                                [U].[givenName],
	                                [U].[email],
	                                [U].[description],
	                                [U].[password],
                                    [UR].deptId,
	                                [DEP].departmentName,
	                                [RD].roleName
                                FROM 
	                                [dbo].[Users] as U
                                INNER JOIN 
	                                [dbo].[UserWithRoles] AS UR
                                ON 
	                                [U].[eCode] = [UR].[eCode]
                                INNER JOIN 
	                                [dbo].[RolesInDepartment] AS RD
                                ON 
	                                [UR].[roleId] = [RD].[id]
                                INNER JOIN 
	                                [dbo].[Departments] AS DEP
                                ON 
	                                [UR].[deptId] = [DEP].[ModuleNo]
                                WHERE [U].[Id] = @userIDParam";
            var lstFullUsers = await _context.Query<UserFullInfo>().FromSqlRaw(sqlQuery, usID).ToListAsync();
            var result = await _context.Users.FindAsync(id);
            SetUserPermission(result, lstFullUsers);
            return result;
        }

        private void SetUserPermission(Users result, List<UserFullInfo> userFullInfos)
        {
            result.Permissions = new List<Dictionary<string, string>>();
            foreach (var item in userFullInfos)
            {
                Dictionary<string, string> newItem = new Dictionary<string, string>
                {
                    { "Departments", item.DepartmentName },
                    { "DeptId", item.DeptId.ToString() },
                    { "Role", item.RoleName},
                };
                result.Permissions.Add(newItem);
            }
        }

        public async Task<Users> DeleteAsync(int id)
        {
            Users user = await _context.Users.FindAsync(id);
            if (user != null)
            {
                _context.Users.Remove(user);
                return user;
            }
            else
            {
                throw new Exception(API_Message.error("E-COM-005"));
            }
        }

        public async Task<Users> Authenticate(string eCode, string password)
        {
            var encryptionPw = HashSHA1(password);
            var userLogin =  await _context.Users.Where(user => user.Ecode == eCode && user.Password == encryptionPw).SingleAsync();
            if (userLogin != null)
            {
                //List<string> info = null;
                var usEcode = new SqlParameter("usEcodeParam", userLogin.Ecode);
                string sqlQuery = @"SELECT 
	                                    [U].[id],
	                                    [U].[eCode],
	                                    [U].[firstName],
	                                    [U].[givenName],
	                                    [U].[email],
	                                    [U].[description],
	                                    [U].[password],
                                        [UR].deptId,
	                                    [DEP].departmentName,
	                                    [RD].roleName
                                    FROM 
	                                    [dbo].[Users] as U
                                    INNER JOIN 
	                                    [dbo].[UserWithRoles] AS UR
                                    ON 
	                                    [U].[eCode] = [UR].[eCode]
                                    INNER JOIN 
	                                    [dbo].[RolesInDepartment] AS RD
                                    ON 
	                                    [UR].[roleId] = [RD].[id]
                                    INNER JOIN 
	                                    [dbo].[Departments] AS DEP
                                    ON 
	                                    [UR].[deptId] = [DEP].[id]
                                    WHERE
	                                    [U].[eCode] = @usEcodeParam";
                var lstUsers = await _context.Query<UserFullInfo>().FromSqlRaw(sqlQuery, usEcode).ToListAsync();
                SetUserPermission(userLogin, lstUsers);
                return userLogin;
            }
            else
            {
                throw new Exception(API_Message.error("E002"));
            }
            
        }

        //==============================================================================================================
        //================================= Api_ServerDbBaseRepository logic Implement =================================
        //==============================================================================================================

        private static string HashSHA1(string value)
        {
            var sha1 = System.Security.Cryptography.SHA1.Create();
            var inputBytes = Encoding.ASCII.GetBytes(value);
            var hash = sha1.ComputeHash(inputBytes);

            var sb = new StringBuilder();
            for (var i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("X2"));
            }
            return sb.ToString();
        }

        public async Task<Users> GetAsyncByEcode(string Ecode)
        {
            var user = await _context.Users.Where(user => user.Ecode == Ecode).SingleOrDefaultAsync();
            var EcodePr = new SqlParameter("userEcodeParam", Ecode);
            string sqlQuery = @"SELECT 
	                                [U].[Id],
	                                [U].[eCode],
	                                [U].[firstName],
	                                [U].[givenName],
	                                [U].[email],
	                                [U].[description],
	                                [U].[password],
                                    [UR].deptId,
	                                [DEP].departmentName,
	                                [RD].roleName
                                FROM 
	                                [dbo].[Users] as U
                                INNER JOIN 
	                                [dbo].[UserWithRoles] AS UR
                                ON 
	                                [U].[eCode] = [UR].[eCode]
                                INNER JOIN 
	                                [dbo].[RolesInDepartment] AS RD
                                ON 
	                                [UR].[roleId] = [RD].[id]
                                INNER JOIN 
	                                [dbo].[Departments] AS DEP
                                ON 
	                                [UR].[deptId] = [DEP].[id]
                                WHERE [U].[eCode] = @userEcodeParam";
            var lstUsers = await _context.Query<UserFullInfo>().FromSqlRaw(sqlQuery, EcodePr).ToListAsync();
            SetUserPermission(user, lstUsers);
            return user;
        }

        //public async Task AddUserFullPermisson(UserFullInfo userFull)
        //{
        //    var user = new Users()
        //    {
        //        Ecode = userFull.Ecode,
        //        FirstName = userFull.FirstName,
        //        GivenName = userFull.GivenName,
        //        Password = userFull.Password,
        //    };
        //}
    }
}
