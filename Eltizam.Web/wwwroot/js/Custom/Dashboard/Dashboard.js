$(document).ready(function () {
    BindClientNameDropdown();
    BindPropertyNameDropdown();
});


function BindClientNameDropdown() {
    var Client = $("#Client_Name");
    var _val = 0;
    var _rpname = "clientName";
    var id = 0;
    BindDropdowns(AllClient + '/' + id, Client, _rpname, _val);
}

function BindPropertyNameDropdown() {
    var property = $("#Property_name");
    var _val = 0;
    var _rpname = "propertyName";
    var propertytypeid = 0;
    var subpropertytypeid = 0;
    var ownershiptypeid = 0;
    BindDropdowns(AllProperty + '/' + propertytypeid + '/' + subpropertytypeid + '/' + ownershiptypeid, property, _rpname, _val);
}