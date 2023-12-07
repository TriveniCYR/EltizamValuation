using Eltizam.Business.Models;
using Eltizam.Utility.Enums;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface INotificationService
    {
        Task<DBOperation>SendEmail(SendNotificationModel notificationModel);
        SendNotificationModel GetValuationNotificationData(RecepientActionEnum subjectEnum, int valiadtionRequestId); 
        List<MasterNotificationEntitty> GetAll(int? lastid, int? userId, int? valId);
        Task<DBOperation> UpdateNotification(int notificationid, int readBy);
    }
}
