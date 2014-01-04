<li>
    <a href="https://github.com/<?= $package['name']; ?>" target="_blank" data-tooltip="#tooltip-<?= $key; ?>">
        <?= esc($name); ?>
        <span class="label small"><?= $package['version']; ?></span>
   </a>

    <div id="tooltip-<?= $key; ?>" style="display: none">
        <?= esc($package['description']); ?>

        <ul class="meta-list">
            <li>
                <span class="secondary">Version:</span>
                <?= $package['version']; ?>
            </li>

            <?php
            $requires = [];
            $extensions = [];

            if (!empty($package['require'])) {
                foreach ($package['require'] as $k => $v) {
                    if ($k === 'php') {
                        $k = 'PHP';
                    } else if (substr($k, 0, 3) === 'ext') {
                        $extensions[] = str_replace('ext-', '', $k);
                        continue;
                    }

                    if ($v !== '*') {
                        $k .= ' ' . $v;
                    }

                    $requires[] = $k;
                }?>

                <li>
                    <span class="secondary">Requires:</span>
                    <?= implode(', ', $requires); ?>
                </li>
            <?php } ?>

            <?php if (!empty($extensions)) { ?>
                <li>
                    <span class="secondary">Extensions:</span>
                    <?= implode(', ', $extensions); ?>
                </li>
            <?php } ?>
        </ul>
    </div>
</li>