
$(document).ready(function () {
   
    BindAuditLogTableName();
    BindUserName();
});



function BindAuditLogTableName() {
  
    var ParentTableName = $("#ParentTableName");
    var _val = "";
    var _rpname = "parentTableName";
   /* BindDropdowns(GetAuditTableNameList, ParentTableName, _rpname, _val);*/

    $.ajax({
        type: Get,
        url: BaseURL + GetAuditTableNameList,
        "datatype": "json",
        success: function (response) {
            
            ParentTableName.empty().append('<option selected="selected" value="">-- select --</option>');
            for (var i = 0; i < response.length; i++) {
                ParentTableName.append($("<option></option>").val(response[i].parentTableName).html(response[i].parentTableName));
            }
            if (_val != 0) {
                ParentTableName.val(_val);
            }
        },
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert(response.responseText);
            $("#loader").hide();
        }
    });
}

function BindUserName() {
   
    var userName = $("#UserName");
    var _val = "";
    var _rpname = "userName";
    BindDropdowns(GetUserNameList, userName, _rpname, _val);
}


