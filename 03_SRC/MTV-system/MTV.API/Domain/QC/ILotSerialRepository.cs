﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Domain.QC
{
    public interface ILotSerialRepository
    {
        Task<IEnumerable<LotSerial>> FullListLotSerial();
        //Task<LotSerial> GetList();
    }
}