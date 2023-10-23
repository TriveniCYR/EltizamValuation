// delete js function for delete user popup
document.addEventListener("DOMContentLoaded", () => {
    const deleteUser = document.querySelectorAll(".delete");
    const deletePopup = document.getElementById("popup-delete-overlay");
    const cancelDeleteUser = document.getElementById("cancelDeleteUser");

    deleteUser.forEach((li) => {
        li.addEventListener("click", () => deletePopup.classList.add("display-block"));
        cancelDeleteUser.addEventListener("click", () => deletePopup.classList.remove("display-block"));
    });
});
// ends

// edit role js function for delete user popup
document.addEventListener("DOMContentLoaded", () => {
    const editRoleBtn = document.querySelectorAll(".editRole");
    const editRolePopup = document.getElementById("popup-editRole-overlay");
    const closeEditRole = document.querySelector(".closeEditRolePopup");
    
    editRoleBtn.forEach((li) => {
        li.addEventListener("click", () => editRolePopup.classList.add("display-block"));
        closeEditRole.addEventListener("click", () => editRolePopup.classList.remove("display-block"));
    });
    
});

// view role popup js function for delete user popup
document.addEventListener("DOMContentLoaded", () => {
    const viewRoleBtn = document.querySelectorAll(".viewRole");
    const viewRolePopup = document.getElementById("popup-viewRole-overlay");
    const closeViewRole = document.querySelector(".closeViewRolePopup");
    
    viewRoleBtn.forEach((li) => {
        li.addEventListener("click", () => viewRolePopup.classList.add("display-block"));
        closeViewRole.addEventListener("click", () => viewRolePopup.classList.remove("display-block"));
    });
    
});


document.addEventListener("DOMContentLoaded", () => {
    const btn = document.querySelector('.btn');
    const fileInput = document.querySelector('.file');
    const fileNameInput = document.querySelector('#file-name');

    btn.addEventListener('click', () => fileInput.click());

    fileInput.addEventListener('change', function() {
        const { files } = this;
        if (files.length > 0) {
            fileNameInput.value = files[0].name;
        }
    });
});
// ends


// import js function to upload file
document.addEventListener("DOMContentLoaded", () => {
    const importFile = document.getElementById("importFile");
    const importPopup = document.getElementById("popup-import-overlay");
    const closePopup = document.getElementById("closePopup");

    importFile.addEventListener("click", () => importPopup.classList.add("display-block"));
    closePopup.addEventListener("click", () => importPopup.classList.remove("display-block"));
});

// add role js function to upload file
document.addEventListener("DOMContentLoaded", () => {
    const addRole = document.getElementById("addRole");
    const addRolePopup = document.getElementById("popup-addRole-overlay");
    const closePopup = document.querySelector(".addRoleClose");

    addRole.addEventListener("click", () => addRolePopup.classList.add("display-block"));
    closePopup.addEventListener("click", () => addRolePopup.classList.remove("display-block"));
});

// add new resource page redirection
document.addEventListener("DOMContentLoaded", () => {
    const addResrouceBtn = document.getElementById("addNew");

    addResrouceBtn.addEventListener('click', () => {
        window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/Master_Resource/addResource.html'
    });
});

function userMaster(){
    window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/Master_User/user-master.html'
}
function roleMaster(){
    window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/Master_Role/role-master.html'
}
function resourceMaster() {
    window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/Master_Resource/resource-master.html'
}


function sideNavToggle() {
    var x = document.getElementById("sideNav");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

function locationMaster() {
    window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/Master_Location/location-master.html'
}
function propTypeMaster() {
    window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/Master_Property_Type/property-type-master.html'
}
function designation() {
    window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/Master_Designation/designation-master.html'
}
function department() {
    window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/Master_Department/department-master.html'
}
function propMaster() {
    window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/Master_Property/property-master.html'
}
function clientMaster() {
    window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/Master_Client/client-master.html'
}
function valuationFeestMaster() {
    window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/Master_Valuation_Fees/valuation-fees-master.html'
}
function vendortMaster() {
    window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/Master_Vendor/vendor-master.html'
}