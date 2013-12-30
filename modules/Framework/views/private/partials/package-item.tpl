<li>
    <a href="https://github.com/<?php echo $package['name']; ?>" target="_blank" data-tooltip="#tooltip-<?php echo $key; ?>">
        <?php echo esc($name); ?>
        <span class="label small"><?php echo $package['version']; ?></span>
   </a>

    <div id="tooltip-<?php echo $key; ?>" style="display: none">
        <?php echo esc($package['description']); ?>

        <ul class="meta-list">
            <li>
                <span class="secondary">Version:</span>
                <?php echo $package['version']; ?>
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
                    <?php echo implode(', ', $requires); ?>
                </li>
            <?php } ?>

            <?php if (!empty($extensions)) { ?>
                <li>
                    <span class="secondary">Extensions:</span>
                    <?php echo implode(', ', $extensions); ?>
                </li>
            <?php } ?>
        </ul>
    </div>
</li>