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
            <?php /*
            <aside class="col small-3 medium-3 large-3 docs-sidebar" id="toc">
                <nav class="box docs-toc">
                    <header><?= $chapters['title']; ?></header>

                    <ul>
                        <? if ($chapters['url'] !== '/') { ?>
                            <li>
                                <a href="<?= $this->url('toolkit.docs', ['version' => $version, 'path' => trim($chapters['url'], '/')]); ?>">&laquo; Back</a>
                            </li>
                        <? }

                        $isComponents = (strpos($urlPath, '/components') === 0);

                        foreach ($chapters['children'] as $chapter) {
                            if (isset($chapter['divider'])) {
                                continue;
                            }

                            $isOpen = ($urlPath === $chapter['url']); ?>

                            <li<? if ($isOpen) { ?> class="is-open"<? } ?>>
                                <a href="<?= $this->url('toolkit.docs', ['version' => $version, 'path' => trim($chapter['url'], '/')]); ?>">
                                    <? if ($isComponents && !empty($components[basename($chapter['url'])]['source']['js'])) { ?>
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
            */ ?>

            <section class="col small-9 medium-9 large-9 end" id="chapters">
                <? $count = 0;

                foreach ($article->getSections() as $id => $section) { ?>

                    <article class="box docs-article" id="<?= $id; ?>">
                        <? if ($count === 0) { ?>
                            <div class="docs-actions">
                                <? if (!empty($component)) { ?>
                                    <div class="button-group round small">
                                        <? if (!empty($component['source']['css'][0])) { ?>
                                            <a href="https://github.com/titon/toolkit/tree/master/scss/toolkit/<?= $component['source']['css'][0]; ?>" class="button">SCSS</a>
                                        <? }

                                        if (!empty($component['source']['js'][0])) {?>
                                            <a href="https://github.com/titon/toolkit/tree/master/js/<?= $component['source']['js'][0]; ?>" class="button">JS</a>
                                        <? } ?>
                                    </div>
                                <? } ?>

                                <div class="button-group round small">
                                    <a href="<?= $article->getGitHubUrl(); ?>" class="button is-success">Edit</a>

                                    <? if (!empty($component) && $component['key'] !== 'blackout') { ?>
                                        <a href="http://demo.titon.io/?<?= $component['key']; ?>" class="button is-error">Demo</a>
                                    <? } ?>
                                </div>
                            </div>

                        <? } else { ?>
                            <a href="#top" class="scroll-to back-to-top">
                                Top <span class="fa fa-arrow-up"></span>
                            </a>
                        <? } ?>

                        <?= $section; ?>

                        <? // Display requirements for components
                        if ($count === 0 && !empty($component)) {
                            $requires = [];

                            if (!empty($component['require'])) {
                                foreach ($component['require'] as $requireKey) {
                                    $requires[] = sprintf('<a href="%s">%s</a>', $requireKey, $components[$requireKey]['name']);
                                }
                            } ?>

                            <ul class="docs-meta">
                                <? if ($requires) { ?>
                                    <li><b>Requires:</b> <?= implode(', ', $requires); ?></li>
                                <? }

                                if (!empty($component['version'])) { ?>
                                    <li><b>Added In:</b> <?= $component['version']; ?></li>
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
