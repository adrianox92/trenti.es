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
});