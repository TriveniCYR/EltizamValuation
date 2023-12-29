
$(document).ready(function () { 
    BindAuditLogTableName();
    BindUserName();
});



function BindAuditLogTableName() {
  
    var TableName = $("#ParentTableName");
    var _val = "";
    var _rpname = "parentTableName";
   /* BindDropdowns(GetAuditTableNameList, ParentTableName, _rpname, _val);*/

    $.ajax({
        type: Get,
        url: BaseURL + GetAuditTableNameList,
        "datatype": "json",
        success: function (response) {
           // console.log(response);
            
            TableName.empty().append('<option selected="selected" value="">-- select --</option>');
            for (var i = 0; i < response.length; i++) {
                TableName.append($("<option></option>").val(response[i].tableName).html(response[i].tableName));
            }
            if (_val != 0) {
                TableName.val(_val);
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

function assignToggleFilter() {
    var x = document.getElementById("assignToggleFilter");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}
 