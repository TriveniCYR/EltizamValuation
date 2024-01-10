
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
    //$("#CityId").empty();
    BindDropdowns(stateListUrl + '/' + id, state, _rpname, _val);
}

function BindCity(id) {
    var city = $("#CityId");
    var _val = $('#hdnCity').val();
    var _rpname = "cityName";

    BindDropdowns(cityListUrl + '/' + id, city, _rpname, _val);
}
function BindCurrencyHome() { 
    var currencyId = $("#HomeCurrencyId");
    var _val = $('#hdnHomeCurrencyId').val();
    var _rpname = "description";
    var description = DictionaryCurrencyCode;
    BindDropdownsForDictionary(GetDictionaryWithSubDetails + '?code=' + description, currencyId, _rpname, _val);
}
function BindCurrencyForeign() { 
    var currencyId = $("#ForeignCurrencyId");
    var _val = $('#hdnForeignCurrencyId').val();
    var _rpname = "description";
    var description = DictionaryCurrencyCode;
    BindDropdownsForDictionary(GetDictionaryWithSubDetails + '?code=' + description, currencyId, _rpname, _val);
}
 