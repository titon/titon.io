
<div class="demo-center">
    <a href="ajax/tooltip.php" class="button js-tooltip" data-tooltip="This content is read from the data-tooltip attribute.">Show Tooltip</a>
    <a href="ajax/tooltip.php?slow" class="button js-tooltip" title="Tooltip Title" data-tooltip="#hidden">Show Tooltip w/ Title</a>

    <div id="hidden" style="display: none">This content is loaded from a hidden DOM element.</div>
</div>

<script>
    <?php if ($vendor === 'mootools') { ?>
        window.addEvent('domready', function() {
            $$('.js-tooltip').tooltip({
                animation: <?= $demo->string('animation'); ?>,
                mode: <?= $demo->string('mode', 'hover'); ?>,
                ajax: <?= $demo->bool('ajax', false); ?>,
                follow: <?= $demo->bool('follow', false); ?>,
                getContent: '<?php echo $demo->value('ajax') ? 'href' : 'data-tooltip'; ?>',
                position: <?= $demo->string('position', 'topRight'); ?>,
                showLoading: <?= $demo->bool('showLoading', true); ?>,
                showTitle: <?= $demo->bool('showTitle', true); ?>,
                mouseThrottle: <?= $demo->number('mouseThrottle', 50); ?>,
                xOffset: <?= $demo->number('xOffset', 0); ?>,
                yOffset: <?= $demo->number('yOffset', 0); ?>,
                delay: <?= $demo->number('delay', 0); ?>
            });
        });
    <?php } else { ?>
        $(function() {
            $('.js-tooltip').tooltip({
                animation: <?= $demo->string('animation'); ?>,
                mode: <?= $demo->string('mode', 'hover'); ?>,
                ajax: <?= $demo->bool('ajax', false); ?>,
                follow: <?= $demo->bool('follow', false); ?>,
                getContent: '<?php echo $demo->value('ajax') ? 'href' : 'data-tooltip'; ?>',
                position: <?= $demo->string('position', 'topRight'); ?>,
                showLoading: <?= $demo->bool('showLoading', true); ?>,
                showTitle: <?= $demo->bool('showTitle', true); ?>,
                mouseThrottle: <?= $demo->number('mouseThrottle', 50); ?>,
                xOffset: <?= $demo->number('xOffset', 0); ?>,
                yOffset: <?= $demo->number('yOffset', 0); ?>,
                delay: <?= $demo->number('delay', 0); ?>
            });
        });
    <?php } ?>
</script>