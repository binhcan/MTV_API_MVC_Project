using MTV.Utilities;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Domain.Factory.ItemVendlot
{
    public class TEVTB_ItemVendlotResponse : BaseResponse
    {
        public TEVTB_ItemVendlot ItemVendlots { get; private set; }

        private TEVTB_ItemVendlotResponse(bool success, string message, TEVTB_ItemVendlot itemVendlots) : base(success, message)
        {
            ItemVendlots = itemVendlots;
        }

        public TEVTB_ItemVendlotResponse(TEVTB_ItemVendlot itemVendlots) : this(true, string.Empty, itemVendlots)
        {
            Logging.iLogger.LogInformation(String.Format(API_Message.success("S001"), "TEVTB_ItemVendlot", itemVendlots.RowPointer));
        }

        public TEVTB_ItemVendlotResponse(string message, TEVTB_ItemVendlot itemVendlots) : this(false, message, itemVendlots)
        {
            Logging.iLogger.LogError(String.Format(API_Message.error("E001"), "TEVTB_ItemVendlot", message));
        }

        public TEVTB_ItemVendlotResponse(string message) : this(false, message, null)
        {
            Logging.iLogger.LogError(message);
        }
    }
}
