$(document).ready(function () {
    $('#MasterApproverLevel').submit(function (event) {
        var fromAmount = parseFloat($('#FromAmount').val());
        var toAmount = parseFloat($('#ToAmount').val());
        if (!isNaN(fromAmount) && !isNaN(toAmount) && fromAmount > toAmount) {
            toastr.error('From Amount must be less than or equal to To Amount.');
            event.preventDefault();
        }
    });
});
