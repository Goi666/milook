$( document ).ready(function() {
    var h = $("#message").outerHeight(true);
    console.log(h);

    $('#message').css({
        opacity : 1
    });
    $('.main-body').css({
        "margin-top" : h + 50
    });
});