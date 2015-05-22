<?php $this->layout('layouts/default', ['pageTitle' => $article->getTitle() . ' - ' . $version . ' Documentation - Toolkit']); ?>

<?php $this->start('head'); ?>
<link href="<?= $this->asset('/css/vendors/prism.min.css'); ?>" media="screen" rel="stylesheet" type="text/css">
<?php $this->stop(); ?>

<?php $this->start('foot'); ?>
<script src="<?= $this->asset('/js/vendors/prism.min.js'); ?>"></script>
<script src="<?= $this->asset('/js/docs.min.js'); ?>"></script>
<?php $this->stop(); ?>

<header class="head">
    <div class="wrapper">
        <ul class="docs-nav" id="nav">
            <li>
                <a href="<?= $this->url('toolkit.docs.index', ['version' => $version]); ?>">
                    <span class="fa fa-book"></span>
                    <span class="title">Docs</span>
                </a>
            </li>

            <?php foreach ($menu->getNavigation() as $item) {
                $isActive = (strpos($article->getUrlPath(), $item['url']) === 0); ?>

                <li>
                    <a href="<?= $this->url('toolkit.docs', ['version' => $version, 'path' => $item['url']]); ?>"
                        <?php if ($isActive) { ?> class="is-active"<?php } ?>>
                        <span class="fa <?= $item['icon']; ?>"></span>
                        <span class="title"><?= $item['title']; ?></span>
                    </a>
                </li>

            <?php } ?>
        </ul>
    </div>
</header>

<main class="body" id="top">
    <div class="wrapper">
        <div class="grid" id="doc">
            <aside class="col small-3 medium-3 large-3 docs-sidebar" id="toc">
                <?php $parentMenu = $menu->getParentMenu(); ?>

                <nav class="box docs-toc">
                    <header><?= $parentMenu['title']; ?></header>

                    <ul>
                        <?php if ($parentMenu['url'] !== '/') { ?>
                            <li>
                                <a href="<?= $this->url('toolkit.docs', ['version' => $version, 'path' => trim($parentMenu['url'], '/')]); ?>">&laquo; Back</a>
                            </li>
                        <?php } ?>

                        <?php foreach ($parentMenu['children'] as $chapter) {
                            if (isset($chapter['divider'])) {
                                continue;
                            }

                            $isOpen = ('/' . $article->getUrlPath() === $chapter['url']); ?>

                            <li<?php if ($isOpen) { ?> class="is-open"<?php } ?>>
                                <a href="<?= $this->url('toolkit.docs', ['version' => $version, 'path' => trim($chapter['url'], '/')]); ?>">
                                    <?php if ($article->isPlugin() && !empty($plugins[basename($chapter['url'])]['source']['js'])) { ?>
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
                                        echo $this->fetch('partials/chapter-nav', ['chapters' => $chapter['children']]);
                                    }

                                    if (!empty($chapter['chapters'])) {
                                        echo $this->fetch('partials/chapter-nav', ['chapters' => $chapter['chapters']]);
                                    }
                                } ?>
                            </li>

                        <?php } ?>
                    </ul>
                </nav>
            </aside>

            <section class="col small-9 medium-9 large-9 end" id="chapters">
                <?php $count = 0;

                foreach ($article->getSections() as $id => $section) { ?>

                    <article class="box docs-article" id="<?= $id; ?>">
                        <?php // Display metadata in the 1st section
                        if ($count === 0) { ?>
                            <div class="docs-actions">
                                <?php if ($article->isPlugin()) { ?>
                                    <div class="button-group round small">
                                        <?php if ($cssUrl = $article->getPlugin()->getGitHubCssUrl()) { ?>
                                            <a href="<?= $cssUrl; ?>" class="button">SCSS</a>
                                        <?php } ?>

                                        <?php if ($jsUrl = $article->getPlugin()->getGitHubJsUrl()) { ?>
                                            <a href="<?= $jsUrl; ?>" class="button">JS</a>
                                        <?php } ?>
                                    </div>
                                <?php } ?>

                                <div class="button-group round small">
                                    <a href="<?= $article->getGitHubUrl(); ?>" class="button is-success">Edit</a>

                                    <?php if ($article->isPlugin() && ($demoUrl = $article->getPlugin()->getDemoUrl())) { ?>
                                        <a href="<?= $demoUrl; ?>" class="button is-error">Demo</a>
                                    <?php } ?>
                                </div>
                            </div>

                        <?php } else { ?>
                            <a href="#top" class="scroll-to back-to-top">
                                Top <span class="fa fa-arrow-up"></span>
                            </a>
                        <?php } ?>

                        <?php // Render the sections content
                        echo $section; ?>

                        <?php // Display requirements for plugins
                        if ($count === 0 && $article->isPlugin()) {
                            $requires = [];

                            foreach ($article->getPlugin()->getRequires() as $require) {
                                if ($require === 'base') {
                                    $requires[] = sprintf('<a href="%s">%s</a>', '../development/css/base', 'Base (CSS)');

                                    if ($article->getPlugin()->getSourceJs()) {
                                        $requires[] = sprintf('<a href="%s">%s</a>', '../development/js/base', 'Base (JS)');
                                    }
                                } else {
                                    $requires[] = sprintf('<a href="%s">%s</a>', $require, $plugins[$require]['name']);
                                }
                            } ?>

                            <ul class="docs-meta">
                                <?php if ($requires) { ?>
                                    <li><b>Requires:</b> <?= implode(', ', $requires); ?></li>
                                <?php }

                                if ($pluginVersion = $article->getPlugin()->getAddedVersion()) { ?>
                                    <li><b>Added In:</b> <?= $pluginVersion; ?></li>
                                <?php } ?>
                            </ul>
                        <?php } ?>
                    </article>

                    <?php $count++;
                } ?>
            </section>
        </div>
    </div>
</main>

<?= $this->fetch('partials/footer'); ?>
