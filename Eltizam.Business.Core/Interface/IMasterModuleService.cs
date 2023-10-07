using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Eltizam.Business.Models;

namespace Eltizam.Business.Core.Interface
{
    public interface IMasterModuleService
    {
        Task<List<MasterModuleEntity>> GetAll();

        Task<List<MasterModuleEntity>> GetByRoleId(int roleId);

        Task<IEnumerable<dynamic>> GetByPermisionRoleUsingRoleId(int roleId);
    }
}
