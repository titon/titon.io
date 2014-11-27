<?php
$this->wrapWith('docs');

$breadcrumb->add($title);
$breadcrumb->add('Documentation');

$count = 0;

foreach ($sections as $id => $section) { ?>

    <article class="box docs-article" id="<?= $id; ?>">
        <?php if ($count === 0) { ?>
            <div class="docs-actions">
                <?php if (!empty($component)) { ?>
                    <div class="button-group round small">
                        <?php if (!empty($component['source']['css'][0])) { ?>
                            <a href="https://github.com/titon/toolkit/tree/master/scss/toolkit/<?= $component['source']['css'][0]; ?>" class="button">SCSS</a>
                        <?php }

                        if (!empty($component['source']['js'][0])) {?>
                            <a href="https://github.com/titon/toolkit/tree/master/js/<?= $component['source']['js'][0]; ?>" class="button">JS</a>
                        <?php } ?>
                    </div>
                <?php } ?>

                <div class="button-group round small">
                    <a href="https://github.com/titon/toolkit/tree/master/docs<?= $filePath; ?>" class="button is-success">Edit</a>

                    <?php if (!empty($component) && $component['key'] !== 'blackout') { ?>
                        <a href="http://demo.titon.io/?<?= $component['key']; ?>" class="button is-error">Demo</a>
                    <?php } ?>
                </div>
            </div>

        <?php } else { ?>
            <a href="#top" class="scroll-to back-to-top">
                Top <span class="fa fa-arrow-up"></span>
            </a>
        <?php } ?>

        <?= $section; ?>

        <?php // Display requirements for components
        if ($count === 0 && !empty($component)) {
            $requires = [];

            if (!empty($component['require'])) {
                foreach ($component['require'] as $requireKey) {
                    $requires[] = sprintf('<a href="%s">%s</a>', $requireKey, $components[$requireKey]['name']);
                }
            } ?>

            <ul class="docs-meta">
                <?php if ($requires) { ?>
                    <li><b>Requires:</b> <?= implode(', ', $requires); ?></li>
                <?php }

                if (!empty($component['version'])) { ?>
                    <li><b>Added In:</b> <?= $component['version']; ?></li>
                <?php } ?>
            </ul>
        <?php } ?>
    </article>

    <?php $count++;
} ?>