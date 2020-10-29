using API_Web_Server.Domain;
using API_Web_Server.Domain.Adm.LuckyDraw;
using API_Web_Server.Helper;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_Web_Server.Services.Adm.LuckyDraw
{
    public class RoundsServices : IRoundsServices
    {
        private readonly IRoundsRepository _roundsRepository;
        private readonly IUnitOfWork _unitOfWork;

        public RoundsServices(IRoundsRepository roundsRepository, IUnitOfWork unitOfWork)
        {
            _roundsRepository = roundsRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task AddRoundsAsync(Rounds round)
        {
            try
            {
                await _roundsRepository.AddRoundsAsync(round);
                await _unitOfWork.CompleteApiAsync();
            }
            catch (Exception ex)
            {
                Logging.iLogger.LogError(API_Message.error("E-ADM-005"));
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(API_Message.error("E-ADM-005"));
            }
        }

        public async Task<Rounds> GetRoundsAsyncById(int Id)
        {
            return await _roundsRepository.GetRoundsAsyncById(Id);
        }

        public async Task<IEnumerable<Rounds>> ListAllRoundss()
        {
            return await _roundsRepository.ListAllRoundss();
        }

        public async Task<IEnumerable<Rounds>> ListAllStageByRound(int ronud)
        {
            return await _roundsRepository.ListAllStageByRound(ronud);
        }
    }
}
