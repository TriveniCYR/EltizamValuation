using Eltizam.Business.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Eltizam.Utility.Enums.GeneralEnum;

namespace Eltizam.Business.Core.Interface
{
    public interface INotificationService
    {
        Task<DBOperation>SendEmail(SendEmailModel request,int valuationRequestId,int statusId);
        SendEmailModel GetToEmail(string action, int valiadtionRequestId);
        //List<MasterNotificationEntitty> GetAll();
        List<MasterNotificationEntitty> GetAll(int? lastid);
        Task<DBOperation> UpdateNotification(int notificationid, int readBy);
    }
}
