using MTV.API.Domain;
using MTV.API.Domain.Departments;
using MTV.API.Domain.Home;
using MTV.API.Domain.Home.PermissionPart;
using MTV.API.Domain.Users;
using MTV.API.Helper;
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
using MTV.Utilities;
using MTV.API.Domain.Home.PermissionContext;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace MTV.API.Services
{
    public class UsersService : IUsersService
    {
        private readonly IUsersRepository _usersRepository;
        private readonly IUsersRolesRepository _userRolesRepository;
        private readonly IModulesForUserRepository _modulesForUserRepository;
        private readonly IUserRoleInProjectsRepository _userRoleInProjectsRepository;
        private readonly IDepartmentsRepository _departmentsRepository;
        private readonly AppSettings _appSettings;
        private readonly IUnitOfWork _unitOfWork;

        public UsersService(IUsersRepository usersRepository, IUsersRolesRepository userRolesRepository, IUserRoleInProjectsRepository userRoleInProjectsRepository, IModulesForUserRepository modulesForUserRepository, IDepartmentsRepository departmentsRepository, IOptions<AppSettings> appSettings, IUnitOfWork unitOfWork)
        {
            _usersRepository = usersRepository;
            _userRolesRepository = userRolesRepository;
            _userRoleInProjectsRepository = userRoleInProjectsRepository;
            _modulesForUserRepository = modulesForUserRepository;
            _departmentsRepository = departmentsRepository;
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

        public async Task<Users> CreateUserWithPermission(Users user, List<(int, int)> lstPermissonInDepartment, List<(int, int)> lstPermissonInProjects, List<int> lstModules)
        {
            try
            {
                // Tạo Transaction
                await _unitOfWork.CreateApiTransactionAsync();

                // Inser user mới vào bảng Users
                await _usersRepository.AddAsync(user);
                await _unitOfWork.CompleteApiAsync();

                var lstUserRole = new List<UsersRoles>();
                var usersRole = new UsersRoles();

                var lstModulesForUser = new List<ModulesForUser>();

                foreach (var item in lstPermissonInDepartment)
                {
                    usersRole = new UsersRoles
                    {
                        Ecode = user.Ecode,
                        DeptId = item.Item1,
                        RoleId = item.Item2,
                    };
                    lstUserRole.Add(usersRole);

                    PaidForModules combinedModules = PaidForModules.None;
                    var DeptName = _departmentsRepository.GetDepartmentsById(item.Item1).Result.DepartmentName;
                    if (!Enum.TryParse(typeof(PaidForModules), DeptName, true, out var thisModule))
                        throw new InvalidOperationException($"The module name {DeptName} with DeptID: {item.Item1} isn't a valid module name.");
                    combinedModules |= (PaidForModules)thisModule;
                    lstModulesForUser.Add(new ModulesForUser(){ Ecode = user.Ecode, AllowedPaidForModules = combinedModules});

                }
                // Inser list quyền trên các projects mới vào bảng UserRoleInProjects
                await _userRolesRepository.AddRangeUsersRolesAsync(lstUserRole);
                await _unitOfWork.CompleteApiAsync();

                await _modulesForUserRepository.AddRangeModuleForUsersAsync(lstModulesForUser);
                await _unitOfWork.CompleteApiAsync();

                var lstUserRolesInProject = new List<UserRoleInProjects>();
                var rolesInPr = new UserRoleInProjects();
                foreach (var item in lstPermissonInProjects.Distinct().ToList())
                {
                    rolesInPr = new UserRoleInProjects
                    {
                        Ecode = user.Ecode,
                        ProjectId = item.Item1,
                        RolesInProjectID = item.Item2,
                    };
                    lstUserRolesInProject.Add(rolesInPr);
                }
                // Inser list quyền trên các bộ phận mới vào bảng UserWithRoles
                await _userRoleInProjectsRepository.AddRangeAsync(lstUserRolesInProject);
                await _unitOfWork.CompleteApiAsync();

                // thực hiện commit sau khi insert vào cả 3 bảng được hoàn thành
                await _unitOfWork.CommitApiAsync();
                return user;
            }
            catch (DbUpdateException ex)
            {
                //Log the exception and rollback the transaction
                await _unitOfWork.RollbackApiAsync();
                Logging.iLogger.LogError(ex.Message);
                // Bắt lỗi duplicate Ecode
                if (ex.InnerException is SqlException sqlEx && sqlEx.Number == 2627)
                {
                    throw new Exception("Mã số nhân viên đã tồn tại trong cơ sở dữ liệu. Hãy nhập Ecode khác.");
                }
                else
                {
                    throw new Exception(API_Message.error("E-COM-004"));
                }
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
