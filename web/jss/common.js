(function($) {
    'use strict';

    // Tabs
    $('.tabs').tab();

    // Tooltips
    $('[data-tooltip]').tooltip({
        animation: 'fade'
    });

    // Modals
    $('.js-modal').modal({
        animation: 'slide-in-top',
        stopScroll: false
    });

    // Smooth scrolling
    $(document).on('click', '.scroll-to', function(e) {
        e.preventDefault();

        var hash = $(e.target).attr('href');

        $('html, body').animate({
            scrollTop: $(hash).offset().top
        }, 1000);

        history.pushState(null, null, hash);
    });

})(jQuery);