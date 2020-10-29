using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Domain.QC
{
    public class LotSerialRequest
    {
        public Int64 ID_Scan { get; set; }
        public string ID_label { get; set; }
        public string? Lot { get; set; }
        public string? Serial { get; set; }
        public Int64? Qty { get; set; }
        public string? Create_by { get; set; }
        public string? Update_by { get; set; }
        public DateTime? Create_date { get; set; }
        public DateTime? Update_date { get; set; }
    }
}
