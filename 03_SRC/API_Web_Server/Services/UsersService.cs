using API_Web_Server.Domain;
using API_Web_Server.Domain.Departments;
using API_Web_Server.Domain.Home;
using API_Web_Server.Domain.Home.PermissionPart;
using API_Web_Server.Domain.Users;
using API_Web_Server.Helper;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace API_Web_Server.Services
{
    public class UsersService : IUsersService
    {
        private readonly IUsersRepository _usersRepository;
        private readonly IUsersRolesRepository _userRolesRepository;
        private readonly IDepartmentsRepository _departmentRepository;
        private readonly IRolesInDepartmentRepository _rolesInDepartmentRepository;
        private readonly IModulesForUserRepository _modulesForUserRepository;
        private readonly IRoleToPermissionsRepository _roleToPermissionsRepository;
        private readonly AppSettings _appSettings;
        private readonly IUnitOfWork _unitOfWork;

        public UsersService(IUsersRepository usersRepository, IUsersRolesRepository userRolesRepository, IDepartmentsRepository departmentRepository, IRolesInDepartmentRepository rolesInDepartmentRepository, IModulesForUserRepository modulesForUserRepository, IRoleToPermissionsRepository roleToPermissionsRepository, IOptions<AppSettings> appSettings, IUnitOfWork unitOfWork)
        {
            _usersRepository = usersRepository;
            _userRolesRepository = userRolesRepository;
            _departmentRepository = departmentRepository;
            _rolesInDepartmentRepository = rolesInDepartmentRepository;
            _modulesForUserRepository = modulesForUserRepository;
            _roleToPermissionsRepository = roleToPermissionsRepository;
            _appSettings = appSettings.Value;
            _unitOfWork = unitOfWork;
        }

        public async Task<IQueryable<UserFullInfo>> ListAllUsers() => await _usersRepository.ListAllUsers();

        public async Task<Users> GetAsyncById(int id)
        {
            return await _usersRepository.GetAsyncById(id);
        }

        public async Task<UsersResponse> SaveAsync(Users users)
        {
            try
            {
                await _usersRepository.AddAsync(users);
                await _unitOfWork.CompleteApiAsync();
                return new UsersResponse(users);
            }
            catch (Exception ex)
            {
                // Do some logging stuff
                return new UsersResponse($"SAVE USERS ERROR: {ex.Message}", users);
            }
        }

        public async Task<UsersResponse> PutAsync(Users users, int id)
        {
            try
            {
                await _usersRepository.PutAsync(users, id);
                await _unitOfWork.CompleteApiAsync();
                var user_update = await _usersRepository.GetAsyncById(id);
                return new UsersResponse(user_update);
            }
            catch (Exception ex)
            {
                return new UsersResponse($"UPDATE USERS ERROR: {ex.Message}", users);
            }
        }

        public async Task<UsersResponse> DeleteAsync(int id)
        {
            try
            {
                var user = await _usersRepository.DeleteAsync(id);
                await _unitOfWork.CompleteApiAsync();

                return new UsersResponse(user);
            }
            catch (Exception ex)
            {
                return new UsersResponse($"DELETE USERS ERROR: {ex.Message}");
            }
        }

        public async Task<Users> Authenticate(string eCode, string password)
        {
            try
            {
                var user = _usersRepository.Authenticate(eCode, password);
                // authentication successful so generate jwt token
                var token = GenerateJwtToken(eCode);
                user.Result.Token = token;

                return await user;
            }
            catch (Exception ex)
            {
                string message = String.Format(API_Message.error("E002"));
                Logging.iLogger.LogError(message);
                Logging.iLogger.LogError(ex.Message);
                return new Users
                {
                    Ecode = "",
                    FirstName = "",
                    GivenName = "",
                    Email = "",
                    Password = ""
                };
            }
            
        }

        private string GenerateJwtToken(string eCode)
        {
            // generate token that is valid for 7 days
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_appSettings.Secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, eCode)
                }),
                Expires = DateTime.UtcNow.AddDays(7),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }

        public async Task<Users> GetAsyncByEcode(string Ecode)
        {
            return await _usersRepository.GetAsyncByEcode(Ecode);
        }

        public async Task<Users> CreateUserWithPermission(string Ecode, string Password, string FisrtName, string GivenName, List<Dictionary<string, int>> lstPermisson )
        {
            try
            {
                // Tạo Transaction
                await _unitOfWork.CreateApiTransactionAsync();
                var user = new Users
                {
                    Ecode = Ecode,
                    FirstName = FisrtName,
                    GivenName = String.IsNullOrEmpty(GivenName) ? "" : GivenName,
                    Password = String.IsNullOrEmpty(Password)? "Towada@123" : Password,
                };

                await _usersRepository.AddAsync(user);
                await _unitOfWork.CompleteApiAsync();

                var lstUserRole = new List<UsersRoles>();
                var usersRole = new UsersRoles();

                var lstModuleUser = new List<ModulesForUser>();
                var lstRoleName = new List<string>();

                foreach (var item in lstPermisson)
                {
                    usersRole.Ecode = user.Ecode;
                    usersRole.DeptId = item["DeptID"];
                    usersRole.RoleId = item["RoleID"];
                    lstUserRole.Add(usersRole);

                    var modules = _departmentRepository.GetDepartmentsById(item["DeptID"]).Result.ModuleNo;
                    var moduleUser = new ModulesForUser(user.Ecode, (PaidForModules)modules);
                    lstModuleUser.Add(moduleUser);

                    var roleName = _rolesInDepartmentRepository.GetRolesInDepartmentsById(item["DeptID"], item["DeptID"]);
                    lstRoleName.Add(roleName);
                }
                await _modulesForUserRepository.AddRangeModuleForUsersAsync(lstModuleUser);
                await _userRolesRepository.AddRangeUsersRolesAsync(lstUserRole);
                await _unitOfWork.CompleteApiAsync();

                //var usersRole = new UsersRoles()
                //{
                //    Ecode = user.Ecode,
                //    DeptId = DeptId,
                //    RoleId = RoleId,
                //};


                //usersRole.Ecode = user.Ecode;

                //await _usersRolesRepository.AddAsync(usersRole);
                //await _unitOfWork.CompleteApiAsync();

                // Lưu toàn bộ thông tin lên DB sau khi tất cả các xử lý đã hoàn thành
                await _unitOfWork.CommitApiAsync();
                //return new UsersRolesResponse(usersRole);
                return user;
            }
            catch (Exception ex)
            {
                //Log the exception and rollback the transaction
                await _unitOfWork.RollbackApiAsync();
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(API_Message.error("E-COM-004"));
            }
        }
    }
}
