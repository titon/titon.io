<?php
$this->wrapWith('docs');

$breadcrumb->add($chapters['title']);
$breadcrumb->add('Documentation');

$count = 0;

foreach ($sections as $id => $section) { ?>

    <article class="box docs-article" id="<?= $id; ?>">
        <?php if ($count === 0) { ?>
            <div class="float-right">
                <?php if (!empty($component)) { ?>
                    <div class="button-group round small">
                        <?php if (!empty($component['source']['css'][0])) { ?>
                            <a href="https://github.com/titon/toolkit/tree/master/scss/toolkit/<?= str_replace('css', 'scss', $component['source']['css'][0]); ?>" class="button">SCSS</a>
                        <?php }

                        if (!empty($component['source']['js'][0])) {?>
                            <a href="https://github.com/titon/toolkit/tree/master/js/jquery/<?= $component['source']['js'][0]; ?>" class="button">JS</a>
                        <?php } ?>
                    </div>
                <?php } ?>

                <div class="button-group round small">
                    <a href="https://github.com/titon/toolkit/tree/master/docs<?= $filePath; ?>" class="button is-success">Edit</a>

                    <?php if ($component['key'] !== 'blackout') { ?>
                        <a href="http://demo.titon.io/?component=<?= $component['key']; ?>" class="button is-error">Demo</a>
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