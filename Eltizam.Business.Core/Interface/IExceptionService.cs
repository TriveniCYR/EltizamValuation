using System;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IExceptionService
    {
        Task<DBOperation> LogException(Exception exception);
    }
}
