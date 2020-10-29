using API_Web_Server.Domain;
using API_Web_Server.Domain.Users;
using API_Web_Server.Helper;
using Microsoft.Extensions.Logging;
using System;
using System.Threading.Tasks;

namespace API_Web_Server.Services
{
    public class UsersRolesServices : IUsersRolesServices
    {
        private readonly IUsersRolesRepository _usersRolesRepository;
        private readonly IUsersRepository _usersRepository;
        private readonly IUnitOfWork _unitOfWork;

        public UsersRolesServices(IUsersRolesRepository usersRolesRepository, IUsersRepository usersRepository, IUnitOfWork unitOfWork)
        {
            _usersRolesRepository = usersRolesRepository;
            _usersRepository = usersRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<UsersRolesResponse> SaveAsync(UsersRoles usersRole)
        {
            try
            {
                var user = new Users
                {
                    Ecode = "444444",
                    FirstName = "BBB",
                    GivenName = "Hoàng Anh",
                    Email = "quan.le-112892@meiko-t.com.vn",
                    Password = "1234567890"
                };

                await _unitOfWork.CreateApiTransactionAsync();
                await _usersRepository.AddAsync(user);
                await _unitOfWork.CompleteApiAsync();

                usersRole.Ecode = user.Ecode;

                await _usersRolesRepository.AddSingleUsersRolesAsync(usersRole);
                await _unitOfWork.CompleteApiAsync();
                await _unitOfWork.CommitApiAsync();
                return new UsersRolesResponse(usersRole);
            }
            catch (Exception ex)
            {
                //Log the exception and rollback the transaction
                await _unitOfWork.RollbackApiAsync();
                Logging.iLogger.LogError(ex.Message);
                return new UsersRolesResponse(API_Message.error("E-COM-004"));
            }
        }
    }
}
