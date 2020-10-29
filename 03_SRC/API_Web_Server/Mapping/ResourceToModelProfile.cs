using API_Web_Server.Domain.Factory.ItemVendlot;
using API_Web_Server.Domain.Mobile_App;
using API_Web_Server.Domain.Users;
using AutoMapper;

namespace API_Web_Server.Mapping
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
        }
    }
}
