using System;
using System.ComponentModel.DataAnnotations;

namespace API_Web_Server.Domain.Home.PermissionPart
{
    public enum Permissions : short
    {
        NotSet = 0, //error condition

        [Display(GroupName = "Accessor", Name = "Read", Description = "Quyền đọc")]
        Read = 0x10,
        [Display(GroupName = "Accessor", Name = "Create", Description = "Quyền tạo mới")]
        Create = 0x11,
        [Display(GroupName = "Accessor", Name = "Update", Description = "Quyền sửa")]
        Update = 0x12,
        [Display(GroupName = "Accessor", Name = "Delete", Description = "Quyền xóa")]
        Delete = 0x13,

        [Display(GroupName = "UserAdmin", Name = "Read users", Description = "Chỉ có quyền đọc với user")]
        UserRead = 0x20,
        // This is an example of grouping multiple actions under one permission
        [Display(GroupName = "UserAdmin", Name = "Alter user", Description = "Full quyền với user")]
        UserChange = 0x21,

        [Display(GroupName = "UserAdmin", Name = "Read Roles", Description = "Can list Role")]
        RoleRead = 0x28,
        [Display(GroupName = "UserAdmin", Name = "Change Role", Description = "Can create, update or delete a Role")]
        RoleChange = 0x29,

        // This is an example of a permission linked to a optional (paid for?) feature
        // The code that turns roles to permissions can
        // Remove this permission if the user isn't allowed to access this feature
        [LinkedToModule(PaidForModules.ADM)]
        [Display(GroupName = "Departments", Name = "ADM_Modules", Description = "Can access ADM_Modules")]
        ADM = 0x30,

        [LinkedToModule(PaidForModules.AI)]
        [Display(GroupName = "Departments", Name = "AI_Modules", Description = "Can access AI_Modules")]
        AI = 0x31,

        [LinkedToModule(PaidForModules.BM)]
        [Display(GroupName = "Departments", Name = "BM_Modules", Description = "Can access BM_Modules")]
        BM = 0x32,

        [LinkedToModule(PaidForModules.CR)]
        [Display(GroupName = "Departments", Name = "CR_Modules", Description = "Can access CR_Modules")]
        CR = 0x33,

        [LinkedToModule(PaidForModules.ENG1)]
        [Display(GroupName = "Departments", Name = "ENG1_Modules", Description = "Can access ENG1_Modules")]
        ENG1 = 0x34,

        [LinkedToModule(PaidForModules.ENG2)]
        [Display(GroupName = "Departments", Name = "ENG2_Modules", Description = "Can access ENG2_Modules")]
        ENG2 = 0x35,

        [LinkedToModule(PaidForModules.LOG)]
        [Display(GroupName = "Departments", Name = "LOG_Modules", Description = "Can access LOG_Modules")]
        LOG = 0x36,

        [LinkedToModule(PaidForModules.MF)]
        [Display(GroupName = "Departments", Name = "MF_Modules", Description = "Can access MF_Modules")]
        MF = 0x37,

        [LinkedToModule(PaidForModules.OS)]
        [Display(GroupName = "Departments", Name = "OS_Modules", Description = "Can access OS_Modules")]
        OS = 0x38,

        [LinkedToModule(PaidForModules.QC)]
        [Display(GroupName = "Departments", Name = "QC_Modules", Description = "Can access QC_Modules")]
        QC = 0x39,

        [LinkedToModule(PaidForModules.SCM1)]
        [Display(GroupName = "Departments", Name = "SCM1_Modules", Description = "Can access SCM1_Modules")]
        SCM1 = 0x40,

        [LinkedToModule(PaidForModules.SCM2)]
        [Display(GroupName = "Departments", Name = "SCM2_Modules", Description = "Can access SCM2_Modules")]
        SCM2 = 0x41,

        [LinkedToModule(PaidForModules.SE)]
        [Display(GroupName = "Departments", Name = "SE_Modules", Description = "Can access SE_Modules")]
        SE = 0x42,

        [LinkedToModule(PaidForModules.TRAINING)]
        [Display(GroupName = "Departments", Name = "TRAINING_Modules", Description = "Can access TRAINING_Modules")]
        TRAINING = 0x43,

        //This is an example of what to do with permission you don't used anymore.
        //You don't want its number to be reused as it could cause problems 
        //Just mark it as obsolete and the PermissionDisplay code won't show it
        [Obsolete]
        [Display(GroupName = "Old", Name = "Not used", Description = "example of old permission")]
        OldPermissionNotUsed = 0x60,

        [Display(GroupName = "DataAuth", Name = "Not used", Description = "Permissions aren't used in DataAuthWebApp")]
        DataAuthPermission
    }
}
