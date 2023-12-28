
    document.addEventListener('DOMContentLoaded', function ()
    {
        document.getElementById('FromAmount').addEventListener('blur', function () {
            validateAmounts();
        });
        document.getElementById('ToAmount').addEventListener('blur', function () {
            validateAmounts();
        });

        function validateAmounts() {
            var fromAmount = parseFloat(document.getElementById('FromAmount').value);
            var toAmount = parseFloat(document.getElementById('ToAmount').value);
            if (isNaN(fromAmount) || isNaN(toAmount) || toAmount < fromAmount) {
                document.getElementById('ToAmount').value = '';
                toastr.error('To Amount must be greater than or equal to From Amount.');
            }
        }
    });





