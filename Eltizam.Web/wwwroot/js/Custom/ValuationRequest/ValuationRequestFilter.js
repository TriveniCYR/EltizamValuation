
$(document).ready(function () {
    BindRole();
    BindCountry();
    BindPropertype();
    BindRequestStaus();
    BindValutionMethod();
    BindApproverList(); 
    BindClientNameDropdown();
    BindPropertyNameDropdown();

});
function BindClientNameDropdown() {
    var Client = $("#ClientName");
    var _val = 0;
    var _rpname = "clientName";
    var id = 0;
    BindDropdowns(AllClient + '/' + id, Client, _rpname, _val);
}

function BindPropertyNameDropdown() {
    var property = $("#PropertyName");
    var _val = 0;
    var _rpname = "propertyName";
    var propertytypeid = 0;
    var subpropertytypeid = 0;
    var ownershiptypeid = 0;
    BindDropdowns(AllProperty + '/' + propertytypeid + '/' + subpropertytypeid + '/' + ownershiptypeid, property, _rpname, _val);
}
function assignToggle() {
    var x = document.getElementById("assignToggle");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        document.getElementById('Remarks').value = "";
        document.getElementById('ApproverId').value = 0;
        x.style.display = "none";
    }
}



function BindApproverList() {
    var Approver = $("#ApproverId");
    var _val = "";
    var _rpname = "userName";
    var currentUserId = LogInUserId;
    let ApproverListUrl = ApproverList + "/" + currentUserId+"/Approver"
    BindDropdowns(ApproverListUrl, Approver, _rpname, _val);
}

function BindRole() {


    var Role = $("#RoleId");
    var _val = "";
    var _rpname = "roleName";

    BindDropdowns(RoleList, Role, _rpname, _val);
}

function BindCountry() {


    var Country = $("#CountryId");
    var _val = $('#hdnCountry').val();
    var _rpname = "countryName";
    BindDropdowns(CountryList, Country, _rpname, _val);
}

function BindState(id) {
    var State = $("#StateId");
    var _val = $('#hdnState').val();
    var _rpname = "stateName";

    BindDropdowns(StateList + '/' + id, State, _rpname, _val);
}

function BindCity(id) {

    var City = $("#CityId");
    var _val = $('#hdnCity').val();
    var _rpname = "cityName";
    BindDropdowns(CityList + '/' + id, City, _rpname, _val);
}

function BindPropertype() {

    var PropertyType = $("#PropertyTypeId");
    var _val = $('#hdnPropertyType').val();
    var _rpname = "propertyType";
    BindDropdowns(PropertyList, PropertyType, _rpname, _val);
}

function BindRequestStaus() {
        var RequestStaus = $("#RequestStatusId");
    var _val = $('#hdnRequestStaus').val();
    var _rpname = "statusName";
    BindDropdowns(ValutionRequestStatusList, RequestStaus, _rpname, _val);
}
// function BindResourceType() {

//     var ResourceTypeList = "@Eltizam.Web.Helpers.APIURLHelper.GetResourceTypeList";
//     var ResourceType = $("#ResourceId");
//     var _val = "";
//     var _rpname = "resourceType";
//     BindDropdowns(ResourceTypeList, ResourceType, _rpname, _val);
// }

function BindValutionMethod() {


    var ResourceType = $("#ResourceId");
    var _val = "";
    var _rpname = "description";
    BindDropdowns(ResourceTypeList, ResourceType, _rpname, _val);
}