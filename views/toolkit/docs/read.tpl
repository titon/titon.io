<? $this->layout('layouts/default', ['pageTitle' => $article->getTitle() . ' - Documentation - Toolkit']); ?>

<? $this->start('head'); ?>
<link href="<?= $this->asset('/css/vendors/prism.min.css'); ?>" media="screen" rel="stylesheet" type="text/css">
<? $this->stop(); ?>

<? $this->start('foot'); ?>
<script src="<?= $this->asset('/js/vendors/prism.min.js'); ?>"></script>
<script src="<?= $this->asset('/js/docs.min.js'); ?>"></script>
<? $this->stop(); ?>

<header class="head">
    <div class="wrapper">
        <ul class="docs-nav" id="nav">
            <li>
                <a href="<?= $this->url('toolkit.docs.index', ['version' => $version]); ?>">
                    <span class="fa fa-book"></span>
                    <span class="title">Docs</span>
                </a>
            </li>

            <? foreach ($menu->getNavigation() as $item) {
                $isActive = (strpos($article->getUrlPath(), $item['url']) === 0); ?>

                <li>
                    <a href="<?= $this->url('toolkit.docs', ['version' => $version, 'path' => $item['url']]); ?>"
                        <? if ($isActive) { ?> class="is-active"<? } ?>>
                        <span class="fa <?= $item['icon']; ?>"></span>
                        <span class="title"><?= $item['title']; ?></span>
                    </a>
                </li>

            <? } ?>
        </ul>
    </div>
</header>

<main class="body" id="top">
    <div class="wrapper">
        <div class="grid" id="doc">
            <aside class="col small-3 medium-3 large-3 docs-sidebar" id="toc">
                <? $parentMenu = $menu->getParentMenu(); ?>

                <nav class="box docs-toc">
                    <header><?= $parentMenu['title']; ?></header>

                    <ul>
                        <? if ($parentMenu['url'] !== '/') { ?>
                            <li>
                                <a href="<?= $this->url('toolkit.docs', ['version' => $version, 'path' => trim($parentMenu['url'], '/')]); ?>">&laquo; Back</a>
                            </li>
                        <? } ?>

                        <? foreach ($parentMenu['children'] as $chapter) {
                            if (isset($chapter['divider'])) {
                                continue;
                            }

                            $isOpen = ('/' . $article->getUrlPath() === $chapter['url']); ?>

                            <li<? if ($isOpen) { ?> class="is-open"<? } ?>>
                                <a href="<?= $this->url('toolkit.docs', ['version' => $version, 'path' => trim($chapter['url'], '/')]); ?>">
                                    <? if ($article->isPlugin() && !empty($components[basename($chapter['url'])]['source']['js'])) { ?>
                                        <span class="label small float-right" data-tooltip="Requires JavaScript">JS</span>
                                    <? } ?>

                                    <?= $chapter['title']; ?>

                                    <? if (!empty($chapter['updated'])) { ?>
                                        <span class="label small is-info">Updated</span>
                                    <? } ?>

                                    <? if (!empty($chapter['new'])) { ?>
                                        <span class="label small is-success">New</span>
                                    <? } ?>
                                </a>

                                <? if ($isOpen) {
                                    if (!empty($chapter['children'])) {
                                        echo $this->fetch('partials/chapter-nav', ['chapters' => $chapter['children']]);
                                    }

                                    if (!empty($chapter['chapters'])) {
                                        echo $this->fetch('partials/chapter-nav', ['chapters' => $chapter['chapters']]);
                                    }
                                } ?>
                            </li>

                        <? } ?>
                    </ul>
                </nav>
            </aside>

            <section class="col small-9 medium-9 large-9 end" id="chapters">
                <? $count = 0;

                foreach ($article->getSections() as $id => $section) { ?>

                    <article class="box docs-article" id="<?= $id; ?>">
                        <? // Display metadata in the 1st section
                        if ($count === 0) { ?>
                            <div class="docs-actions">
                                <? if ($article->isPlugin()) { ?>
                                    <div class="button-group round small">
                                        <? if ($cssUrl = $article->getPlugin()->getGitHubCssUrl()) { ?>
                                            <a href="<?= $cssUrl; ?>" class="button">SCSS</a>
                                        <? } ?>

                                        <? if ($jsUrl = $article->getPlugin()->getGitHubJsUrl()) { ?>
                                            <a href="<?= $jsUrl; ?>" class="button">JS</a>
                                        <? } ?>
                                    </div>
                                <? } ?>

                                <div class="button-group round small">
                                    <a href="<?= $article->getGitHubUrl(); ?>" class="button is-success">Edit</a>

                                    <? if ($article->isPlugin() && ($demoUrl = $article->getPlugin()->getDemoUrl())) { ?>
                                        <a href="<?= $demoUrl; ?>" class="button is-error">Demo</a>
                                    <? } ?>
                                </div>
                            </div>

                        <? } else { ?>
                            <a href="#top" class="scroll-to back-to-top">
                                Top <span class="fa fa-arrow-up"></span>
                            </a>
                        <? } ?>

                        <? // Render the sections content
                        echo $section; ?>

                        <? // Display requirements for plugins
                        if ($count === 0 && $article->isPlugin()) {
                            $requires = [];

                            foreach ($article->getPlugin()->getRequires() as $require) {
                                if ($require === 'base') {
                                    $requires[] = sprintf('<a href="%s">%s</a>', '../development/css/base', 'Base (CSS)');

                                    if ($article->getPlugin()->getSourceJs()) {
                                        $requires[] = sprintf('<a href="%s">%s</a>', '../development/js/base', 'Base (JS)');
                                    }
                                } else {
                                    $requires[] = sprintf('<a href="%s">%s</a>', $require, $components[$require]['name']);
                                }
                            } ?>

                            <ul class="docs-meta">
                                <? if ($requires) { ?>
                                    <li><b>Requires:</b> <?= implode(', ', $requires); ?></li>
                                <? }

                                if ($pluginVersion = $article->getPlugin()->getAddedVersion()) { ?>
                                    <li><b>Added In:</b> <?= $pluginVersion; ?></li>
                                <? } ?>
                            </ul>
                        <? } ?>
                    </article>

                    <? $count++;
                } ?>
            </section>
        </div>
    </div>
</main>

<?= $this->fetch('partials/footer'); ?>
