$(document).ready(function () {
    debugger
    BindQuatationList();
    BindInvoiceList();

});


function BindQuatationList()
{
    let id = 5;
    $.ajax({
        type: Get,
        url: BaseURL + ValuationQuatationList + '?requestId=' + id,
        "datatype": "json",
        success: function (response) {
            debugger;
            if (response != null) {
                debugger
                //destoryStaticDataTable('#QuatationTable');
                //$('#QuatationTable tbody').html('');
                $.each(response, function (index, object) { 
                    var html = '';

                    html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                    html += '<li><a title="View" href="/ValuationRequest/ValuationQuotationManage?id=' + object.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
                    /*html += '<li><a title="Edit" href="/MasterVendor/VendorManage?id=' + object.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';*/
                    html += '<li><a title="Delete" data-toggle="modal" data-target="#DeleteQuotationModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationQuotationVendor(' + object.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                    html += '</ul></div>';

                    $('#QuatationTable tbody').append(' <tr><td>' + object.id + '</td> <td>' + object.valuationFee + '</td><td>' + object.vat
                        + '</td><td>' + object.otherCharges + '</td><td>' + object.discount + '</td><td>' + object.totalFee + '</td><td>' + moment(object.createdDate).format('DD-MMM-YYYY') + '</td><td>' + object.statusId + '</td><td>' + html + '</td></tr>');
                });
                //StaticDataTable("#QuatationTable");
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

function BindInvoiceList() {
    let id = 5;
    $.ajax({
        type: Get,
        url: BaseURL + ValuationInvoiceList + '?requestId=' + id,
        "datatype": "json",
        success: function (response) {
            debugger;
            if (response != null) {
                debugger
                //destoryStaticDataTable('#QuatationTable');
                //$('#QuatationTable tbody').html('');
                $.each(response, function (index, object) {
                    var html = '';

                    html += '<img src="../assets/dots-vertical.svg" alt="dots-vertical" class="activeDots" /> <div class="actionItem"><ul>'
                    html += '<li><a title="View" href="/ValuationRequest/ValuationInvoiceManage?id=' + object.id + '"><img src="../assets/view.svg" alt="view" />View</a></li>';
                    /*html += '<li><a title="Edit" href="/MasterVendor/VendorManage?id=' + object.id + '"><img src="../assets/edit.svg" alt="edit" />Edit</a></li>';*/
                    html += '<li><a title="Delete" data-toggle="modal" data-target="#DeleteInvoiceModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationInvoiceVendor(' + object.id + ');"><img src="../assets/trash.svg" alt="trash" />Delete</a></li>';
                    html += '</ul></div>';

                    $('#InvoiceTable tbody').append(' <tr><td>' + object.id + '</td> <td>' + object.valuationRequestId + '</td><td>' + object.transactionModeId
                        + '</td><td>' + object.transactionStatusId + '</td><td>' + object.amount + '</td><td>' + moment(object.transactionDate).format('DD-MMM-YYYY') + '</td><td>' + moment(object.createdDate).format('DD-MMM-YYYY') + '</td><td>' + html + '</td></tr>');
                });
                //StaticDataTable("#QuatationTable");
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
$('#ValuationFee').keypress(function (e) {
    debugger
    if ($('#ValuationFee').val() == '' && (e.which == 48 || e.charCode == 46)) {
        return false;
    }
    else {
        if ((e.charCode >= 48 && e.charCode <= 57) || e.charCode == 46) {
            var keypress = e.keyCode || e.which || e.charCode;
            var key = String.fromCharCode(keypress);
            var regEx = /^[0-9]{0,12}(.[0-9]{0,6})?$/;

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
            var regEx = /^[0-9]{0,12}(.[0-9]{0,6})?$/;

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
            var regEx = /^[0-9]{0,12}(.[0-9]{0,6})?$/;

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
            var regEx = /^[0-9]{0,12}(.[0-9]{0,6})?$/;

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
            var regEx = /^[0-9]{0,12}(.[0-9]{0,6})?$/;

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
            var regEx = /^[0-9]{0,12}(.[0-9]{0,6})?$/;

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
            var regEx = /^[0-9]{0,12}(.[0-9]{0,6})?$/;

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