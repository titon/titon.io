<?php $this->wrapWith('docs');

foreach ($sections as $id => $section) { ?>

    <article class="box docs-article" id="<?= $id; ?>">
        <?= $section; ?>
    </article>

<?php } ?>