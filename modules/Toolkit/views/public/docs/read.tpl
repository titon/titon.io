<?php
$this->wrapWith('docs');

$breadcrumb->add($chapters['title']);
$breadcrumb->add('Documentation');

foreach ($sections as $id => $section) { ?>

    <article class="box docs-article" id="<?= $id; ?>">
        <?= $section; ?>
    </article>

<?php } ?>