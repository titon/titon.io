
<div class="demo-center">
    <a href="ajax/popover.php" class="button js-popover" data-popover="This content is read from the data-popover attribute.">Show Popover</a>
    <a href="ajax/popover.php?slow" class="button js-popover" title="Popover Title" data-popover="#hidden">Show Popover w/ Title</a>

    <div id="hidden" style="display: none">This content is loaded from a hidden DOM element.</div>
</div>

<script>
    <?php if ($vendor === 'mootools') { ?>
        window.addEvent('domready', function() {
            $$('.js-popover').popover({
                animation: <?= $demo->string('animation'); ?>,
                ajax: <?= $demo->bool('ajax', false); ?>,
                getContent: '<?php echo $demo->value('ajax') ? 'href' : 'data-popover'; ?>',
                position: <?= $demo->string('position', 'topRight'); ?>,
                showLoading: <?= $demo->bool('showLoading', true); ?>,
                showTitle: <?= $demo->bool('showTitle', true); ?>,
                xOffset: <?= $demo->number('xOffset', 0); ?>,
                yOffset: <?= $demo->number('yOffset', 0); ?>,
                delay: <?= $demo->number('delay', 0); ?>
            });
        });
    <?php } else { ?>
        $(function() {
            $('.js-popover').popover({
                animation: <?= $demo->string('animation'); ?>,
                ajax: <?= $demo->bool('ajax', false); ?>,
                getContent: '<?php echo $demo->value('ajax') ? 'href' : 'data-popover'; ?>',
                position: <?= $demo->string('position', 'topRight'); ?>,
                showLoading: <?= $demo->bool('showLoading', true); ?>,
                showTitle: <?= $demo->bool('showTitle', true); ?>,
                xOffset: <?= $demo->number('xOffset', 0); ?>,
                yOffset: <?= $demo->number('yOffset', 0); ?>,
                delay: <?= $demo->number('delay', 0); ?>
            });
        });
    <?php } ?>
</script>