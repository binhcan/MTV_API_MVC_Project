using API_Web_Server.Domain.Departments;
using API_Web_Server.Domain.Factory.ItemVendlot;
using API_Web_Server.Domain.Mobile_App;
using API_Web_Server.Domain.Syteline.PoItem;
using API_Web_Server.Domain.Users;
using AutoMapper;

namespace API_Web_Server.Mapping
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
        }
    }
}
