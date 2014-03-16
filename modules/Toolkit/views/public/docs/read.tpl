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

        <?php // Display requirements for components
        if ($count === 0 && !empty($component) && !empty($component['require'])) {
            $requires = [];

            foreach ($component['require'] as $requireKey) {
                $require = $components[$requireKey];

                // Hide MooTools classes
                if (isset($require['type']) && $require['type'] === 'class') {
                    continue;
                }

                $requires[] = sprintf('<a href="%s">%s</a>', $requireKey, $require['name']);
            } ?>

            <p><b>Requires:</b> <?= implode(', ', $requires); ?></p>
        <?php } ?>
    </article>

    <?php $count++;
} ?>