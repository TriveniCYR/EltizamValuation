$(document).ready(function () {
    //document.getElementById('ValuationFee').value == 0.000000 ? document.getElementById('ValuationFee').placeholder = 'Enter Valuation Fee' : document.getElementById('ValuationFee').value;
    //document.getElementById('Vat').value == null ? '': document.getElementById('Vat').value;
});
var levelData = [];
$('#ValuationFee').keypress(function (e) {

    if ($('#ValuationFee').val() == '' && (e.which == 48 || e.charCode == 46)) {
        return false;
    }
    else {
        if ((e.charCode >= 48 && e.charCode <= 57) || e.charCode == 46) {
            var keypress = e.keyCode || e.which || e.charCode;
            var key = String.fromCharCode(keypress);
            var regEx = /^[0-9]{0,20}(.[0-9]{0,6})?$/;

            var txt = $(this).val() + key;
            if (!regEx.test(txt)) {
                if (keypress != 8) {
                    e.preventDefault();
                } else {
                }
            }
        }
        else {
            e.preventDefault();
        }
    }
});
$('#Vat').keypress(function (e) {
    if ($('#Vat').val() == '' && (e.which == 48 || e.charCode == 46)) {
        return false;
    }
    else {
        if ((e.charCode >= 48 && e.charCode <= 57) || e.charCode == 46) {
            var keypress = e.keyCode || e.which || e.charCode;
            var key = String.fromCharCode(keypress);
            var regEx = /^[0-9]{0,20}(.[0-9]{0,6})?$/;

            var txt = $(this).val() + key;
            if (!regEx.test(txt)) {
                if (keypress != 8) {
                    e.preventDefault();
                } else {
                }
            }
        }
        else {
            e.preventDefault();
        }
    }
});
$('#OtherCharges').keypress(function (e) {
    if ($('#OtherCharges').val() == '' && (e.which == 48 || e.charCode == 46)) {
        return false;
    }
    else {
        if ((e.charCode >= 48 && e.charCode <= 57) || e.charCode == 46) {
            var keypress = e.keyCode || e.which || e.charCode;
            var key = String.fromCharCode(keypress);
            var regEx = /^[0-9]{0,20}(.[0-9]{0,6})?$/;

            var txt = $(this).val() + key;
            if (!regEx.test(txt)) {
                if (keypress != 8) {
                    e.preventDefault();
                } else {
                }
            }
        }
        else {
            e.preventDefault();
        }
    }
});

$('#InstructorCharges').keypress(function (e) {
    if ($('#InstructorCharges').val() == '' && (e.which == 48 || e.charCode == 46)) {
        return false;
    }
    else {
        if ((e.charCode >= 48 && e.charCode <= 57) || e.charCode == 46) {
            var keypress = e.keyCode || e.which || e.charCode;
            var key = String.fromCharCode(keypress);
            var regEx = /^[0-9]{0,20}(.[0-9]{0,6})?$/;

            var txt = $(this).val() + key;
            if (!regEx.test(txt)) {
                if (keypress != 8) {
                    e.preventDefault();
                } else {
                }
            }
        }
        else {
            e.preventDefault();
        }
    }
});

$('#Discount').keypress(function (e) {
    if ($('#Discount').val() == '' && (e.which == 48 || e.charCode == 46)) {
        return false;
    }
    else {
        if ((e.charCode >= 48 && e.charCode <= 57) || e.charCode == 46) {
            var keypress = e.keyCode || e.which || e.charCode;
            var key = String.fromCharCode(keypress);
            var regEx = /^[0-9]{0,20}(.[0-9]{0,6})?$/;

            var txt = $(this).val() + key;
            if (!regEx.test(txt)) {
                if (keypress != 8) {
                    e.preventDefault();
                } else {
                }
            }
        }
        else {
            e.preventDefault();
        }
    }
});

$('#TotalFee').keypress(function (e) {
    if ($('#TotalFee').val() == '' && (e.which == 48 || e.charCode == 46)) {
        return false;
    }
    else {
        if ((e.charCode >= 48 && e.charCode <= 57) || e.charCode == 46) {
            var keypress = e.keyCode || e.which || e.charCode;
            var key = String.fromCharCode(keypress);
            var regEx = /^[0-9]{0,20}(.[0-9]{0,6})?$/;

            var txt = $(this).val() + key;
            if (!regEx.test(txt)) {
                if (keypress != 8) {
                    e.preventDefault();
                } else {
                }
            }
        }
        else {
            e.preventDefault();
        }
    }
});

$('#FixedvaluationFees').keypress(function (e) {
    if ($('#FixedvaluationFees').val() == '' && (e.which == 48 || e.charCode == 46)) {
        return false;
    }
    else {
        if ((e.charCode >= 48 && e.charCode <= 57) || e.charCode == 46) {
            var keypress = e.keyCode || e.which || e.charCode;
            var key = String.fromCharCode(keypress);
            var regEx = /^[0-9]{0,20}(.[0-9]{0,6})?$/;

            var txt = $(this).val() + key;
            if (!regEx.test(txt)) {
                if (keypress != 8) {
                    e.preventDefault();
                } else {
                }
            }
        }
        else {
            e.preventDefault();
        }
    }
});

