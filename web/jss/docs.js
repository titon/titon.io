(function($) {
    'use strict';

    $('#toc').pin({
        throttle: 1,
        context: '#doc',
        location: 'left'
    });

    $('body').stalker({
        target: '#toc a',
        marker: '#chapters [id]',
        applyToParent: false,
        onlyWithin: false
    });
})(jQuery);