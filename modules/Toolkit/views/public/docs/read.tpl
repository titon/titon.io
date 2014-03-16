<?php
$this->wrapWith('docs');

$breadcrumb->add($chapters['title']);
$breadcrumb->add('Documentation');

$count = 0;

foreach ($sections as $id => $section) { ?>

    <article class="box docs-article" id="<?= $id; ?>">
        <?php if ($count === 0) { ?>
            <a href="https://github.com/titon/toolkit/tree/master/docs<?= $filePath; ?>" class="button float-right">
                Edit <span class="fa fa-edit"></span>
            </a>
        <?php } else { ?>
            <a href="#top" class="scroll-to back-to-top">
                Top <span class="fa fa-arrow-up"></span>
            </a>
        <?php } ?>

        <?= $section; ?>
    </article>

    <?php $count++;
} ?>