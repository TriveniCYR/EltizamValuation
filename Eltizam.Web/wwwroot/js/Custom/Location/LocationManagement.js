
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

$("#location").submit(function () {
    var errorMsgForAll = "";
    if ($("#CountryId").val() === "" || $("#CountryId").val() === "0") {

        $("#validationCountryId").text("The Country field is required.");
        errorMsgForAll = "1";
    }
    if ($("#StateId").val() === "" || $("#StateId").val() === "0") {

        $("#validationStateId").text("The State field is required.");
        errorMsgForAll += "1";

    }
    if ($("#CityId").val() === "" || $("#CityId").val() === "0") {

        $("#validationCityId").text("The City field is required.");
        errorMsgForAll += "1";

    }
    if ($("#HomeCurrencyId").val() === "" || $("#HomeCurrencyId").val() === "0") {

        $("#validationHomeCurrencyId").text("The HomeCurrency field is required.");
        errorMsgForAll += "1";

    }
    if ($("#ForeignCurrencyId").val() === "" || $("#ForeignCurrencyId").val() === "0") {

        $("#validationForeignCurrencyId").text("The ForeignCurrency field is required.");
        errorMsgForAll += "1";

    }
    if (errorMsgForAll != "") {
        return false;
    }

        //$("#validationMessage").text("");
        //return true;
})

$("#CountryId").change(function () {
    $("#validationCountryId").text("");
});
$("#StateId").change(function () {
    $("#validationStateId").text("");
});
$("#CityId").change(function () {
    $("#validationCityId").text("");
});
$("#HomeCurrencyId").change(function () {
    $("#validationHomeCurrencyId").text("");
});
$("#ForeignCurrencyId").change(function () {
    $("#validationForeignCurrencyId").text("");
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
 