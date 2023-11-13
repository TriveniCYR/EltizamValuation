using FluentValidation;

namespace ValuationWeb.Application.Features.Users.Commands.CreateUser
{
    public class CreateUserCommandValidator :  AbstractValidator<CreateUserCommand>
    {
        public CreateUserCommandValidator()
        {
            RuleFor(p => p.Name)
                .NotEmpty().WithMessage("{PropertyName} is required.")
                .NotNull()
                .MaximumLength(255).WithMessage("{PropertyName} must not exceed 255 characters.");
            RuleFor(p => p.Email)
                .NotEmpty().WithMessage("{PropertyName} is required.")
                .NotNull()
                .EmailAddress().WithMessage("Invalid {PropertyName}.")                
                .MaximumLength(356).WithMessage("{PropertyName} must not exceed 356 characters.");
            RuleFor(p => p.FirstName)
               .MaximumLength(80).WithMessage("{PropertyName} must not exceed 80 characters.");
            RuleFor(p => p.LastName)
              .MaximumLength(80).WithMessage("{PropertyName} must not exceed 80 characters.");
            RuleFor(p => p.Address)
             .MaximumLength(500).WithMessage("{PropertyName} must not exceed 500 characters.");
            //RuleFor(p => p.MaxConnection)
            //    .NotEmpty().WithMessage("{PropertyName} is required.")
            //    .NotNull();
            RuleFor(p => p.Mobile)
                .NotEmpty().WithMessage("{PropertyName} is required.")
                .NotNull()
                .MaximumLength(10).WithMessage("{PropertyName} must not exceed 10 characters.");
            RuleFor(p => p.Mobile2)
             .MaximumLength(10).WithMessage("{PropertyName} must not exceed 10 characters.");
            //RuleFor(p => p.Prefix)
            //    .NotEmpty().WithMessage("{PropertyName} is required.")
            //    .NotNull()
            //    .MaximumLength(3).WithMessage("{PropertyName} must not exceed 3 characters.");
            RuleFor(p => p.Gender)
                .NotEmpty().WithMessage("{PropertyName} is required.")
                .NotNull()
                .Length(1).WithMessage("{PropertyName} must not exceed 1 characters.");
        }
    }
}
