var tableId = "LocationTable";
$(document).ready(function () {  
    InitializeLocationDataList();
}); 

//Load data into table
function InitializeLocationDataList() { 
    var ajaxObject = {
        "url": BaseURL + LocationGetAll,
        "type": "POST",
        "data": function (d) {
            var pageNumber = $('#' + tableId).DataTable().page.info();
            d.PageNumber = pageNumber.page;
        },
        "datatype": "json"
    };
    var columnObject = [
        {
            "data": "id", "name": "Id"
        },
        {
            "data": "countryName", "name": "Country"
        },
        {
            "data": "statesEmirates", "name": "States Emirates"
        },
        {
            "data": "regionName", "name": "CityName"
        },
        {
            "data": "sector", "name": "Sector Zone"
        },
        {
            "data": "homeCurrency", "name": "Home Currency"
        },
        {
            "data": "foreignCurrency", "name": "Foreign Currency"
        },
        {
            "data": "isActive", "name": "Active", "render": function (data, type, row, meta) {
                return GetActiveFlagCss(data);
            }
        },
        {
            "data": "action", className: 'notexport actionColumn', "name": "Action", "render": function (data, type, row, meta) {
                var html = '';
                html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                html += '<li><a title="View" href="/MasterLocation/LocationManage?id=' + row.id + '&IsView=1"><img src="../assets/view.svg" alt="view" />View</a></li>';
                html += '<li><a title="Edit" href="/MasterLocation/LocationManage?id=' + row.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';
                html += '<li><a title="Delete" data-toggle="modal" data-target="#DeleteLocationModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDeleteLocation(' + row.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                html += '</ul></div>';

                return html;
            }
        }
    ];

    IntializingDataTable(tableId, setDefaultOrder, ajaxObject, columnObject);
}


//#region Delete Role  
function ConfirmationDeleteLocation(id) {
    $('#DeleteLocationModel #Id').val(id);
}
function DeleteLocation() {
    if (IsDeletePerm) {
        var tid = $('#DeleteLocationModel #Id').val();
        var by = LogInUserId;
        ajaxServiceMethod(BaseURL + DeleteLocationByIdUrl + "/" + tid + "?by=" + by, 'POST', DeleteUserByIdSuccess, DeleteUserByIdError);
    }
    else {
        toastr.error(DeleteAccessDenied);
    }
}
function DeleteUserByIdSuccess(data) {
    try {
        if (data._Success === true) {
            toastr.success(RecordDelete);
            $('#' + tableId).DataTable().draw();
        }
        else {
            toastr.error(data._Message);
        }
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function DeleteUserByIdError(x, y, z) {
    toastr.error(ErrorMessage);
}

$(document).ready(function () {
    BindCountry();
    BindCurrencyHome();
    BindCurrencyForeign();
    var HdnCountryId = $('#hdnCountry').val();
    if (HdnCountryId) {
        BindState(HdnCountryId);
    }
    var HdnStateId = $('#hdnState').val();
    if (HdnStateId) {
        BindCity(HdnStateId);
    }
});

function BindCountry() {
    var countryId = $("#CountryId");
    var _val = $('#hdnCountry').val();
    var _rpname = "countryName";

    BindDropdowns(CountryList, countryId, _rpname, _val);
}
function BindState(id) {
    var state = $("#StateId");
    var _val = $('#hdnState').val();
    var _rpname = "stateName";

    BindDropdowns(stateListUrl + '/' + id, state, _rpname, _val);
}

function BindCity(id) {
    var city = $("#CityId");
    var _val = $('#hdnCity').val();
    var _rpname = "cityName";

    BindDropdowns(cityListUrl + '/' + id, city, _rpname, _val);
}
function BindCurrencyHome() { 
    var id = 7;
    var currencyId = $("#HomeCurrencyId");
    var _val = $('#hdnHomeCurrencyId').val();
    var _rpname = "description";
    BindDropdowns(currencyUrl + '/' + id, currencyId, _rpname, _val);
}
function BindCurrencyForeign() { 
    var id = 7;
    var currencyId = $("#ForeignCurrencyId");
    var _val = $('#hdnForeignCurrencyId').val();
    var _rpname = "description";
    BindDropdowns(currencyUrl + '/' + id, currencyId, _rpname, _val);
}
 