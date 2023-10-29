
//starts dynamic input button
let blockCounter = 1;

function addInputProperty() {
    const inputPropField = document.querySelector(".addPropertyInputDynamic");
    const uniqueId = `status-${blockCounter}`;

    const newBlock = document.createElement("div");
    newBlock.className = "inputFieldProp";
    newBlock.innerHTML = `
    <label for="">

        <input type="text" placeholder="enter description">
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

function SavePropertyType() {
    var Master_PropertyTypeModel = {
        'Id': '',
        'PropertyType': '',
        'IsActive': '',
        'MasterPropertySubTypes': []
    }
    // $(document).ready(function () {
    //     if ($('#IsActive')[0].value == 0) {
    //         $('#IsActive')[0].checked = 0;
    //     }
    //     else
    //     {
    //         $('#IsActive')[0].checked = 1;
    //     }

    // });


    Master_PropertyTypeModel.Id = document.getElementById('hdnPropertyId').value;
    Master_PropertyTypeModel.PropertyType = document.getElementById('PropertyType').value;
    Master_PropertyTypeModel.IsActive = $('#addLocation')[0].checked;

    var DynamicMasterPropertySubTypes = $(".addPropertyInputDynamic :input");

    var ExistingMasterPropertySubTypes = $(".propertySubTypeContainer :input[type='text']");

    for (var i = 0; i < DynamicMasterPropertySubTypes.length; i++) {
        var objDynamic = {
            'Id': 0,
            'PropertySubType': DynamicMasterPropertySubTypes[i].value,
        }
        Master_PropertyTypeModel.MasterPropertySubTypes.push(objDynamic);
    }

    for (var j = 0; j < ExistingMasterPropertySubTypes.length; j++) {
        var objExisting = {
            'Id': ExistingMasterPropertySubTypes[j].id,
            'PropertySubType': ExistingMasterPropertySubTypes[j].value,
        }
        Master_PropertyTypeModel.MasterPropertySubTypes.push(objExisting);
    }
    console.log(JSON.stringify(Master_PropertyTypeModel));

    
    //var PropertySubType = $("#PropertySubTypeId");
    var _val = $('#hdnPropertySub').val();
    var _rpname = "propertyTypeId";

    //BindDropdowns(PropertyList, Property, _rpname, _val);
    $.ajax({
        type: "POST",
        url: $('#hdnBaseURL').val() + PropertyByIdSubType,
        "datatype": "json",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        data: JSON.stringify(Master_PropertyTypeModel),
        success: function (response) {
            window.location.href = "/MasterPropertyType/PropertyTypes";
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