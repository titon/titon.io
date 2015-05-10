<div class="modal-head">
    <h3><?= $title; ?></h3>
</div>

<div class="modal-body">
    <?= $this->section('modal-content'); ?>
</div>

<div class="modal-foot clear-fix">
    <button type="button" class="button float-right" data-modal-close>Close</button>

    <?= $this->section('modal-actions'); ?>
</div>
