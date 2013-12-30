<li>
    <a href="https://github.com/titon/toolkit/tree/master/docs/pages/en/components" target="_blank" data-tooltip="#tooltip-<?php echo $key; ?>">
        <?php echo esc($component['name']); ?>

        <?php if (!empty($component['source']['js'])) { ?>
            <span class="label small">JS</span>
        <?php } ?>
   </a>

    <div id="tooltip-<?php echo $key; ?>" style="display: none">
        <?php echo esc($component['description']); ?>

        <ul class="meta-list">
            <?php if (!empty($component['source'])) {
                $includes = array_map('strtoupper', array_filter(array_keys($component['source']), function($value) {
                    return ($value === 'css' || $value === 'js');
                })); ?>

                <li>
                    <span class="secondary">Includes:</span>
                    <?php echo implode(', ', $includes); ?>
                </li>
            <?php } ?>

            <?php if (!empty($component['require'])) {
                $requires = array_map(function($value) use ($components) {
                    return $components[$value]['name'];
                }, $component['require']); ?>

                <li>
                    <span class="secondary">Requires:</span>
                    <?php echo implode(', ', $requires); ?>
                </li>
            <?php } ?>

            <?php if (!empty($component['source']['jquery'])) { ?>
                <li>
                    <span class="secondary">jQuery Dependencies:</span>
                    <?php echo implode(', ', $component['source']['jquery']); ?>
                </li>
            <?php } ?>

            <?php if (!empty($component['source']['moo'])) { ?>
                <li>
                    <span class="secondary">MooTools Dependencies:</span>
                    <?php echo implode(', ', $component['source']['moo']); ?>
                </li>
            <?php } ?>
        </ul>
    </div>
</li>