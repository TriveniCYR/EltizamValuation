$(document).ready(function () {
    GetPropertyTypeList();
    GetSubPropertyTypeList();
});
// #region Get Country List
function GetSubPropertyTypeList() {
    ajaxServiceMethod($('#hdnBaseURL').val() + AllSubPropertyType, 'GET', GetSubPropertyTypeListSuccess, GetSubPropertyTypeListError);
}
function GetSubPropertyTypeListSuccess(data) {
    try {
        $.each(data._object, function (index, object) {
            $('#Id').append($('<option>').text(object.propertySubType).attr('value', object.id));
            $('#Id').select2({ dropdownAdapter: $.fn.select2.amd.require('select2/selectAllAdapter') });
            $('#Id').trigger('change');
        });
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function GetSubPropertyTypeListError(x, y, z) {
    toastr.error(ErrorMessage);
}

// #region Get Region List
function GetPropertyTypeList() {
    ajaxServiceMethod($('#hdnBaseURL').val() + AllPropertyType, 'GET', GetPropertyTypeSuccess, GetPropertyTypeError);
}
function GetPropertyTypeSuccess(data) {
    try {
        destoryStaticDataTable('#RegionTable');
        $('#RegionTable tbody').html('');
        $.each(data._object, function (index, object) {
            $('#RegionTable tbody').append('<tr><td>' + object.regionName + '</td><td><span style="color:' + (object.isActive ? "green" : "red") + '">' + (object.isActive ? "Active" : "InActive") + '</span></td><td>  <a class="large-font" style="' + IsEditAllow + '" href="" title="Edit" data-toggle="modal" data-target="#SaveRegionModel" data-backdrop="static" data-keyboard="false"  onclick="GetRegionById(' + object.regionId + '); return false;"><i class="fa fa-fw fa-edit mr-1"></i> ' + '</a> <a class="large-font text-danger" style="' + IsDeleteAllow + '" href="" title="Delete" data-toggle="modal" data-target="#DeleteRegionModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteRegion(' + object.regionId + '); return false;"><i class="fa fa-fw fa-trash mr-1"></i> ' + '</a>  </td></tr>');
        });
        StaticDataTable("#RegionTable");
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function GetPropertyTypeError(x, y, z) {
    toastr.error(ErrorMessage);
}
// #endregion

// #region Get Region By Id
function GetPropertyById(id) {
    ajaxServiceMethod($('#hdnBaseURL').val() + GetRegionByIdUrl + "/" + id, 'GET', GetRegionByIdSuccess, GetRegionByIdError);
}
function GetRegionByIdSuccess(data) {
    try {
        CleareRegionFields();
        var countryIds = data._object.countryIds.toString();
        if (countryIds.includes(',')) { countryIds = countryIds.toString().split(','); }

        $('#SaveRegionModel #CountryId').val(countryIds);
        $('#SaveRegionModel #CountryId').trigger('change');

        $('#SaveRegionModel #RegionCountryMappingId').val(data._object.masterBusinessCountryMappingIds.toString());

        $('#SaveRegionModel #RegionID').val(data._object.regionId);
        $('#SaveRegionModel #MasterRegionEntity_RegionName').val(data._object.regionName);
        $('#SaveRegionModel #RegionTitle').html(UpdateLabel);
        if (!data._object.isActive) {
            $('#SaveRegionModel #MasterRegionEntity_IsActive').prop('checked', false);
        }
        else {
            $('#SaveRegionModel #MasterRegionEntity_IsActive').prop('checked', true);
        }
    }
    catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function GetRegionByIdError(x, y, z) {
    toastr.error(ErrorMessage);
}

//function AddRegion() {
//    CleareRegionFields();
//    $('#SaveRegionModel #RegionTitle').html(AddLabel);
//}
//function SaveRegionForm(form) {
//    var obj = {
//        RegionId: $('#SaveRegionModel #RegionID').val(),
//        RegionName: $('#SaveRegionModel #MasterRegionEntity_RegionName').val(),
//        isActive: $('#SaveRegionModel #MasterRegionEntity_IsActive').prop('checked'),
//        countryIds: $('#CountryId').val().toString(),
//        masterBusinessCountryMappingIds: $('#SaveRegionModel #RegionCountryMappingId').val()
//    };
//    if ($(form).valid()) {
//        ajaxServiceMethod($('#hdnBaseURL').val() + SaveRegion, 'POST', SaveRegionFormSuccess, SaveRegionFormError, JSON.stringify(obj));
//    }
//    return false;
//}
//function SaveRegionFormSuccess(data) {
//    try {
//        $('#SaveRegionModel').modal('hide');
//        if (data._Success === true) {
//            CleareRegionFields();
//            toastr.success(RecordInsertUpdate);
//            GetRegionList();
//        }
//        else {
//            toastr.error(data._Message);
//        }
//    } catch (e) {
//        toastr.error('Error:' + e.message);
//    }
//}
//function SaveRegionFormError(x, y, z) {
//    ErrorMessage = x.responseJSON._Message;
//    toastr.error(ErrorMessage);
//}
//function CleareRegionFields() {
//    $('#SaveRegionModel #MasterRegionEntity_IsActive').prop('checked', true);
//    $('#SaveRegionModel #RegionID').val("0");
//    $('#SaveRegionModel #MasterRegionEntity_RegionName').val("");
//    $('#DeleteRegionModel #RegionID').val("0");
//    $('#SaveRegionModel #RegionCountryMappingId').val("");
//    $('#SaveRegionModel #CountryId').val("");
//    $('#SaveRegionModel #CountryId').trigger('change');
//    var validationMessages = document.querySelectorAll(".field-validation-error");

//    // Loop through the messages and clear them
//    for (var i = 0; i < validationMessages.length; i++) {
//        validationMessages[i].textContent = "";
//    }
//}

//function ConfirmationDeleteRegion(id) {
//    $('#DeleteRegionModel #RegionID').val(id);
//}
//function DeleteRegion() {
//    var tempInAtiveID = $('#DeleteRegionModel #RegionID').val();
//    ajaxServiceMethod($('#hdnBaseURL').val() + DeleteRegionByIdUrl + "/" + tempInAtiveID, 'POST', DeleteRegionByIdSuccess, DeleteRegionByIdError);
//}
//function DeleteRegionByIdSuccess(data) {
//    try {
//        if (data._Success === true) {
//            CleareRegionFields();
//            toastr.success(RecordDelete);
//            GetRegionList();
//        }
//        else {
//            toastr.error(data._Message);
//        }
//    } catch (e) {
//        toastr.error('Error:' + e.message);
//    }
//}
//function DeleteRegionByIdError(x, y, z) {
//    toastr.error(ErrorMessage);
//}
//#endregion