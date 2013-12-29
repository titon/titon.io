(function($) {
    'use strict';

    // Components
    $('.tabs').tabs();

    $('[data-tooltip]').tooltip({
        animation: 'fade'
    });

    $('.scroll-to').click(function(e) {
        e.preventDefault();

        var self = $(e.target);

        $('html, body').animate({
            scrollTop: $(self.attr('href')).offset().top - $('#toolbar').outerHeight()
        }, 1000);
    });

})(jQuery);