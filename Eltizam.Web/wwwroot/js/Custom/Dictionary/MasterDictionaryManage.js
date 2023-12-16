$(document).ready(function () {
    var isViewValue = getParameterByName('IsView');
    if (isViewValue === '1') {
        $('#masterdictionary').find('input,select,textarea,checkbox').attr('readonly', true).attr('disabled', true);
        $('#btnSaveEdit,#addnevalue,#image').hide();
    }
    else {
        $('#edit').hide();
    }
});

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}


//--- Save dictionary details for each value ------

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
        if (inputValue.length > 250) {
            return toastr.error('SubType Description should not exceed 250 characters');
        }
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

    // Function to check if a URL parameter exists
  
  
}