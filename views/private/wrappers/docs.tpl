<?php
$asset->addStylesheet('/css/vendors/prism.min', [], 100);
$asset->addScript('/js/vendors/prism.min', 'footer', 90);
$asset->addScript('/js/docs.min', 'footer', 100);

$isComponents = (strpos($urlPath, '/components') === 0); ?>

<header class="head">
    <div class="wrapper">
        <ul class="docs-nav" id="nav">
            <li>
                <a href="<?= url(['route' => 'toolkit.docs', 'version' => $version]); ?>">
                    <span class="fa fa-book"></span>
                    <span class="title">Docs</span>
                </a>
            </li>

            <?php foreach ($toc['children'] as $i => $nav) {
                $isActive = (strpos($urlPath, $nav['url']) === 0); ?>

                <li>
                    <a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => trim($nav['url'], '/')]); ?>"
                        <?php if ($isActive) { ?> class="is-active"<?php } ?>>
                        <span class="fa <?= isset($navIcons[$i]) ? $navIcons[$i] : ''; ?>"></span>
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
            <aside class="col medium-3 large-3 docs-sidebar" id="toc">
                <nav class="box docs-toc">
                    <header><?= $tocSections['title']; ?></header>

                    <ul>
                        <?php if ($tocSections['url'] !== '/') { ?>
                            <li>
                                <a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => trim($tocSections['url'], '/')]); ?>">&laquo; Back</a>
                            </li>
                        <?php }

                        foreach ($tocSections['children'] as $chapter) {
                            if (isset($chapter['divider'])) {
                                continue;
                            }

                            $isOpen = ($urlPath === $chapter['url']); ?>

                            <li<?php if ($isOpen) { ?> class="is-open"<?php } ?>>
                                <a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => trim($chapter['url'], '/')]); ?>">
                                    <?php if ($isComponents && !empty($components[basename($chapter['url'])]['source']['js'])) { ?>
                                        <span class="label small float-right" data-tooltip="Requires JavaScript">JS</span>
                                    <?php } ?>

                                    <?= $chapter['title']; ?>

                                    <?php if (!empty($chapter['updated'])) { ?>
                                        <span class="label small is-info">Updated</span>
                                    <?php } ?>

                                    <?php if (!empty($chapter['new'])) { ?>
                                        <span class="label small is-success">New</span>
                                    <?php } ?>
                                </a>

                                <?php if ($isOpen) {
                                    if (!empty($chapter['children'])) {
                                        echo $this->open('docs/chapter-nav', ['chapters' => $chapter['children']]);
                                    }

                                    if (!empty($chapter['chapters'])) {
                                        echo $this->open('docs/chapter-nav', ['chapters' => $chapter['chapters']]);
                                    }
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