//$('#ApprovrLevel2').trigger('change')
//{
//    $("#ApprovrLevelId2");
//}
// Add a click event listener for the "View" link
function GetApproverLevel(amount) { 
    var approvrLevel2 = $("#ApproverId2");
    var approvrLevel3 = $("#ApproverId3");
    var _rpname = "approverName";
    var totalAmount = amount;

    $.ajax({
        type: Get,
        url: BaseURL + GetLevelApprover + '?Amount=' + totalAmount,
        "datatype": "json",
        success: function (data) { 
            // console.log(data);

            if (data.length > 0) {

                levelData = data;
                var approverLevelIds = {};

                $.each(data, function (index, item) {
                    approverLevelIds[item.approverLevelId] = true;
                });

                var approverLevelIds = Object.keys(approverLevelIds).map(Number);
                if (!approverLevelIds.includes(2)) {
                    $("[for=ApproverId2]").hide();
                }
                else {
                    $("[for=ApproverId2]").show();
                }
                if (!approverLevelIds.includes(3)) {
                    $("[for=ApproverId3]").hide();
                }
                else {
                    $("[for=ApproverId3]").show();
                }
                //console.log(approverLevelIds);

                var _dd = _rpname;
                approvrLevel2.empty().append('<option selected="selected" value="0">' + dftSel + '</option>');
                approvrLevel3.empty().append('<option selected="selected" value="0">' + dftSel + '</option>');
                for (var i = 0; i < data.length; i++) {
                    if (data[i].approverLevelId == 2) {
                        approvrLevel2.append($("<option></option>").val(data[i].approverId).html(data[i][_dd]));
                    }
                    if (data[i].approverLevelId == 3) {
                        approvrLevel3.append($("<option></option>").val(data[i].approverId).html(data[i][_dd]));
                    }
                } 
            }
            else {
                levelData = [];
                return true;
            }
        },
        error: function (error) {
            console.error('Error fetching data:', error);
        }

    });
}


//$(document).on('click', '#levelApprover', function (e) {
//    // Get amount from form
//    var totalAmount = $('#TotalFee').val();
//    var valuationFee = $('#ValuationFee').val();
//    var valuationVat = $('#Vat').val();
//    var otherCharges = $('#OtherCharges').val();
//    if (totalAmount == "" && valuationFee == "" || valuationVat == "" && otherCharges == "") {
//        toastr.error("Please fill mendate fields.");
//        hideLoader();
//        return false;
//    }
//    var data1 = $("#ApproverId2").val();
//    var data2 = $("#ApproverId3").val();
//    var approverIds = [];
//    if ((data1 != "0" && data1 != null) || (data2 != "0" && data2 != null)) {
//        var commaString = "";
//        if (data1 != "0" && data1 != null) {
//            approverIds.push(2);
//            approverIds.push(data1);
//            commaString = approverIds.join(',');
//            commaString += ";"
//            approverIds = [];
//        }
//        if (data2 != "0" && data2 != null) {
//            approverIds.push(3);
//            approverIds.push(data2);
//            commaString += approverIds.join(',');
//            commaString += ";"
//        }
//        //var commaString = approverIds.join(',');
//        console.log(commaString);
//        document.getElementById('ApproverIds').value = commaString;
//        return true;
//    }
//    else {
//        if (levelData.length > 0) {
//            e.preventDefault();
//            hideLoader();
//            // Fetch data from the API
//            $('#LevelApproverModal').modal('show');
//            return false;
//        }
//        else {
//            return true;
//        }
//    }
//});

function AssignLevelApprover() {
    var data1 = $("#ApproverId2").val();
    var data2 = $("#ApproverId3").val();
    var approverIds = {};
    if (data1 == "0" && data2 == "0") {
        //e.preventDefault();
        return false;
    }
    $("#levelApprover").click()
}
function displayFileNames(input) {
    const fileInput = input;
    const fileNamesInput = input.nextElementSibling;

    const files = fileInput.files;
    let fileNames = "";

    for (let i = 0; i < files.length; i++) {
        fileNames += files[i].name;
        if (i < files.length - 1) {
            fileNames += ", ";
        }
    }

    fileNamesInput.value = fileNames;
}

function ConfirmationDocument(id, isAction) {
    $('#DeleteDocumentModel #ID').val(id);


}
function DeleteDocument() {
    var id = $('#DeleteDocumentModel #ID').val();
    if (id) {
        docId = id;
        ajaxServiceMethod(BaseURL + DeleteUserDocument + "/" + docId, Delete, DeleteUserDocumentSuccess, DeleteUserDocumentError);
    }
    else {
        toastr.error(DeleteAccessDenied);
    }
}
function DeleteUserDocumentSuccess(data) {
    try {
        if (data._Success === true) {
            $('#' + docId).remove();
            toastr.success(RecordDelete);
        }
        else {
            toastr.error(data._Message);
        }
    } catch (e) {
        toastr.error('Error:' + e.message);
    }
}
function DeleteUserDocumentError(x, y, z) {
    toastr.error(ErrorMessage);
}
//------------Calculations-----------------
$('.clsCalculateFee').on('change', function () {
    var ValuationFee = $('#ValuationFee').val();
    var Vat = $('#Vat').val();
    var OtherCharges = $('#OtherCharges').val();
    var InstructorCharges = $('#InstructorCharges').val();
    var Discount = $('#Discount').val();

    ValuationFee = ValuationFee == '' ? 0 : parseFloat(ValuationFee.replace(',', ''));
    Vat = Vat == '' ? 0 : parseFloat(Vat.replace(',', ''));
    OtherCharges = OtherCharges == '' ? 0 : parseFloat(OtherCharges.replace(',', ''));
    InstructorCharges = InstructorCharges == '' ? 0 : parseFloat(InstructorCharges.replace(',', ''));
    Discount = Discount == '' ? 0 : parseFloat(Discount.replace(',', ''));

    var result = ValuationFee + Vat + OtherCharges + InstructorCharges - Discount;
    result = isNaN(result) ? 0 : result;
    $('#TotalFee').val(result);    
    //if (ValuationFee != "" && Vat != "" && OtherCharges != "")
    //{
    //    GetApproverLevel(result);
    //}
    //GetApproverLevel(result);
});

