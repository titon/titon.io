
<div class="demo-pin <?php echo $demo->value('location', 'right'); ?>">
    <div class="pin" id="pin" style="<?php if ($height = $demo->value('height')) echo 'height: ' . $height . 'px;'; if ($top = $demo->value('top')) echo 'top: ' . $top . 'px;'; ?>">
        This div should stay positioned at the top right of the page, regardless of window scroll.<br><br>
        It will also stay contained within the parent.
    </div>

    <?php for ($i = 0; $i <= 10; $i++) { ?>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor gravida diam. Donec eget magna nunc. Suspendisse ipsum lacus, pellentesque sit amet lacinia quis, convallis sed ligula. Nullam lobortis sapien et dolor gravida ac convallis erat fermentum. Mauris nec justo lacus. Sed varius varius ligula, sit amet egestas mi blandit dictum. Phasellus sapien tortor, bibendum vitae vehicula a, molestie in odio. Fusce porttitor quam nec libero condimentum eget imperdiet nibh elementum.</p>
    <?php } ?>
</div>

<script>
    <?php if ($vendor === 'mootools') { ?>
        window.addEvent('domready', function() {
            $('pin').pin({
                animation: <?= $demo->string('animation'); ?>,
                location: <?= $demo->string('location', 'right'); ?>,
                xOffset: <?= $demo->number('xOffset', 0); ?>,
                yOffset: <?= $demo->number('yOffset', 0); ?>,
                throttle: <?= $demo->number('throttle', 50); ?>,
                fixed: <?= $demo->bool('fixed', false); ?>
            });
        });
    <?php } else { ?>
        $(function() {
            $('#pin').pin({
                animation: <?= $demo->string('animation'); ?>,
                location: <?= $demo->string('location', 'right'); ?>,
                xOffset: <?= $demo->number('xOffset', 0); ?>,
                yOffset: <?= $demo->number('yOffset', 0); ?>,
                throttle: <?= $demo->number('throttle', 50); ?>,
                fixed: <?= $demo->bool('fixed', false); ?>
            });
        });
    <?php } ?>
</script>