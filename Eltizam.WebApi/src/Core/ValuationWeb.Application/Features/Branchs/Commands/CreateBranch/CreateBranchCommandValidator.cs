using FluentValidation;

namespace ValuationWeb.Application.Features.Branchs.Commands.CreateBranch
{
    public class CreateBranchCommandValidator :  AbstractValidator<CreateBranchCommand>
    {
        public CreateBranchCommandValidator()
        {
            RuleFor(p => p.Name)
                .NotEmpty().WithMessage("{PropertyName} is required.")
                .NotNull()
                .MaximumLength(10).WithMessage("{PropertyName} must not exceed 10 characters.");
        }
    }
}
