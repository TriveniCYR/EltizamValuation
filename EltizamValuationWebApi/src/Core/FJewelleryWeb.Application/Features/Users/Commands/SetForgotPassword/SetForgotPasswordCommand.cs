﻿using ValuationWeb.Application.Responses;
using MediatR;
using System;

namespace ValuationWeb.Application.Features.Users.Commands.SetForgotPassword
{
    public class SetForgotPasswordCommand : IRequest<Response<int>>
    {
        public int Id { get; set; }        
        public string ForgotPasswordToken { get; set; }        
    }
}
