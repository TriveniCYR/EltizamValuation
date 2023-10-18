//Use this for entire project to bind the data 
function BindDropdowns(_url, _controlID, _retrunPropertyId, _val) { 
    $.ajax({
        type: "GET",
        url: $('#hdnBaseURL').val() + _url,
        "datatype": "json",
        success: function (response) {
            var _dd = _retrunPropertyId;
            _controlID.empty().append('<option selected="selected" value="0">Please select</option>');
            for (var i = 0; i < response.length; i++) {
                _controlID.append($("<option></option>").val(response[i].id).html(response[i][_dd]));
            }
            if (_val != 0) {
                _controlID.val(_val);
            }
        },
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert(response.responseText);
            $("#loader").hide();
        }
    });
}

function GetActiveFlagCss(data) {
    var dd = "";
    if (data === 1 || data === true) {
        dd = "<span class='tableStatus green'>Yes</span>";
    } else {
        dd = "<span class='tableStatus red'>No</span>";
    }
    return dd;
}