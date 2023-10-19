// delete js function for delete user popup
document.addEventListener("DOMContentLoaded", () => {
    const deleteUser = document.querySelectorAll(".delete");
    const deletePopup = document.getElementById("popup-delete-overlay");
    const cancelDeletLocation = document.getElementById("cancelDeletLocation");

    deleteUser.forEach((li) => {
        li.addEventListener("click", () => deletePopup.classList.add("display-block"));
        cancelDeletLocation.addEventListener("click", () => deletePopup.classList.remove("display-block"));
    });
});
// ends


document.getElementById('resetLocation').addEventListener('click', function(){
    document.getElementById('locationForm').reset();
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
function valuationFeestView() {
    window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/Master_Valuation_Fees/valuation-fees-view.html'
}
function vendortMaster() {
    window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/Master_Vendor/vendor-master.html'
}