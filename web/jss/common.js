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
    $('.scroll-to').click(function(e) {
        e.preventDefault();

        var self = $(e.target);

        $('html, body').animate({
            scrollTop: $(self.attr('href')).offset().top - $('#toolbar').outerHeight()
        }, 1000);
    });

})(jQuery);