$(document).ready(function () {
    debugger
    if (document.location.href.includes('id')){
        debugger        
        var id = $('#hdnId').val();
        GetInvoiceDetail(id);
    }

});

var InvoiceRequest = {
    'TransactionStatusId': 0,
    'Amount': 0,
    'TransactionDate': '',
    'TransactionModeId': 0,
    'ValuationRequestId': 0,
    'ReferenceNo': '',
    'CheckNumer': '',
    'CheckBankName': '',
    'CheckDate': '',
    'CardNumber': '',
    'CardBankName': '',
    'CardHolderName': '',
    'ExpireDate': '',
    'AccountBankName': '',
    'AccountHolderName': '',
    'Note': ''

};

function SaveCashInvoice() {
    let transactionStatusId = $("#TransactionStatusId").val();
    let amouont = $("#Amount").val();
    let transactionDate = $("#TransactionDate").val();
    InvoiceRequest.TransactionDate = transactionDate;
    InvoiceRequest.Amount = amouont;
    InvoiceRequest.TransactionStatusId = transactionStatusId;
    InvoiceRequest.ReferenceNo = '656576';
    InvoiceRequest.ValuationRequestId = 5;
    InvoiceRequest.TransactionModeId = 1;
    SaveInvoice(InvoiceRequest);

}

function SaveChequeInvoice() {
    let transactionStatusId = $("#TransactionStatusId").val();
    let amouont = $("#Amount").val();
    let transactionDate = $("#TransactionDate").val();
    let chequeNumber = $("#ChequeNumber").val();
    let chequeBankName = $("#ChequeBankName").val();
    let chequeDate = $("#ChequeDate").val();
    let chequeRecievedDate = $("#ChequeRecievedDate").val();
    InvoiceRequest.TransactionDate = transactionDate;
    InvoiceRequest.Amount = amouont;
    InvoiceRequest.TransactionStatusId = transactionStatusId;
    InvoiceRequest.ReferenceNo = '6567576';
    InvoiceRequest.ValuationRequestId = 5;
    InvoiceRequest.TransactionModeId = 2;
    InvoiceRequest.CheckNumer = chequeNumber;
    InvoiceRequest.CheckBankName = chequeBankName;
    InvoiceRequest.CheckDate = chequeDate;
    SaveInvoice(InvoiceRequest);
}
function SaveCreditCardInvoice() {
    let transactionStatusId = $("#TransactionStatusId").val();
    let amouont = $("#Amount").val();
    let transactionDate = $("#TransactionDate").val();
    let transactionId = $("#TransactionId").val();
    let creditCardNumber = $("#CreditCardNumber").val();
    let bankName = $("#CardBankName").val();
    let nameOnCard = $("#NameOnCard").val();
    let expiryDate = $("#ExpiryDate").val();
    InvoiceRequest.TransactionDate = transactionDate;
    InvoiceRequest.Amount = amouont;
    InvoiceRequest.TransactionStatusId = transactionStatusId;
    InvoiceRequest.ReferenceNo = '65653786';
    InvoiceRequest.ValuationRequestId = 5;
    InvoiceRequest.TransactionModeId = 3;
    InvoiceRequest.CardNumber = creditCardNumber;
    InvoiceRequest.CardBankName = bankName;
    InvoiceRequest.CardHolderName = nameOnCard;
    InvoiceRequest.ExpireDate = expiryDate;
    SaveInvoice(InvoiceRequest);
}

function SaveNetBankingInvoice() {
    let transactionStatusId = $("#TransactionStatusId").val();
    let amouont = $("#Amount").val();
    let transactionDate = $("#TransactionDate").val();
    let transactionId = $("#TransactionId").val();
    let bankName = $("#BankName").val();
    let accountNumber = $("#AccountNumber").val();
    InvoiceRequest.TransactionDate = transactionDate;
    InvoiceRequest.Amount = amouont;
    InvoiceRequest.TransactionStatusId = transactionStatusId;
    InvoiceRequest.ReferenceNo = '65657699';
    InvoiceRequest.ValuationRequestId = 5;
    InvoiceRequest.TransactionModeId = 4;
    InvoiceRequest.BankName = bankName;
    InvoiceRequest.AccountNumber = accountNumber;
    SaveInvoice(InvoiceRequest);
}

function SaveInvoice(request) {
    debugger
    $.ajax({
        type: "POST",
        url: BaseURL + UpsertValuationInvoice,
        "datatype": "json",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        data: JSON.stringify(request),
        success: function (response) {
            toastr.success(SucessMsg);
            setTimeout(function () {
                window.location.href = "/ValuationRequest/ValuationRequestManage/" + request.ValuationRequestId;
            }, 1000);
        },
        failure: function (response) {
            toastr.error(ErrorMsg);
        },
        error: function (response) {
            toastr.error(ErrorMsg);
            $("#loader").hide();
        }
    });
}

function GetInvoiceDetail(id){
    $.ajax({
        type: "GET",
        url: BaseURL + ValuationInvoiceById + '/'+id,
        "datatype": "json",
        success: function (response) {
            debugger
            if(response._object != null){
                document.getElementById('TransactionStatusId').value = response._object.transactionStatusId;
                document.getElementById('Amount').value = response._object.amount;
                document.getElementById('TransactionDate').value = response._object.transactionDate;
                document.getElementById('ChequeNumber').value = response._object.checkNumer;
                document.getElementById('ChequeBankName').value = response._object.checkBankName;
                document.getElementById('ChequeDate').value = response._object.checkDate;
                document.getElementById('ChequeRecievedDate').value = response._object.chequeRecievedDate;
                document.getElementById('CreditCardNumber').value = response._object.cardNumber;
                document.getElementById('BankName').value = response._object.cardBankName;
                document.getElementById('NameOnCard').value = response._object.cardHolderName;
                document.getElementById('ExpiryDate').value = response._object.expireDate;
                document.getElementById('AccountNumber').value = response._object.accountNumber;
            }
            else{
                toastr.error("Something is occured");
                setTimeout(function () {
                window.location.href = "/ValuationRequest/ValuationRequestManage/" + request.ValuationRequestId;
                }, 1000);
            }
        },
        failure: function (response) {
            toastr.error(ErrorMsg);
        },
        error: function (response) {
            toastr.error(ErrorMsg);
            $("#loader").hide();
        }
    });
}