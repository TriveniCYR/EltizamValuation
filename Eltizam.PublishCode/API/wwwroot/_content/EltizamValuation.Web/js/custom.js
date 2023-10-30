// delete js function for delete user popup
document.addEventListener("DOMContentLoaded", () => {
    const deleteUser = document.querySelectorAll(".delete");
    const edit = document.querySelectorAll(".edit");
    const deletePopup = document.getElementById("popup-delete-overlay");
    const cancelDeleteUser = document.getElementById("cancelDeleteUser");

    deleteUser.forEach((li) => {
        li.addEventListener("click", () => deletePopup.classList.add("display-block"));
        cancelDeleteUser.addEventListener("click", () => deletePopup.classList.remove("display-block"));
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

// add new resource page redirection
document.addEventListener("DOMContentLoaded", () => {
    const addResrouceBtn = document.getElementById("addNew");

    addResrouceBtn.addEventListener('click', () => {
       /* window.location.href = 'file:///C:/Users/User/OneDrive/Desktop/workspace/Eltizam/addResource.html'*/
        window.location.href = 'C:\Eltizam\EltizamValuation\Eltizam.Web\Views\Resource'
    });
});
