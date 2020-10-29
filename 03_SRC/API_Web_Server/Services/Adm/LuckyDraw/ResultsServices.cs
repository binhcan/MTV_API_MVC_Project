using API_Web_Server.Domain;
using API_Web_Server.Domain.Adm.LuckyDraw;
using API_Web_Server.Helper;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_Web_Server.Services.Adm.LuckyDraw
{
    public class ResultsServices : IResultsServices
    {
        private readonly IResultsRepository _resultsRepository;
        private readonly IUnitOfWork _unitOfWork;

        public ResultsServices(IResultsRepository resultsRepository, IUnitOfWork unitOfWork)
        {
            _resultsRepository = resultsRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task AddResultsAsync(Results results)
        {
            try
            {
                await _resultsRepository.AddResultsAsync(results);
                await _unitOfWork.CompleteApiAsync();
            }
            catch (Exception ex)
            {
                Logging.iLogger.LogError(API_Message.error("E-ADM-004"));
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(API_Message.error("E-ADM-004"));
            }
        }

        public async Task<Results> GetResultsAsyncByEcode(string Ecode)
        {
            return await _resultsRepository.GetResultsAsyncByEcode(Ecode);
        }

        public async Task<IEnumerable<Results>> ListAllResults()
        {
            return await _resultsRepository.ListAllResults();
        }
    }
}
