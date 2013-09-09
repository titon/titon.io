
var Manual = {

	/**
	 * Initialize events for manual pages.
	 */
	initialize: function() {
		Manual.resizeChapters();

		$$('.chapter-buttons a').addEvent('click', function(e) {
			Manual.scrollTo(e.stop().target.get('href').substr(1));
		});
	},

	/**
	 * Resize the height of the chapters to the browser window.
	 * This should hide any clutter and focus it on a single chapter.
	 */
	resizeChapters: function() {
		$$('.manual-chapter').setStyle('min-height', window.getSize().y);
	},

	/**
	 * Perform a smooth scroll to the element with ID.
	 * Change the URL using the history API so that the page doesn't jump.
	 *
	 * @param {String} id
	 */
	scrollTo: function(id) {
		history.pushState({ chapter: id }, id, '#' + id);

		new Fx.Scroll(window).toElement($(id));
	}

};

window.addEvent('load', function() {
	Manual.initialize();
});

window.addEvent('resize', function() {
	Manual.resizeChapters();
});