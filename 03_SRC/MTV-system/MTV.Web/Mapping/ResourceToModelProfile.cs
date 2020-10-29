using MTV.API.Domain.Factory.ItemVendlot;
using MTV.API.Domain.Mobile_App;
using MTV.API.Domain.Users;
using AutoMapper;
using MTV.API.Domain.Home.PermissionContext;
using MTV.API.Domain.QC;

namespace MTV.API.Mapping
{
    public class ResourceToModelProfile : Profile
    {
        public ResourceToModelProfile()
        {
            //Để thực hiện mapping các API tiếp theo thì chỉ việc thêm CreateMap trong hàm này
            CreateMap<UsersRequest, Users>();
            CreateMap<Mobile_AppsRequest, Mobile_Applications>();
            CreateMap<TEVTB_ItemVendlotRequest, TEVTB_ItemVendlot>();
            CreateMap<UsersRolesRequest, UsersRoles>();
            CreateMap<UserRoleInProjectsRequest, UserRoleInProjects>();
            CreateMap<LotSerialRequest, LotSerial>();
        }
    }
}
