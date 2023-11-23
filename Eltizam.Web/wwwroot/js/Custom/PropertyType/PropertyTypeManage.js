 
function SavePropertyType() { 
    var propertyType = $.trim($('#PropertyType').val());

    if (propertyType === '') {
        return toastr.error('Property Type Description can not be left blank');
    }
    if (propertyType.length > 250) {
        return toastr.error('Property Type Description should not exceed 250 characters');
    }

    var Dict = {
        'Id': $("#hdnPropertyId").val(),
        'PropertyType': $("#PropertyType").val(),
        'IsActive': $('#isActiveT')[0].checked,
        'LogInUserId': LogInUserId,
        'MasterPropertySubTypes': []
    }  

    var Inputs = $(".addPropertyInputDynamic :input");
    if (Inputs.length == 0) {
        return toastr.error('Atleast one SubType Description is required');
    }
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
                'PropertySubType': inputValue,
            };
            Dict.MasterPropertySubTypes.push(objDynamic);
        }
    }
    var Master_PropertyTypeModel = Dict;

    $.ajax({
        type: "POST",
        url: BaseURL + PropertyByIdSubType,
        "datatype": "json",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        data: JSON.stringify(Master_PropertyTypeModel),
        success: function (response) {
            toastr.success(SucessMsg);
            setTimeout(function () {
                window.location.href = "/MasterPropertyType/PropertyTypes";
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