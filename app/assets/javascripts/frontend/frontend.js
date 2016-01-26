$(document).on('ready page:load', function () {
    $('.owl-carousel').owlCarousel({
        items: 1,
        loop: true,
        margin: 10,
        smartSpeed: 450,
        autoplay: true,
        autoplayHoverPause: true,
        nav: true,
        navText: ["<span class='glyphicon glyphicon-chevron-left'></span>", "<span class='glyphicon glyphicon-chevron-right'></span>"],
        dots: false
    });
    $(window).scroll(function () {
        if($(this).innerWidth()> 977) {
            if ($(this).scrollTop() > 100) {
                $('.scrollup').fadeIn();
            } else {
                $('.scrollup').fadeOut();
            }
        }
    });

    $('.scrollup').click(function () {
        $("html, body").animate({
            scrollTop: 0
        }, 600);
        return false;
    });


});