
//starts dynamic input button
let blockCounter = 1;

function addInputDictionary() {
    const inputPropField = document.querySelector(".addPropertyInputDynamic");
    const uniqueId = `status-${blockCounter}`;

    const newBlock = document.createElement("div");
    newBlock.className = "inputFieldProp";
    newBlock.innerHTML = `
    <label for="">

        <input type="text" placeholder="Dictionary Value">
    </label>
    <img src="../assets/minus-icon.svg" alt="minus-icon" class="minus-icon cursor-pointer" onclick="removeAddPropInput(this)">
        `;

    inputPropField.appendChild(newBlock);
    blockCounter++;
}

function removeAddPropInput(element) {
    const newAddedDiv = element.parentElement;
    newAddedDiv.remove();
}

function SaveMasterDictionary() {  
    var MasterDictionaryEntity = {
        'Id': '',
        'Description': '',
        'IsActive': '',
        'MasterDicitonaryDetails': []
    }
    MasterDictionaryEntity.Id = document.getElementById('hdnPropertyId').value; debugger;
    MasterDictionaryEntity.Description = document.getElementById('Description').value;
    MasterDictionaryEntity.IsActive = $('#addLocation')[0].checked;

    var DynamicMasterPropertySubTypes = $(".addPropertyInputDynamic :input");  
    var ExistingMasterPropertySubTypes = $(".propertySubTypeContainer :input[type='text']");
    for (var i = 0; i < DynamicMasterPropertySubTypes.length; i++) {     
        var objDynamic = {
            'Id': 0,
            'Description': DynamicMasterPropertySubTypes[i].value,
        }
        MasterDictionaryEntity.MasterDicitonaryDetails.push(objDynamic);        
    }

    for (var j = 0; j < ExistingMasterPropertySubTypes.length; j++) {       
        var objExisting = {
            'Id': ExistingMasterPropertySubTypes[j].id,
            'Description': ExistingMasterPropertySubTypes[j].value,
        }
        MasterDictionaryEntity.MasterDicitonaryDetails.push(objExisting);       
    }
    console.log(JSON.stringify(MasterDictionaryEntity));  
    $.ajax({
        type: "POST",
        url: $('#hdnBaseURL').val() + MasterDictionaryUpsert,
        "datatype": "json",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        data: JSON.stringify(MasterDictionaryEntity),
        success: function (response) {
            window.location.href = "/MasterDictionary/Dictionary";
        },
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert('error occured!');
            alert(response.responseText);
            $("#loader").hide();
        }
    });
    //document.getElementById('hdnPropertyId').value = ''; // Clear Id
    //document.getElementById('Description').value = ''; // Clear Description
    //$('#addLocation').prop('checked', false); // Uncheck IsActive

    //// Clear dynamic and existing input fields as needed
    //$(".addPropertyInputDynamic").empty();
    //$(".propertySubTypeContainer").empty();
   
}