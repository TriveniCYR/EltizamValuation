
$(document).ready(function () {
   
    BindAuditLogTableName();
    BindUserName();
});



function BindAuditLogTableName() {
    
    
    var ParentTableName = $("#ParentTableName");
    var _val = "";
    var _rpname = "parentTableName";
    BindDropdowns(GetAuditTableNameList, ParentTableName, _rpname, _val);
}

function BindUserName() {
    debugger

    var userName = $("#UserName");
    var _val = "";
    var _rpname = "userName";
    BindDropdowns(GetUserNameList, userName, _rpname, _val);
}
