<?php $this->wrapWith('docs');

foreach ($chapters as $id => $chapter) { ?>

    <article class="box docs-article" id="<?= $id; ?>">
        <?= $chapter; ?>
    </article>

<?php } ?>