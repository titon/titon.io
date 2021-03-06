<li>
    <?php
    if ($key === 'normalize') {
        $path = 'development/css/philosophies#normalize-integration';
    } else if ($key === 'base') {
        $path = 'development/css/base';
    } else {
        $path = 'components/' . $key;
    } ?>

    <a href="<?= $this->url('toolkit.docs', ['version' => $toolkitVersion, 'path' => $path]); ?>" data-tooltip="#tooltip-<?= $key; ?>">
        <?= $this->e($plugin['name']); ?>

        <?php if (!empty($plugin['source']['js'])) { ?>
            <span class="label small">JS</span>
        <?php } ?>
    </a>

    <div id="tooltip-<?= $key; ?>" style="display: none">
        <?= $this->e($plugin['description']); ?>

        <ul class="meta-list">
            <?php if (!empty($plugin['source'])) {
                $includes = array_map('strtoupper', array_filter(array_keys($plugin['source']), function($value) {
                    return ($value === 'css' || $value === 'js');
                })); ?>

                <li>
                    <span class="secondary">Includes:</span>
                    <?= implode(', ', $includes); ?>
                </li>
            <?php } ?>

            <?php if (!empty($plugin['require'])) {
                $requires = array_map(function($value) use ($plugins) {
                    return $plugins[$value]['name'];
                }, $plugin['require']); ?>

                <li>
                    <span class="secondary">Requires:</span>
                    <?= implode(', ', $requires); ?>
                </li>
            <?php } ?>
        </ul>
    </div>
</li>
