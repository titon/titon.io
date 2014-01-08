
<div class="demo-center">
    <button type="button" class="button js-modal" data-modal="ajax/modal.php?slow">Open Modal</button>
    <button type="button" class="button js-modal" data-modal="ajax/modal-form.php">Open Modal w/ Form</button>
    <button type="button" class="button js-modal" data-modal="#hidden">Open Modal w/ DOM</button>

    <div id="hidden" style="display: none">
        <div class="modal-head"><h4>DOM Loaded</h4></div>
        <div class="modal-body">This content is loaded from a hidden DOM element. This approach requires the markup to be in the page.</div>
        <div class="modal-foot">
            <button type="button" class="button modal-event-close">Close</button>
        </div>
    </div>
</div>

<script>
    <?php if ($vendor  === 'mootools') { ?>
        window.addEvent('domready', function() {
            $$('.js-modal').modal({
                animation: <?= $demo->string('animation', 'fade'); ?>,
                className: <?= $demo->string('className'); ?>,
                ajax: <?= $demo->bool('ajax', true); ?>,
                draggable: <?= $demo->bool('draggable', false); ?>,
                blackout: <?= $demo->bool('blackout', true); ?>,
                showLoading: <?= $demo->bool('showLoading', true); ?>,
                fullScreen: <?= $demo->bool('fullScreen', false); ?>
            });
        });
    <?php } else { ?>
        $(function() {
            $('.js-modal').modal({
                animation: <?= $demo->string('animation', 'fade'); ?>,
                className: <?= $demo->string('className'); ?>,
                ajax: <?= $demo->bool('ajax', true); ?>,
                draggable: <?= $demo->bool('draggable', false); ?>,
                blackout: <?= $demo->bool('blackout', true); ?>,
                showLoading: <?= $demo->bool('showLoading', true); ?>,
                fullScreen: <?= $demo->bool('fullScreen', false); ?>
            });
        });
    <?php } ?>
</script>