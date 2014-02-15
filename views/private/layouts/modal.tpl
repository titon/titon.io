<div class="modal-head">
    <h3><?= $html->title(); ?></h3>
</div>

<div class="modal-body">
    <?= $this->getContent(); ?>
</div>

<div class="modal-foot clear-fix">
    <button type="button" class="button float-right modal-event-close">Close</button>

    <?= $block->get('modal-actions'); ?>
</div>