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
