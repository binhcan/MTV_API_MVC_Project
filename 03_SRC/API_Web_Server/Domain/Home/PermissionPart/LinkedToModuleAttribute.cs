using System;

namespace API_Web_Server.Domain.Home.PermissionPart
{
    [AttributeUsage(AttributeTargets.Field)]
    public class LinkedToModuleAttribute : Attribute
    {
        public PaidForModules PaidForModule { get; private set; }

        public LinkedToModuleAttribute(PaidForModules paidForModule)
        {
            PaidForModule = paidForModule;
        }
    }

    [Flags]
    public enum PaidForModules : long
    {
        None = 0,
        ADM = 1,
        AI = 2,
        BM = 3,
        CR = 4,
        ENG1 = 5,
        ENG2 = 6,
        LOG = 7,
        MF = 8,
        OS = 9,
        QC = 10,
        SCM1 = 11,
        SCM2 = 12,
        SE = 13,
        TRAINING = 14,
    }
}
