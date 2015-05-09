<li>
    <?
    if ($key === 'normalize') {
        $path = 'development/css/philosophies#normalize-integration';
    } else {
        $path = 'components/' . $key;
    } ?>

    <a href="<?= $this->url('toolkit.docs', ['version' => $toolkitVersion, 'path' => $path]); ?>" data-tooltip="#tooltip-<?= $key; ?>">
        <?= $this->e($component['name']); ?>

        <? if (!empty($component['source']['js'])) { ?>
            <span class="label small">JS</span>
        <? } ?>
    </a>

    <div id="tooltip-<?= $key; ?>" style="display: none">
        <?= $this->e($component['description']); ?>

        <ul class="meta-list">
            <? if (!empty($component['source'])) {
                $includes = array_map('strtoupper', array_filter(array_keys($component['source']), function($value) {
                    return ($value === 'css' || $value === 'js');
                })); ?>

                <li>
                    <span class="secondary">Includes:</span>
                    <?= implode(', ', $includes); ?>
                </li>
            <? } ?>

            <? if (!empty($component['require'])) {
                $requires = array_map(function($value) use ($components) {
                    return $components[$value]['name'];
                }, $component['require']); ?>

                <li>
                    <span class="secondary">Requires:</span>
                    <?= implode(', ', $requires); ?>
                </li>
            <? } ?>
        </ul>
    </div>
</li>
