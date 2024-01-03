using Eltizam.Business.Models;
using Eltizam.Utility.Enums;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterNotificationService
    {
        Task<DBOperation>SendEmail(SendNotificationModel notificationModel);
        Task<DBOperation> SendEmail2(SendNotificationModel notificationModel);
        SendNotificationModel GetValuationNotificationData(RecepientActionEnum subjectEnum, int valiadtionRequestId); 
        List<MasterNotificationEntitty> GetAll(int userId, int? valId, int? pagenum);
        Task<DBOperation> UpdateNotification(int notificationid, int readBy);
        void UpdateValuationRequestStatus(int newStatusId, int valuationRequestId);
        int GetAllCount(int userId, int? valId);
    }
}
