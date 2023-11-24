﻿ //--- Save dictionary details for each value ------
function SaveMasterDictionary() {  
    var description = $.trim($('#Description').val());

    if (description === '') {
        return toastr.error('Description can not be left blank');
    }
    if (description.length > 250) {
        return toastr.error('Description should not exceed 250 characters');
    }
    var Dict =
    {
        'Id': $("#hdnPropertyId").val(),
        'Description': $("#Description").val(),
        'IsActive': $('#isActiveT')[0].checked,
        'LogInUserId': LogInUserId,
        'MasterDicitonaryDetails': []
    }  

    var Inputs = $(".addPropertyInputDynamic :input");
    if (Inputs.length == 0) {
        return toastr.error('Atleast one Sub Description value is required');
    }
    var descriptions = {}; 

    for (var i = 0; i < Inputs.length; i++) {
        var inputValue = Inputs[i].value.trim();
        if (inputValue === '') {
            return toastr.error("Subtype Description Cannot be blank");
        } else {
            var objDynamic = {
                'Id': Inputs[i].id,
                'Description': inputValue,
            }

            if (descriptions[objDynamic.Description]) {
                toastr.error("Duplicate description found: " + objDynamic.Description);
                return;
            }

            descriptions[objDynamic.Description] = true;

            Dict.MasterDicitonaryDetails.push(objDynamic); }
     
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
            if (response.status == 409) {
                toastr.error("Description value Already Exist In system")
            }
            else { 
                toastr.error(ErrorMsg)
            }                  
            $("#loader").hide();
        }
    }); 
}