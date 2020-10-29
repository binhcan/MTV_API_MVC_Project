using AutoMapper;
using MTV.API.Domain.Departments;
using MTV.API.Domain.Factory.ItemVendlot;
using MTV.API.Domain.Home.PermissionContext;
using MTV.API.Domain.Mobile_App;
using MTV.API.Domain.QC;
using MTV.API.Domain.Syteline.PoItem;
using MTV.API.Domain.Users;

namespace MTV.Web.Mapping
{
    public class ModelToResourceProfile : Profile
    {
        public ModelToResourceProfile()
        {
            //Để thực hiện mapping các API tiếp theo thì chỉ việc thêm CreateMap trong hàm này
            CreateMap<Users, UsersResource>();
            CreateMap<UserFullInfo, UsersResource>();
            CreateMap<PoItemMst, PoItemMstResource>();
            CreateMap<Departments, DepartmentsResource>();
            CreateMap<TEVTB_ItemVendlot, TEVTB_ItemVendlotResource>();
            CreateMap<UsersRoles, UsersRolesResource>();
            CreateMap<Mobile_Applications, Mobile_AppsResource>();
            CreateMap<UserRoleInProjects, UserRoleInProjectsResource>();
            CreateMap<LotSerial, LotSerialResource>();
        }
    }
}
