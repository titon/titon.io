(function($) {
    'use strict';

    var Docs = {

        /**
         * Initialize events for Docs pages.
         */
        initialize: function() {
            Docs.resizeChapters();
        },

        /**
         * Resize the height of the chapters to the browser window.
         * This should hide any clutter and focus it on a single chapter.
         */
        resizeChapters: function() {
            $('.docs-chapter').css('min-height', $(window).height());
        }

    };

    $(window).resize(Docs.resizeChapters);
    $(document).ready(Docs.initialize);
})(jQuery);