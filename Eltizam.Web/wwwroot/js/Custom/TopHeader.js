var ChangePasswordUrl = $("ChangePasswordUrl").val();

function PosttopHeader() {
    // Reset previous error messages
    toastr.clear();
    var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;

    // Get values from textboxes
    var userPassword = $('#NewPassword').val();
    var confirmPassword = $('#ConfirmPassword').val(); 

    // Check if passwords match
    if (userPassword !== confirmPassword) {
        toastr.error("New Password and Confirm Password do not match.");
        return;
    }
    else if (!regex.test(userPassword)) {
        toastr.error("Password should be atleast 8 characters with one number, upper case, lower case & special character e.g. @$!5%B*gr&");
        return;
    }  

    // Prepare the data to send to the server
    var changePassword =
    {
        UserId: LogInUserId,
        NewPassword: userPassword,
        ConfirmPassword: confirmPassword
    }; 

    $.ajax({
        type: "POST",
        url: BaseURL + ChangePasswordUrl,
        dataType: "json",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        data: JSON.stringify(changePassword),
        success: function (response) {
            if (response && response.errors) { 
                for (var i = 0; i < response.errors.length; i++) {
                    toastr.error(response.errors[i]);
                }
            } else {
                toastr.success('Password changed successfully!'); 
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

$("#NewPassword").on("leave", function () {
    var newPassword = $(this).val();
    var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
    if (!regex.test(newPassword)) {
        toastr.error("A password must have Minimum 8, Maximum 16 characters, at least one number, at least one upper case, at least one lower case, and at least one special character e.g. @$!%*?&");
    } else {
        toastr.clear();
    }
});

$("#ConfirmPassword").on("leave", function () {
    var confirmPassword = $(this).val();
    var newPassword = $("#NewPassword").val();

    if (confirmPassword !== newPassword) {
        toastr.error("Passwords do not match.");
    } else {
        toastr.clear();
    }
});
function profileMenu() {
    var x = document.getElementById("profileMenu");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

document.addEventListener("DOMContentLoaded", () => {
    const addRole = document.getElementById("addRole");
    const addRolePopup = document.getElementById("popup-addRole-overlay");
    const closePopup = document.querySelector(".addRoleClose");

    addRole.addEventListener("click", () => addRolePopup.classList.add("display-block"));
    closePopup.addEventListener("click", () => addRolePopup.classList.remove("display-block"));
});

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

