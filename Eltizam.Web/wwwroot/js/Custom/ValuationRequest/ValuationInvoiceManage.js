var docId = 0;
$(document).ready(function () {
    if (document.location.href.includes('id')){
        var id = $('#hdnId').val();
        GetInvoiceDetail(id);
    }
    BindTransactionstatus();
});


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
    'TransactionId': '',
    'ChequeRecievedDate': '',
    'Note': ''

};

function SaveInvoice() { 
    var ErrMsg = "";
    var modeId = $('#hdnTabId').val();
    document.getElementById('TransactionModeId').value = parseInt(modeId);

    if (modeId == 1) {
        document.getElementById('CheckNumer').value = '';
        document.getElementById('CheckBankName').value = '';
        document.getElementById('CheckDate').value = ''
        document.getElementById('ChequeRecievedDate').value = '';
        document.getElementById('CardNumber').value = '';
        document.getElementById('CardBankName').value = '';
        document.getElementById('CardHolderName').value = '';
        document.getElementById('ExpireDate').value = '';
        document.getElementById('AccountBankName').value = '';
        document.getElementById('AccountHolderName').value = '';
    }
    else if (modeId == 2) {
        document.getElementById('CardNumber').value = '';
        document.getElementById('CardBankName').value = '';
        document.getElementById('CardHolderName').value = '';
        document.getElementById('ExpireDate').value = '';
        document.getElementById('AccountBankName').value = '';
        document.getElementById('AccountHolderName').value = '';
    }
    else if (modeId == 3) {
        document.getElementById('CheckNumer').value = '';
        document.getElementById('CheckBankName').value = '';
        document.getElementById('CheckDate').value = ''
        document.getElementById('ChequeRecievedDate').value = '';
        document.getElementById('AccountBankName').value = '';
        document.getElementById('AccountHolderName').value = '';
    }
    else if (modeId == 4) {
        document.getElementById('CheckNumer').value = '';
        document.getElementById('CheckBankName').value = '';
        document.getElementById('CheckDate').value = ''
        document.getElementById('ChequeRecievedDate').value = '';
        document.getElementById('CardNumber').value = '';
        document.getElementById('CardBankName').value = '';
        document.getElementById('CardHolderName').value = '';
        document.getElementById('ExpireDate').value = '';
    }
    if(modeId=='1') {
        let transactionStatusId = $("#CashTransactionStatusId").val();
        let amouont = $("#CashAmount").val();
        let transactionDate = $("#CashTransactionDate").val(); 
        if (transactionStatusId === undefined || isNaN(parseInt(transactionStatusId)) || transactionStatusId == '0') {
            ErrMsg += "Select Transaction."; 
        }
        else if (amouont == '') {
            ErrMsg += "Enter Amount."; 
        }
        else if (transactionDate == '') {
            ErrMsg += "Enter Transaction Date."; 
        } 

        //InvoiceRequest.TransactionDate = transactionDate;
        //InvoiceRequest.Amount = amouont;
        //InvoiceRequest.TransactionStatusId = transactionStatusId;
        //InvoiceRequest.ReferenceNo = hdnReferenceNo;
        //InvoiceRequest.ValuationRequestId = hdnValuationRequestId;
        //InvoiceRequest.TransactionModeId = 1;
        //SaveInvoiceData(InvoiceRequest); 
    }

    else if (modeId == '2') {
        let transactionStatusId = $("#ChequeTransactionStatusId").val();
        let amouont = $("#ChequeAmount").val();
        let transactionDate = $("#ChequeTransactionDate").val();
        let chequeNumber = $("#CheckNumer").val();
        let chequeBankName = $("#CheckBankName").val(); 
        let chequeRecievedDate = $("#ChequeRecievedDate").val(); 

        if (transactionStatusId === undefined || isNaN(parseInt(transactionStatusId)) || transactionStatusId == '0') {
            ErrMsg += "Select Transaction."; 
            hideLoader();
        }
        else if (amouont == '') {
            ErrMsg += "Enter Amount."; 
        }
        else if (transactionDate == '') {
            ErrMsg += "Enter Transaction Date.";
        }
        else if (chequeRecievedDate == '') {
            ErrMsg += "Enter Cheque Recieved Date."; 
        }
        else if (chequeNumber == '') {
            ErrMsg += "Enter Cheque No."; 
        }
        else if (chequeBankName == '') {
            ErrMsg += "Enter Bank Name."; 
        }
    }

    else if(modeId=='3') {
        let transactionStatusId = $("#CardTransactionStatusId").val();
        let amouont = $("#CardAmount").val();
        let transactionDate = $("#CardTransactionDate").val();
        let transactionId = $("#CardTransactionId").val();
        let creditCardNumber = $("#CardNumber").val();
        let bankName = $("#CardBankName").val();
        let nameOnCard = $("#CardHolderName").val(); 
        if (transactionStatusId === undefined || isNaN(parseInt(transactionStatusId)) || transactionStatusId == '0') {
            ErrMsg += "Select Transaction.";
        }
        else if (amouont == '') {
            ErrMsg += "Enter Transaction Date."; 
        }
        else if (transactionDate == '') {
            ErrMsg += "Enter Amount."; 
        }
        else if (creditCardNumber == '') {
            ErrMsg += "Enter Card Number."; 
        }
        else if (bankName == '') {
            ErrMsg += "Enter Bank Name."; 
        }
        else if (nameOnCard == '') {
            ErrMsg += "Enter Holder Name."; 
        }
        else if (transactionId == '') {
            ErrMsg += "Enter Transaction Id."; 
        }
    }

    else if(modeId=='4') {
        let transactionStatusId = $("#BankTransactionStatusId").val();
        let amouont = $("#BankAmount").val();
        let transactionDate = $("#BankTransactionDate").val();
        let transactionId = $("#BankTransactionId").val();
        let bankName = $("#AccountBankName").val();
        let accountNumber = $("#AccountHolderName").val(); 
        if (transactionStatusId === undefined || isNaN(parseInt(transactionStatusId)) || transactionStatusId == '0') {
            ErrMsg += "Select Transaction.";
        }
        else if (amouont == '') {
            ErrMsg += "Enter Transaction Date.";
        }
        else if (transactionDate == '') {
            ErrMsg += "Enter Amount.";
        }
        else if (bankName == '') {
            ErrMsg += "Enter Bank Name.";
        }
        else if (accountNumber == '') {
            ErrMsg += "Enter Account Number.";
        }
        else if (transactionId == '') {
            ErrMsg += "Enter Transaction Id.";
        }
    }
     
    if (ErrMsg !== "") {
        toastr.error(ErrMsg);
        hideLoader();
        return false;
    }
    else {        
        return true;
    }
}

