(function($) {
    'use strict';

    // Tabs
    $('.tabs').tabs();

    // Tooltips
    $('[data-tooltip]').tooltip({
        animation: 'fade'
    });

    // Modals
    $('.js-modal').modal({
        animation: 'slide-in-top'
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