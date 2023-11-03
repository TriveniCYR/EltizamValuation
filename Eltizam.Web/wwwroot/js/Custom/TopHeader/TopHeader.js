function PosttopHeader() {
    debugger;
    var changePassword = {
        'UserId': 0,
        'NewPassword': '',
        'ConfirmPassword': ''        
    }
    debugger;
    var userpswd = $('#NewPassword').val();
    var confirmpswd = $('#ConfirmPassword').val();
    changePassword.NewPassword = userpswd;
    changePassword.ConfirmPassword = confirmpswd;


    $.ajax({
        type: "POST",
        url: $('#hdnBaseURL').val() + ChangePasswordUrl,
        "datatype": "json",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        data: JSON.stringify(changePassword),
        success: function (response) {
            //window.location.href = "/MasterPropertyType/PropertyTypes";
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