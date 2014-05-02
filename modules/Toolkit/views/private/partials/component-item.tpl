<li>
    <?php
    if ($component['category'] === 'effect') {
        $path = 'components/effects';
    } else if (isset($component['type']) && $component['type'] === 'class') {
        $path = 'development/js';
    } else if ($key === 'normalize') {
        $path = 'development/css/philosophies#normalize-integration';
    } else {
        $path = 'components/' . $key;
    } ?>

    <a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => $path]); ?>" data-tooltip="#tooltip-<?= $key; ?>">
        <?= esc($component['name']); ?>

        <?php if (!empty($component['source']['js'])) { ?>
            <span class="label small">JS</span>
        <?php } ?>
    </a>

    <div id="tooltip-<?= $key; ?>" style="display: none">
        <?= esc($component['description']); ?>

        <ul class="meta-list">
            <?php if (!empty($component['source'])) {
                $includes = array_map('strtoupper', array_filter(array_keys($component['source']), function($value) {
                    return ($value === 'css' || $value === 'js');
                })); ?>

                <li>
                    <span class="secondary">Includes:</span>
                    <?= implode(', ', $includes); ?>
                </li>
            <?php } ?>

            <?php if (!empty($component['require'])) {
                $requires = array_map(function($value) use ($components) {
                    return $components[$value]['name'];
                }, $component['require']); ?>

                <li>
                    <span class="secondary">Requires:</span>
                    <?= implode(', ', $requires); ?>
                </li>
            <?php } ?>

            <?php if (!empty($component['source']['jquery'])) { ?>
                <li>
                    <span class="secondary">jQuery Dependencies:</span>
                    <?= implode(', ', $component['source']['jquery']); ?>
                </li>
            <?php } ?>

            <?php if (!empty($component['source']['moo'])) { ?>
                <li>
                    <span class="secondary">MooTools Dependencies:</span>
                    <?= implode(', ', $component['source']['moo']); ?>
                </li>
            <?php } ?>
        </ul>
    </div>
</li>