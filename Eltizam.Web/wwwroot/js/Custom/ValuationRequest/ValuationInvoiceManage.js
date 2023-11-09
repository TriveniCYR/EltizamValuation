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
    let hdnReferenceNo = $("#hdnReferenceNo").val();
    let hdnValuationRequestId = $("#hdnValuationRequestId").val();
    if (transactionStatusId === undefined || isNaN(parseInt(transactionStatusId))) {
            toastr.error("Select Status.");
            return false;
        }
    else if (amouont == '') {
        toastr.error("Enter Amount.");
        return false;
    }
    InvoiceRequest.TransactionDate = transactionDate;
    InvoiceRequest.Amount = amouont;
    InvoiceRequest.TransactionStatusId = transactionStatusId;
    InvoiceRequest.ReferenceNo = hdnReferenceNo;
    InvoiceRequest.ValuationRequestId = hdnValuationRequestId;
    InvoiceRequest.TransactionModeId = 1;
    SaveInvoice(InvoiceRequest);

}

function SaveChequeInvoice() {
    let transactionStatusId = $("#TransactionStatusId").val();
    let amouont = $("#ChequeAmount").val();
    let transactionDate = $("#ChequeTransactionDate").val();
    let chequeNumber = $("#ChequeNumber").val();
    let chequeBankName = $("#ChequeBankName").val();
    let chequeDate = $("#ChequeDate").val();
    let chequeRecievedDate = $("#ChequeRecievedDate").val();
    let hdnReferenceNo = $("#hdnReferenceNo").val();
    let hdnValuationRequestId = $("#hdnValuationRequestId").val();
    if (transactionStatusId === undefined || isNaN(parseInt(transactionStatusId))) {
        toastr.error("Select Status.");
        return false;
    }
    else if (amouont == '') {
        toastr.error("Enter Amount.");
        return false;
    }
    else if (chequeNumber == '') {
        toastr.error("Enter Cheque No.");
        return false;
    }
    else if (chequeBankName == '') {
        toastr.error("Enter Bank Name.");
        return false;
    }
    InvoiceRequest.TransactionDate = transactionDate;
    InvoiceRequest.Amount = amouont;
    InvoiceRequest.TransactionStatusId = transactionStatusId;
    InvoiceRequest.ReferenceNo = hdnReferenceNo;
    InvoiceRequest.ValuationRequestId = hdnValuationRequestId;
    InvoiceRequest.TransactionModeId = 2;
    InvoiceRequest.CheckNumer = chequeNumber;
    InvoiceRequest.CheckBankName = chequeBankName;
    InvoiceRequest.CheckDate = chequeDate;
    SaveInvoice(InvoiceRequest);
}
function SaveCreditCardInvoice() {
    let transactionStatusId = $("#TransactionStatusId").val();
    let amouont = $("#CardAmount").val();
    let transactionDate = $("#CardTransactionDate").val();
    let transactionId = $("#TransactionId").val();
    let creditCardNumber = $("#CreditCardNumber").val();
    let bankName = $("#CardBankName").val();
    let nameOnCard = $("#NameOnCard").val();
    let expiryDate = $("#ExpiryDate").val();
    let hdnReferenceNo = $("#hdnReferenceNo").val();
    let hdnValuationRequestId = $("#hdnValuationRequestId").val();
    if (transactionStatusId === undefined || isNaN(parseInt(transactionStatusId))) {
        toastr.error("Select Status.");
        return false;
    }
    else if (amouont == '') {
        toastr.error("Enter Amount.");
        return false;
    }
    else if (creditCardNumber == '') {
        toastr.error("Enter Card Number.");
        return false;
    }
    else if (bankName == '') {
        toastr.error("Enter Bank Name.");
        return false;
    }
    else if (nameOnCard == '') {
        toastr.error("Enter Holder Name.");
        return false;
    }
    InvoiceRequest.TransactionDate = transactionDate;
    InvoiceRequest.Amount = amouont;
    InvoiceRequest.TransactionStatusId = transactionStatusId;
    InvoiceRequest.ReferenceNo = hdnReferenceNo;
    InvoiceRequest.ValuationRequestId = hdnValuationRequestId;
    InvoiceRequest.TransactionModeId = 3;
    InvoiceRequest.CardNumber = creditCardNumber;
    InvoiceRequest.CardBankName = bankName;
    InvoiceRequest.CardHolderName = nameOnCard;
    InvoiceRequest.ExpireDate = expiryDate;
    SaveInvoice(InvoiceRequest);
}

function SaveNetBankingInvoice() {
    let transactionStatusId = $("#TransactionStatusId").val();
    let amouont = $("#BankAmount").val();
    let transactionDate = $("#BankTransactionDate").val();
    let transactionId = $("#TransactionId").val();
    let bankName = $("#BankName").val();
    let accountNumber = $("#AccountNumber").val();
    let hdnReferenceNo = $("#hdnReferenceNo").val();
    let hdnValuationRequestId = $("#hdnValuationRequestId").val();
    if (transactionStatusId === undefined || isNaN(parseInt(transactionStatusId))) {
        toastr.error("Select Status.");
        return false;
    }
    else if (amouont == '') {
        toastr.error("Enter Amount.");
        return false;
    }
    else if (bankName == '') {
        toastr.error("Enter Bank Name.");
        return false;
    }
    else if (accountNumber == '') {
        toastr.error("Enter Account Number.");
        return false;
    }
    InvoiceRequest.TransactionDate = transactionDate;
    InvoiceRequest.Amount = amouont;
    InvoiceRequest.TransactionStatusId = transactionStatusId;
    InvoiceRequest.ReferenceNo = hdnReferenceNo;
    InvoiceRequest.ValuationRequestId = hdnValuationRequestId;
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
            if (response._object != null) {
                let modeId = response._object.transactionModeId;
                document.getElementById('TransactionStatusId').value = response._object.transactionStatusId;
                if (modeId == 1) {
                    document.getElementById('Amount').value = response._object.amount;
                    document.getElementById('TransactionDate').value = response._object.transactionDate;
                }
                else if (modeId == 2) {
                    document.getElementById('ChequeAmount').value = response._object.amount;
                    document.getElementById('ChequeTransactionDate').value = response._object.transactionDate;
                }
                else if (modeId == 3) {
                    document.getElementById('CardAmount').value = response._object.amount;
                    document.getElementById('CardTransactionDate').value = response._object.transactionDate;
                }
                else if (modeId == 4) {
                    document.getElementById('BankAmount').value = response._object.amount;
                    document.getElementById('BankTransactionDate').value = response._object.transactionDate;
                }
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