using System;
using System.ComponentModel.DataAnnotations;

namespace MTV.API.Domain.Home.PermissionPart
{
    public enum Permissions : short
    {
        NotSet = 0, //error condition

        [Display(GroupName = "Accessor", Name = "Read", Description = "Quyền đọc")]
        Read = 0x1000,
        [Display(GroupName = "Accessor", Name = "Create", Description = "Quyền tạo mới")]
        Create = 0x1001,
        [Display(GroupName = "Accessor", Name = "Update", Description = "Quyền sửa")]
        Update = 0x1002,
        [Display(GroupName = "Accessor", Name = "Delete", Description = "Quyền xóa")]
        Delete = 0x1003,

        [Display(GroupName = "Admin", Name = "Read users", Description = "Chỉ có quyền đọc với user")]
        UserRead = 0x1004,
        // This is an example of grouping multiple actions under one permission
        [Display(GroupName = "Admin", Name = "Alter user", Description = "Full quyền với user")]
        UserChange = 0x1005,

        [Display(GroupName = "Admin", Name = "Read Roles", Description = "Chỉ có quyền đọc với roles")]
        RoleRead = 0x1006,
        [Display(GroupName = "Admin", Name = "Change Role", Description = "Full quyền với user Role")]
        RoleChange = 0x1007,

        //========================================================================================================================
        //================================================= Quyền trên các bộ phận ===============================================
        //========================================================================================================================
        [LinkedToModule(PaidForModules.ADM)]
        [Display(GroupName = "Departments", Name = "ADM_Modules", Description = "Can access ADM_Modules")]
        ADM = 0x1008,
        [LinkedToModule(PaidForModules.AI)]
        [Display(GroupName = "Departments", Name = "AI_Modules", Description = "Can access AI_Modules")]
        AI = 0x1009,

        [LinkedToModule(PaidForModules.BM)]
        [Display(GroupName = "Departments", Name = "BM_Modules", Description = "Can access BM_Modules")]
        BM = 0x1010,

        [LinkedToModule(PaidForModules.CR)]
        [Display(GroupName = "Departments", Name = "CR_Modules", Description = "Can access CR_Modules")]
        CR = 0x1011,

        [LinkedToModule(PaidForModules.ENG1)]
        [Display(GroupName = "Departments", Name = "ENG1_Modules", Description = "Can access ENG1_Modules")]
        ENG1 = 0x1012,

        [LinkedToModule(PaidForModules.ENG2)]
        [Display(GroupName = "Departments", Name = "ENG2_Modules", Description = "Can access ENG2_Modules")]
        ENG2 = 0x1013,

        [LinkedToModule(PaidForModules.LOG)]
        [Display(GroupName = "Departments", Name = "LOG_Modules", Description = "Can access LOG_Modules")]
        LOG = 0x1014,

        [LinkedToModule(PaidForModules.MF)]
        [Display(GroupName = "Departments", Name = "MF_Modules", Description = "Can access MF_Modules")]
        MF = 0x1015,

        [LinkedToModule(PaidForModules.OS)]
        [Display(GroupName = "Departments", Name = "OS_Modules", Description = "Can access OS_Modules")]
        OS = 0x1016,

        [LinkedToModule(PaidForModules.QC)]
        [Display(GroupName = "Departments", Name = "QC_Modules", Description = "Can access QC_Modules")]
        QC = 0x1017,

        [LinkedToModule(PaidForModules.SCM1)]
        [Display(GroupName = "Departments", Name = "SCM1_Modules", Description = "Can access SCM1_Modules")]
        SCM1 = 0x1018,

        [LinkedToModule(PaidForModules.SCM2)]
        [Display(GroupName = "Departments", Name = "SCM2_Modules", Description = "Can access SCM2_Modules")]
        SCM2 = 0x1019,

        [LinkedToModule(PaidForModules.SE)]
        [Display(GroupName = "Departments", Name = "SE_Modules", Description = "Can access SE_Modules")]
        SE = 0x1020,

        [LinkedToModule(PaidForModules.TRAINING)]
        [Display(GroupName = "Departments", Name = "TRAINING_Modules", Description = "Can access TRAINING_Modules")]
        TRAINING = 0x1021,

        [LinkedToModule(PaidForModules.ADMINISTRATOR)]
        [Display(GroupName = "Departments", Name = "ADMINISTRATOR_Modules", Description = "Can access ADMINISTRATOR_Modules")]
        ADMINISTRATOR = 0x1022,

        //========================================================================================================================
        //=========================================== Khu vực phân quyền của các project =========================================
        //========================================================================================================================

        [Display(GroupName = "Pro_01", Name = "Project 01 Modules", Description = "Quyền trên Project 01")]
        PR1 = 0x1100,

        [Display(GroupName = "Pro_01", Name = "Project 01 Modules", Description = "Quyền đọc trên Project 01")]
        PR1_READ = 0x1101,

        [Display(GroupName = "Pro_01", Name = "Project 01 Modules", Description = "Quyền tạo mới trên Project 01")]
        PR1_CREATE = 0x1102,

        [Display(GroupName = "Pro_01", Name = "Project 01 Modules", Description = "Quyền sửa trên Project 01")]
        PR1_UPDATE = 0x1103,

        [Display(GroupName = "Pro_01", Name = "Project 01 Modules", Description = "Quyền xóa trên Project 01")]
        PR1_DELETE = 0x1104,


        [Display(GroupName = "Pro_02", Name = "Project 02 Modules", Description = "Quyền trên Project 02")]
        PR2 = 0x1105,

        [Display(GroupName = "Pro_02", Name = "Project 02 Modules", Description = "Quyền đọc trên Project 02")]
        PR2_READ = 0x1106,

        [Display(GroupName = "Pro_02", Name = "Project 02 Modules", Description = "Quyền tạo mới trên Project 02")]
        PR2_CREATE = 0x1107,

        [Display(GroupName = "Pro_02", Name = "Project 02 Modules", Description = "Quyền sửa trên Project 02")]
        PR2_UPDATE = 0x1108,

        [Display(GroupName = "Pro_02", Name = "Project 02 Modules", Description = "Quyền xóa trên Project 02")]
        PR2_DELETE = 0x1109,



        //Định nghĩa những permission không sử dụng đến nữa.
        //Trong 1 số trường hợp không muốn sử dụng permission này nữa, tuy nhiên nếu xóa đi thì lại ảnh hưởng đến những chức năng cũ.
        //Thêm từ khóa Obsolete để đánh dấu cho permission không sử dụng nữa.
        [Obsolete]
        [Display(GroupName = "Old", Name = "Not used", Description = "old permission")]
        OldPermissionNotUsed = 0x60,

        [Display(GroupName = "DataAuth", Name = "Not used", Description = "Permissions aren't used in DataAuthWebApp")]
        DataAuthPermission
    }
}
