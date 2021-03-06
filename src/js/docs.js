(function($) {
    'use strict';

    $('#toc').pin({
        throttle: 0,
        context: '#doc',
        location: 'left',
        lock: true,
        onResize: function() {
            if (this.viewport.width > 640) {
                this.calculate();
            } else {
                this.destructor();
            }
        }
    });

    $('body').stalker({
        target: '#toc a[href^="#"]',
        marker: '#chapters [id]',
        applyToParent: false,
        onlyWithin: false
    });

    // Fix URLs within the chapters
    $('#chapters, #toc').find('a').each(function() {
        var self = $(this),
            href = self.attr('href');

        // Make it scrollable
        if (href.substr(0, 1) === '#') {
            self.addClass('scroll-to');

        // Open a new window
        } else if (href.substr(0, 4) === 'http') {
            self.attr('target', '_blank');
        }
    });
})(jQuery);
