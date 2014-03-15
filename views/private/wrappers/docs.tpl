<?php $asset->addScript('/js/docs.min', 'footer', 100); ?>

<div class="documentation">
    <header class="head">
        <div class="wrapper">
            <ul class="docs-nav" id="nav">
                <?php
                $navIcons = ['fa-power-off', 'fa-code', 'fa-puzzle-piece', 'fa-shield'];
                $tocItems = [];

                foreach ($toc['children'] as $i => $nav) {
                    $isActive = false;

                    if (strpos($url, $nav['url']) === 0) {
                        $tocItems = $nav['children'];
                        $isActive = true;
                    } ?>

                    <li>
                        <a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => trim($nav['url'], '/')]); ?>"
                            <?php if ($isActive) { ?> class="is-active"<?php } ?>>
                            <span class="fa <?= $navIcons[$i]; ?>"></span>
                            <?= $nav['title']; ?>
                        </a>
                    </li>

                <?php } ?>
            </ul>
        </div>
    </header>

    <main class="body">
        <div class="wrapper">
            <div class="grid" id="doc">
                <aside class="hide-small col medium-2 large-3 docs-sidebar" id="toc">
                    <nav class="box docs-toc">
                        <ul>
                            <?php foreach ($tocItems as $toc) {
                                $isOpen = ($url === $toc['url']); ?>

                                <li<?php if ($isOpen) { ?> class="is-open"<?php } ?>>
                                    <a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => trim($toc['url'], '/')]); ?>">
                                        <?= $toc['title']; ?>
                                    </a>

                                    <?php if ($isOpen) {
                                        echo $this->open('docs/chapter-nav', ['chapters' => $chapters['children']]);
                                    } ?>
                                </li>

                            <?php } ?>
                        </ul>
                    </nav>
                </aside>

                <section class="col medium-7 large-9 end" id="chapters">
                    <?= $this->getContent(); ?>
                </section>
            </div>
        </div>
    </main>

    <?= $this->open('footer'); ?>
</div>