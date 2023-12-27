var pageNum = 1;
$(document).ready(function () {
    Getnotifications(pageNum);
});  

function Getnotifications(_pageNum) { 
    var userId = LogInUserId;
    var valId = $("#valId").val();

    var url = "?userId=" + userId + "&valId=" + valId + "&pagenum=" + _pageNum; 
    ajaxServiceMethod(BaseURL + notifications + url, 'GET', GetnotificationsSuccess, GetnotificationsError);
}

function GetnotificationsSuccess(data) { 
    $("#loader").show();
    var container = document.getElementById('notificationsContainer');
    //container.innerHTML = '';

    if (data.length === 0) {
        container.innerHTML = '<p>No notifications available.</p>';
    }
    else {
        data.forEach(function (notification, index) {
            var accordionHtml = `
                <div class="auditLog-acc roundBorderBox m-0 mb-28">
                    <div class="flex justify-between accordianDetails position-relative" onclick="accordianToggle(this,${notification.id})">
                        <div class="flex notificationInside">
                            <img src="../assets/bell.svg" alt="bell" class="cursor-pointer">
                            <p>${notification.valRefNo} / </p>
                            <p>&nbsp; ${notification.subject}</p>
                        </div>
                        <p class="mr-12 formatted-td-date-input">${notification.sentDatetime}</p>
                        <img src="../assets/right-arrow.svg" alt="right-arrow" class="right-arrow-menu">
                    </div>
                    <div class="panel mt-28" style="display: none;">
                        <p>To: ${notification.toEmails}</p>
                        <p>${notification.body}</p>
                    </div>
                </div>`;

            container.innerHTML += accordionHtml;

            //if (index === data.length - 1) {
            //    var viewMoreHtml = `
            //        <div class="flex justify-end mb-28">
            //            <a onclick="showMoreToggle()" style="padding-right: 20px;color: #25408f;font-weight: bold;cursor:pointer;">View More</a>
            //        </div>`;

            //    container.innerHTML += viewMoreHtml;
            //}
        });
    }

    //console.log(container);
    formatreadonlydate();
    $("#loader").hide();
}
 

// accordian function here
function accordianToggle(header, notificationId) {
    const item = header.nextElementSibling;

    if (item.style.display === 'block') {
        item.style.display = 'none';
    } else {
        item.style.display = 'block';
        markNotificationAsRead(notificationId, userid);
    }
}

function markNotificationAsRead(notificationId, userId) {
    const url = `${BaseURL}${updatenotification}?notificationid=${notificationId}&ReadBy=${userId}`;

    fetch(url, {
        method: 'POST',
    })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            console.log('Success:', data);
            //Getactivenotifications(); 
        })
        .catch(error => {
            console.error('Error:', error);
            // Handle error if needed
        });
}

function showMoreToggle() {
    pageNum = pageNum + 1;
    Getnotifications(pageNum);
}