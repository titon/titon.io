<?php
$asset->addStylesheet('/css/vendors/prism.min', [], 100);
$asset->addScript('/js/vendors/prism.min', 'footer', 90);
$asset->addScript('/js/docs.min', 'footer', 100);

$tocItems = [];
$tocHeader = '';
$isComponents = (strpos($urlPath, '/components') === 0); ?>

<header class="head">
    <div class="wrapper">
        <ul class="docs-nav" id="nav">
            <li>
                <a href="<?= url(['route' => 'toolkit.docs', 'version' => $toolkitVersion, 'path' => ' ']); ?>">
                    <span class="fa fa-book"></span>
                    <span class="title">Docs</span>
                </a>
            </li>

            <?php foreach ($toc['children'] as $i => $nav) {
                $isActive = false;

                if (strpos($urlPath, $nav['url']) === 0) {
                    $tocItems = $nav['children'];
                    $tocHeader = $nav['title'];
                    $isActive = true;
                } ?>

                <li>
                    <a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => trim($nav['url'], '/')]); ?>"
                        <?php if ($isActive) { ?> class="is-active"<?php } ?>>
                        <span class="fa <?= $navIcons[$i]; ?>"></span>
                        <span class="title"><?= $nav['title']; ?></span>
                    </a>
                </li>

            <?php } ?>
        </ul>
    </div>
</header>

<main class="body" id="top">
    <div class="wrapper">
        <div class="grid" id="doc">
            <aside class="hide-small col medium-3 large-3 docs-sidebar" id="toc">
                <nav class="box docs-toc">
                    <header><?= $tocHeader; ?></header>

                    <ul>
                        <?php foreach ($tocItems as $toc) {
                            $isOpen = ($urlPath === $toc['url']); ?>

                            <li<?php if ($isOpen) { ?> class="is-open"<?php } ?>>
                                <a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => trim($toc['url'], '/')]); ?>">
                                    <?php if ($isComponents && !empty($components[basename($toc['url'])]['source']['js'])) { ?>
                                        <span class="label small" data-tooltip="Requires JavaScript">JS</span>
                                    <?php } ?>

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

            <section class="col medium-9 large-9 end" id="chapters">
                <?= $this->getContent(); ?>
            </section>
        </div>
    </div>
</main>

<?= $this->open('footer'); ?>