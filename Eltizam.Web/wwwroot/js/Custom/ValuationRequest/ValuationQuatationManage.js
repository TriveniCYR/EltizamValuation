$(document).ready(function () {
    document.getElementById('ValuationFee').value = '';
    document.getElementById('Vat').value = '';
});
$('#ValuationFee').keypress(function (e) {
    
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