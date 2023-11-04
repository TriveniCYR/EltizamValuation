 //--- Save dictionary details for each value ------
function SaveMasterDictionary() {  
    var Dict =
    {
        'Id': $("#hdnPropertyId").val(),
        'Description': $("#Description").val(),
        'IsActive': $('#isActiveT')[0].checked,
        'LogInUserId': LogInUserId,
        'MasterDicitonaryDetails': []
    }  

    var Inputs = $(".addPropertyInputDynamic :input");
    for (var i = 0; i < Inputs.length; i++) {
        var objDynamic = {
            'Id': Inputs[i].id,
            'Description': Inputs[i].value,
        }
        Dict.MasterDicitonaryDetails.push(objDynamic);
    }

    var MasterDictionaryEntity = Dict;

    $.ajax({
        type: Post,
        url: BaseURL + MasterDictionaryUpsert,
        "datatype": "json",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        data: JSON.stringify(MasterDictionaryEntity),
        success: function (response) { 
            toastr.success(SucessMsg);
            setTimeout(function () {
                window.location.href = "/MasterDictionary/Dictionary";
            }, 1000);
        },
        failure: function (response) {
            toastr.error(ErrorMsg);
        },
        error: function (response) {
            toastr.error(ErrorMsg);
            $("#loader").hide();
        }
    }); 
}