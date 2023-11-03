function AssignRequest() {
    // $("#ValuationRequestTable  tbody tr").on("click", function (e) {
    //     $("input[type='checkbox']", this).each(function () {
    //         $(this).attr('checked', !$(this).attr('checked'));
    //     });
    // });
    $("#ValuationRequestTable  tbody").find("input:checkbox").each(function () {
        debugger
        this.checked = true;
    });
}
$(document).ready(function () {
    BindRole();
    BindCountry();
    BindState();
    BindCity();
    BindPropertype();
    BindRequestStaus();
    BindResourceType();
    BindApproverList();

});

function assignToggle() {
    var x = document.getElementById("assignToggle");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

function BindApproverList() {
    debugger
    var ApproverList = "@Eltizam.Web.Helpers.APIURLHelper.GetApproverList";
    var Approver = $("#ApproverId");
    var _val = "";
    var _rpname = "userName";
    var currentUserId = "@ViewBag.CurrentUserId";
    let ApproverListUrl = ApproverList + "/" + currentUserId
    BindDropdowns(ApproverListUrl, Approver, _rpname, _val);
}

function BindRole() {

    var RoleList = "@Eltizam.Web.Helpers.APIURLHelper.GetRoleList";
    var Role = $("#RoleId");
    var _val = "";
    var _rpname = "roleName";

    BindDropdowns(RoleList, Role, _rpname, _val);
}

function BindCountry() {

    var CountryList = "@Eltizam.Web.Helpers.APIURLHelper.GetCountryList";
    var Country = $("#CountryId");
    var _val = $('#hdnCountry').val();
    var _rpname = "countryName";
    BindDropdowns(CountryList, Country, _rpname, _val);
}

function BindState() {

    var StateList = "@Eltizam.Web.Helpers.APIURLHelper.GetStateList";
    var State = $("#StateId");
    var _val = $('#hdnState').val();
    var _rpname = "stateName";
    BindDropdowns(StateList, State, _rpname, _val);
}

function BindCity() {
    var CityList = "@Eltizam.Web.Helpers.APIURLHelper.GetCityList";
    var City = $("#CityId");
    var _val = $('#hdnCity').val();
    var _rpname = "cityName";
    BindDropdowns(CityList, City, _rpname, _val);
}

function BindPropertype() {
    //debugger
    var PropertyList = "@Eltizam.Web.Helpers.APIURLHelper.GetPropertyTypeList";
    var PropertyType = $("#PropertyTypeId");
    var _val = $('#hdnPropertyType').val();
    var _rpname = "propertyType";
    BindDropdowns(PropertyList, PropertyType, _rpname, _val);
}

function BindRequestStaus() {
    //debugger
    var ValutionRequestStatusList = "@Eltizam.Web.Helpers.APIURLHelper.GetAllValuationRequestStatus";
    var RequestStaus = $("#RequestStatusId");
    var _val = $('#hdnRequestStaus').val();
    var _rpname = "statusName";
    BindDropdowns(ValutionRequestStatusList, RequestStaus, _rpname, _val);
}
function BindResourceType() {

    var ResourceTypeList = "@Eltizam.Web.Helpers.APIURLHelper.GetResourceTypeList";
    var ResourceType = $("#ResourceId");
    var _val = "";
    var _rpname = "resourceType";
    BindDropdowns(ResourceTypeList, ResourceType, _rpname, _val);
}