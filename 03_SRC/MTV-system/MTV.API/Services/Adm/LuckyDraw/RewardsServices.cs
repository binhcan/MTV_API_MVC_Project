using MTV.API.Domain;
using MTV.API.Domain.Adm.LuckyDraw;
using MTV.API.Helper;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using MTV.Utilities;

namespace MTV.API.Services.Adm.LuckyDraw
{
    public class RewardsServices : IRewardsService
    {
        private readonly IRewardsRepository _rewardRepository;
        private readonly IUnitOfWork _unitOfWork;

        public RewardsServices(IRewardsRepository rewardRepository, IUnitOfWork unitOfWork)
        {
            _rewardRepository = rewardRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task AddAsync(Rewards reward)
        {
            try
            {
                await _rewardRepository.AddAsync(reward);
                await _unitOfWork.CompleteApiAsync();
            }
            catch (Exception ex)
            {
                Logging.iLogger.LogError(API_Message.error("E-ADM-002"));
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(API_Message.error("E-ADM-002"));
            }
        }

        public async Task<Rewards> DeleteAsync(int id)
        {
            return await _rewardRepository.DeleteAsync(id);
        }

        public async Task<Rewards> GetAsyncById(int id)
        {
            return await _rewardRepository.GetAsyncById(id);
        }

        public async Task<IEnumerable<Rewards>> ListAllRewards()
        {
            return await _rewardRepository.ListAllRewards();
        }

        public async Task PutAsync(Rewards reward, int id)
        {
            try
            {
                await _rewardRepository.PutAsync(reward, id);
                await _unitOfWork.CompleteApiAsync();
            }
            catch (Exception ex)
            {
                Logging.iLogger.LogError(API_Message.error("E-ADM-002"));
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(API_Message.error("E-ADM-002"));
            }
        }
    }
}
