<ul class="accordion" id="accordion">
    <li>
        <header class="accordion-head">
            <h6>Single Paragraph</h6>
        </header>
        <section class="accordion-handle">
            <div class="accordion-body">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor gravida diam. Donec eget magna nunc. Suspendisse ipsum lacus, pellentesque sit amet lacinia quis, convallis sed ligula. Nullam lobortis sapien et dolor gravida ac convallis erat fermentum. Mauris nec justo lacus. Sed varius varius ligula, sit amet egestas mi blandit dictum. Phasellus sapien tortor, bibendum vitae vehicula a, molestie in odio. Fusce porttitor quam nec libero condimentum eget imperdiet nibh elementum.</p>
            </div>
        </section>
    </li>
    <li>
        <header class="accordion-head">
            <h6>Multiple Paragraphs</h6>
        </header>
        <section class="accordion-handle">
            <div class="accordion-body">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor gravida diam. Donec eget magna nunc. Suspendisse ipsum lacus, pellentesque sit amet lacinia quis, convallis sed ligula. Nullam lobortis sapien et dolor gravida ac convallis erat fermentum. Mauris nec justo lacus. Sed varius varius ligula, sit amet egestas mi blandit dictum. Phasellus sapien tortor, bibendum vitae vehicula a, molestie in odio. Fusce porttitor quam nec libero condimentum eget imperdiet nibh elementum.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor gravida diam. Donec eget magna nunc. Suspendisse ipsum lacus, pellentesque sit amet lacinia quis, convallis sed ligula. Nullam lobortis sapien et dolor gravida ac convallis erat fermentum. Mauris nec justo lacus. Sed varius varius ligula, sit amet egestas mi blandit dictum. Phasellus sapien tortor, bibendum vitae vehicula a, molestie in odio. Fusce porttitor quam nec libero condimentum eget imperdiet nibh elementum.</p>
            </div>
        </section>
    </li>
    <li>
        <header class="accordion-head">
            <h6>Paragraph and Lists</h6>
        </header>
        <section class="accordion-handle">
            <div class="accordion-body">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor gravida diam. Donec eget magna nunc. Suspendisse ipsum lacus, pellentesque sit amet lacinia quis, convallis sed ligula. Nullam lobortis sapien et dolor gravida ac convallis erat fermentum. Mauris nec justo lacus. Sed varius varius ligula, sit amet egestas mi blandit dictum. Phasellus sapien tortor, bibendum vitae vehicula a, molestie in odio. Fusce porttitor quam nec libero condimentum eget imperdiet nibh elementum.</p>
                <ul>
                    <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                    <li>Nullam auctor gravida diam. Donec eget magna nunc.</li>
                    <li>Suspendisse ipsum lacus, pellentesque sit amet lacinia quis, convallis sed ligula.</li>
                    <li>Nullam lobortis sapien et dolor gravida ac convallis erat fermentum.</li>
                    <li>Mauris nec justo lacus. Sed varius varius ligula, sit amet egestas mi blandit dictum.</li>
                    <li>Phasellus sapien tortor, bibendum vitae vehicula a, molestie in odio.</li>
                    <li>Fusce porttitor quam nec libero condimentum eget imperdiet nibh elementum.</li>
                </ul>
            </div>
        </section>
    </li>
</ul>

<script>
    <?php if ($vendor === 'mootools') { ?>
        window.addEvent('domready', function() {
            $('accordion').accordion({
                mode: <?= $demo->string('mode', 'click'); ?>,
                defaultIndex: <?= $demo->number('defaultIndex'); ?>,
                multiple: <?= $demo->bool('multiple', false); ?>,
                collapsible: <?= $demo->bool('collapsible', false); ?>
            });
        });
    <?php } else { ?>
        $(function() {
            $('#accordion').accordion({
                mode: <?= $demo->string('mode', 'click'); ?>,
                defaultIndex: <?= $demo->number('defaultIndex'); ?>,
                multiple: <?= $demo->bool('multiple', false); ?>,
                collapsible: <?= $demo->bool('collapsible', false); ?>
            });
        });
    <?php } ?>
</script>