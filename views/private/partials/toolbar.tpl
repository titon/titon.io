<div class="toolbar" id="toolbar">
    <div class="wrapper">
        <nav class="nav">
            <ul>
                <li>
                    <?= $html->anchor('Toolkit', 'toolkit'); ?>

                    <ul class="dropdown push-over" id="toolkit-menu">
                        <li><a href="https://github.com/titon/toolkit">GitHub</a></li>
                        <li><?= $html->anchor('Documentation', 'toolkit.docs.out', ['class' => 'js-modal']); ?></li>
                        <li><a href="https://github.com/titon/toolkit/releases">Download</a></li>
                        <li><a href="https://github.com/titon/toolkit/blob/master/docs/pages/en/setup/getting-started.md">Install</a></li>
                    </ul>
                </li>
                <li>
                    <?= $html->anchor('Framework', 'framework'); ?>

                    <ul class="dropdown push-over" id="framework-menu">
                        <li><a href="https://github.com/titon">GitHub</a></li>
                        <li><?= $html->anchor('Documentation', 'framework.docs.out', ['class' => 'js-modal']); ?></li>
                        <li><a href="https://packagist.org/packages/titon/" target="_blank">Browse Packages</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <a href="/" class="logo">Titon</a>
    </div>
</div>