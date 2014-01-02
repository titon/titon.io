<div class="modal-head">
    <h3><?php echo $pageTitle; ?></h3>
</div>

<div class="modal-body">
    <?php echo $this->getContent(); ?>
</div>

<div class="modal-foot clear-fix">
    <button type="button" class="button float-right modal-event-close">Close</button>

    <?php if (!empty($modalActions)) {
        foreach ($modalActions as $title => $url) {
            echo $html->anchor($title, $url, ['class' => 'button is-success']);
        }
    } ?>
</div>