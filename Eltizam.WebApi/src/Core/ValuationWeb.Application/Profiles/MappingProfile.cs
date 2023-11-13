using AutoMapper;
using Eltizam.Business.Models;
using Eltizam.Data.DataAccess.Entity;
using ValuationWeb.Application.Features.Branchs.Commands.CreateBranch;
using ValuationWeb.Application.Features.Branchs.Commands.DeleteBranchById;
using ValuationWeb.Application.Features.Branchs.Commands.UpdateBranch; 
using ValuationWeb.Application.Models.Authentication;
using ValuationWeb.Application.Models.Login;
using ValuationWeb.Domain.Entities;
using ValuationWeb.Domain.ViewModel;

namespace ValuationWeb.Application.Profiles
{
    public class MappingProfile: Profile
    {
        public MappingProfile()
        {
            //User Mapping
            CreateMap<User, UserDetailViewModel>();
            CreateMap<User, UserViewModel>();           
            //CreateMap<User, CreateUserCommand>();
            //CreateMap<CreateUserCommand, User>();
            //CreateMap<User, UpdateUserCommand>();
            //CreateMap<UpdateUserCommand, User>();
            //CreateMap<User, DeleteUserByIdCommand>();
            CreateMap<AuthenticationResponse, AuthenticateUserResponse>();
            CreateMap<UserDetailViewModel, AuthenticateUserResponse>();

            //Branch Mapping
            CreateMap<Branch, BranchDetailViewModel>();
            CreateMap<Branch, BranchViewModel>();
            CreateMap<Branch, CreateBranchCommand>();
            CreateMap<CreateBranchCommand, Branch>();
            CreateMap<Branch, UpdateBranchCommand>();
            CreateMap<UpdateBranchCommand, Branch>();
            CreateMap<Branch, DeleteBranchByIdCommand>();


            CreateMap<MasterCity, MasterCityEntity>(); 
            CreateMap<MasterCity, MasterCityEntity>().ReverseMap();
        }
    }
}
