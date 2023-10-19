$(document).ready(function () {
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
