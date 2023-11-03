 
function SavePropertyType() { 
    var Dict = {
        'Id': $("#hdnPropertyId").val(),
        'PropertyType': $("#PropertyType").val(),
        'IsActive': $('#isActiveT')[0].checked,
        'MasterPropertySubTypes': []
    }  

    var Inputs = $(".addPropertyInputDynamic :input");  
    for (var i = 0; i < Inputs.length; i++) {
        var objDynamic = {
            'Id': Inputs[i].id,
            'PropertySubType': Inputs[i].value,
        }
        Dict.MasterPropertySubTypes.push(objDynamic);
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