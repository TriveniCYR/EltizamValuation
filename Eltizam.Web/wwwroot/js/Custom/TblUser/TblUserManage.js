var IsDesignationVisible = false;

$(document).ready(function () {
    if (parseInt($('#Id').val()) > 0) {
        $('.readOnlyUpdate').attr("readonly", "readonly").css("pointer-events", "none");
        //GetRegionByBusinessUnit();
    }

});

$("#Name").blur(function () {
    var Nameval = $(this).val();
    $(this).val($.trim(Nameval));
})
