(function($) {
    'use strict';

    function resizeIntro() {
        var width = $(window).width(),
            height = 'auto';

        if (width > 768) {
            height = $(window).height();
        } else {
            height = $(document).height();
        }

        $('#home').css('height', height);
    }

    $(function() {
        $(document).ready(resizeIntro);
        $(window).on('resize', $.throttle(resizeIntro, 50));
    });
})(jQuery);