//function SaveInvoiceData(request) { 
//    $.ajax({
//        type: "POST",
//        url: BaseURL + UpsertValuationInvoice,
//        "datatype": "json",
//        headers: {
//            'Accept': 'application/json',
//            'Content-Type': 'application/json'
//        },
//        data: JSON.stringify(request),
//        success: function (response) {
//            toastr.success(SucessMsg);
//            setTimeout(function () {
//                window.location.href = "/ValuationRequest/ValuationRequestManage?id=" + request.ValuationRequestId;
//            }, 1000);
//        },
//        failure: function (response) {
//            toastr.error(ErrorMsg);
//        },
//        error: function (response) {
//            toastr.error(ErrorMsg);
//            $("#loader").hide();
//        }
//    });
//}


$('#AccountNumber').keypress(function (e) {
    if ($('#AccountNumber').val() == '' && e.which == 48) {
        return false;
    }
    else {
        var charCode = (e.which) ? e.which : event.keyCode;
        if (String.fromCharCode(charCode).match(/[^0-9]/g)) {
            return false;
        }
    }
});

function validateInput(input) {
    // Remove non-alphabetic characters and digits
    input.value = input.value.replace(/[^a-zA-Z\s]/g, '');
}

function GetInvoiceDetail(id){
    $.ajax({
        type: "GET",
        url: BaseURL + ValuationInvoiceById + '/'+id,
        "datatype": "json",
        success: function (response) {
            if (response._object != null) {
                let modeId = response._object.transactionModeId;
                document.getElementById('hdnTransactionStatusId').value = response._object.transactionStatusId;
                document.getElementById('hdnTransactionModeId').value = response._object.transactionModeId;
                if (modeId == 1) {
                    document.getElementById('CashAmount').value = response._object.amount;
                    document.getElementById('CashTransactionDate').value = moment(response._object.transactionDate).format('DD-MMM-YYYY');
                    document.getElementById('CashTransactionStatusId').value = response._object.transactionStatusId;
                }
                else if (modeId == 2) {
                    document.getElementById('ChequeAmount').value = response._object.amount;
                    document.getElementById('ChequeTransactionDate').value = moment(response._object.transactionDate).format('DD-MMM-YYYY');
                    document.getElementById('ChequeRecievedDate').value = moment(response._object.chequeRecievedDate).format('DD-MMM-YYYY');
                    document.getElementById('ChequeTransactionStatusId').value = response._object.transactionStatusId;
                }
                else if (modeId == 3) {
                    document.getElementById('CardAmount').value = response._object.amount;
                    document.getElementById('CardTransactionDate').value = moment(response._object.transactionDate).format('DD-MMM-YYYY');
                    document.getElementById('CardTransactionId').value = response._object.transactionId;
                    document.getElementById('CardTransactionStatusId').value = response._object.transactionStatusId;
                    document.getElementById('ExpireDate').value = moment(response._object.expireDate).format('DD-MMM-YYYY');
                }
                else if (modeId == 4) {
                    document.getElementById('BankAmount').value = response._object.amount;
                    document.getElementById('BankTransactionDate').value = moment(response._object.transactionDate).format('DD-MMM-YYYY');
                    document.getElementById('BankTransactionId').value = response._object.transactionId;
                    document.getElementById('BankTransactionStatusId').value = response._object.transactionStatusId;
                }
                document.getElementById('CheckNumer').value = response._object.checkNumer;
                document.getElementById('CheckBankName').value = response._object.checkBankName;
                document.getElementById('CheckDate').value = response._object.checkDate
                document.getElementById('ChequeRecievedDate').value =response._object.chequeRecievedDate;
                document.getElementById('CardNumber').value = response._object.cardNumber;
                document.getElementById('CardBankName').value = response._object.cardBankName;
                document.getElementById('AccountBankName').value = response._object.accountBankName;
                document.getElementById('CardHolderName').value = response._object.cardHolderName;
                document.getElementById('AccountHolderName').value = response._object.accountHolderName;
                if (response._object.documents != null && response._object.documents.length > 0) {
                    var documents = response._object.documents;
                    $.each(documents, function (index, object) {
                        //var html = '';
                        //html += '<tr id="' + object.id + '">';
                        //html += '<td>' + object.DocumentName + '</td>';
                        //html += '<td class="formatted-td-date-input">' + moment(object.CreatedDate).format('DD-MMM-YYYY') + '</td>';
                        //html += '<td class="formatted-td-date-input">' + object.CreatedName + '</td>';
                        //html += '<td><a href="' + object.FilePath + '" download target="_blank"><img src="../assets/download.svg" alt="download" /></a></td>';
                        //html += '<td><a title="Delete" data-toggle="modal" data-target="#DeleteDocumentModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDocument('+object.Id+'); return false;"><img src="../assets/trash.svg" alt="trash" /></a></td>';
                        //html += '</tr>';                      

                        $('#InvoiceTableDocument tbody').append(' <tr id="' + object.id + '"><td>' + object.documentName + '</td><td class="formatted-td-date-input">' + moment(object.createdDate).format('DD-MMM-YYYY') + '</td><td>' + object.createdName + '</td> <td><a href="' + object.filePath + '" download target="_blank"><img src="../assets/download.svg" alt="download" /></a></td><td><a title="Delete" data-toggle="modal" data-target="#DeleteDocumentModel" data-backdrop="static" data-keyboard="false" onclick="ConfirmationDocument(' + object.id + ');"><img src="../assets/trash.svg" alt="trash" /></a></td></tr>');
                    });
                }
                else {
                    $('#InvoiceTableDocument tbody').append('<tr><td colspan="5">NA</td></tr>')                    
                }
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
function formatDateTo_ddMMMyyyy(date) {
    const months = [
        "Jan", "Feb", "Mar", "Apr", "May", "Jun",
        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];

    const day = date.getDate().toString().padStart(2, '0');
    const month = months[date.getMonth()];
    const year = date.getFullYear();

    return `${day}-${month}-${year}`;
}

function BindTransactionstatus() {
    var id = 3;
    var cashStatusId = $("#CashTransactionStatusId");
    var chequeStatusId = $("#ChequeTransactionStatusId");
    var cardStatusId = $("#CardTransactionStatusId");
    var netStatusId = $("#BankTransactionStatusId");
    var _val = $("#hdnTransactionStatusId").val();
    var _payMode = $("#hdnTransactionModeId").val();
    var _rpname = "statusName";
    //BindDropdowns(transactionStatus + '/' + id, transactionStatusId, _rpname, _val);
    $.ajax({
        type: Get,
        url: BaseURL + transactionStatus + '/' + id,
        "datatype": "json",
        success: function (response) {
            var _dd = _rpname;
            cashStatusId.empty().append('<option selected="selected" value="0">' + dftSel + '</option>');
            chequeStatusId.empty().append('<option selected="selected" value="0">' + dftSel + '</option>');
            cardStatusId.empty().append('<option selected="selected" value="0">' + dftSel + '</option>');
            netStatusId.empty().append('<option selected="selected" value="0">' + dftSel + '</option>');
            for (var i = 0; i < response.length; i++) {
                cashStatusId.append($("<option></option>").val(response[i].id).html(response[i][_dd]));
                chequeStatusId.append($("<option></option>").val(response[i].id).html(response[i][_dd]));
                cardStatusId.append($("<option></option>").val(response[i].id).html(response[i][_dd]));
                netStatusId.append($("<option></option>").val(response[i].id).html(response[i][_dd]));
            }
            if (_val != 0) {
                if (_payMode == 1) {
                    cashStatusId.val(_val);
                }
                else if (_payMode == 2) {
                    chequeStatusId.val(_val);
                }
                else if (_payMode == 3) {
                    cardStatusId.val(_val);
                }
                else if (_payMode == 4) {
                    netStatusId.val(_val);
                }
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

function ConfirmationDocument(id, isAction) {
    $('#DeleteDocumentModel #Id').val(id);


}
function DeleteDocument() {
    var id = $('#DeleteDocumentModel #Id').val();
    if (id) {
        docId = id;
        ajaxServiceMethod(BaseURL + DeleteInvoiceDocument + "/" + docId, Delete, DeleteUserDocumentSuccess, DeleteUserDocumentError);
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