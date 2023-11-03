function PosttopHeader() {
    // Reset previous error messages
    toastr.clear();

    // Get values from textboxes
    var userPassword = $('#NewPassword').val();
    var confirmPassword = $('#ConfirmPassword').val();

    // Check if either textbox is empty
    if (!userPassword || !confirmPassword) {
        toastr.error("Both New Password and Confirm Password are required.");
        return;
    }

    // Check if passwords match
    if (userPassword !== confirmPassword) {
        toastr.error("New Password and Confirm Password do not match.");
        return;
    }
    if (userPassword.length < 8 && confirmPassword.length<8) {
        toastr.error("Password must be atleast 8 characters");
        return;
    }
   
    //$("#NewPassword").on("input", function () {
    //    var newPassword = $(this).val();
    //    var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
    //    if (!regex.test(newPassword)) {
    //        toastr.error("A password must have Minimum 8, Maximum 16 characters, at least one number, at least one upper case, at least one lower case, and at least one special character e.g. @$!%*?&");
    //    } else {
    //        toastr.clear();
    //    }
    //});

    //$("#ConfirmPassword").on("input", function () {
    //    var confirmPassword = $(this).val();
    //    var newPassword = $("#NewPassword").val();

    //    if (confirmPassword !== newPassword) {
    //        toastr.error("Passwords do not match.");
    //    } else {
    //        toastr.clear();
    //    }
    //});
    $("#NewPassword").on("change", function () {
        var newPassword = $(this).val();
        var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
        if (!regex.test(newPassword)) {
            toastr.error("A password must have Minimum 8, Maximum 16 characters, at least one number, at least one upper case, at least one lower case, and at least one special character e.g. @$!%*?&");
        } else {
            toastr.clear();
        }
    });

    $("#ConfirmPassword").on("change", function () {
        var confirmPassword = $(this).val();
        var newPassword = $("#NewPassword").val();

        if (confirmPassword !== newPassword) {
            toastr.error("Passwords do not match.");
        } else {
            toastr.clear();
        }
    });


    // Prepare the data to send to the server
    var changePassword = {
        UserId: 0,
        NewPassword: userPassword,
        ConfirmPassword: confirmPassword
    };

    $.ajax({
        type: "POST",
        url: $('#hdnBaseURL').val() + ChangePasswordUrl,
        dataType: "json",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        data: JSON.stringify(changePassword),
        success: function (response) {
            if (response && response.errors) {
                // Display validation errors in Toastr notifications
                for (var i = 0; i < response.errors.length; i++) {
                    toastr.error(response.errors[i]);
                }
            } else {
                toastr.success('Password changed successfully!');
                window.location.href = "/MasterUser/Users";
            }
        },
        error: function (xhr) {
            if (xhr.responseJSON && xhr.responseJSON.errors) {
                for (var i = 0; i < xhr.responseJSON.errors.length; i++) {
                    toastr.error(xhr.responseJSON.errors[i]);
                }
            } else {
                toastr.error('An error occurred while processing your request.');
            }
            $("#loader").hide();
        }
    });
}


//function PosttopHeader() {
//    debugger;
//    var changePassword = {
//        'UserId': 0,
//        'NewPassword': '',
//        'ConfirmPassword': ''
//    }
//    debugger;
//    var userpswd = $('#NewPassword').val();
//    var confirmpswd = $('#ConfirmPassword').val();
//    changePassword.NewPassword = userpswd;
//    changePassword.ConfirmPassword = confirmpswd;


//    $.ajax({
//        type: "POST",
//        url: $('#hdnBaseURL').val() + ChangePasswordUrl,
//        "dataType": "json",
//        headers: {
//            'Accept': 'application/json',
//            'Content-Type': 'application/json'
//        },
//        data: JSON.stringify(changePassword),
//        success: function (response) {
//            if (response && response.errors) {
//                // Display validation errors in Toastr notifications
//                for (var i = 0; i < response.errors.length; i++) {
//                    toastr.error(response.errors[i]);
//                }
//            } else {
//                toastr.success('Password changed successfully!');
//                window.location.href = "/MasterUser/Users";
//            }
//            //window.location.href = "/MasterUser/Users";
//        },
//        error: function (xhr) {
//        if (xhr.responseJSON && xhr.responseJSON.errors) {
//            for (var i = 0; i < xhr.responseJSON.errors.length; i++) {
//                toastr.error(xhr.responseJSON.errors[i]);
//            }
//        } else {
//            toastr.error('An error occurred while processing your request.');
//        }
//        $("#loader").hide();
//    }
//        //error: function (response) {
//        //    alert(response.responseText);
//        //    $("#loader").hide();
//        //}
//    });
//}

