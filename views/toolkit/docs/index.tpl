<?php $this->layout('layouts/default', ['pageTitle' => $version . ' Documentation - Toolkit']); ?>

<?php $this->start('foot'); ?>
<script src="<?= $this->asset('/js/docs.min.js'); ?>"></script>
<?php $this->stop(); ?>

<header class="head">
    <div class="wrapper">
        <ul class="docs-nav" id="nav">
            <li>
                <a href="<?= $this->url('toolkit.docs.index', ['version' => $version]); ?>" class="is-active">
                    <span class="fa fa-book"></span>
                    <span class="title">Docs</span>
                </a>
            </li>

            <?php foreach ($menu->getNavigation() as $item) { ?>

                <li>
                    <a href="<?= $this->url('toolkit.docs', ['version' => $version, 'path' => $item['url']]); ?>">
                        <span class="fa <?= $item['icon']; ?>"></span>
                        <span class="title"><?= $item['title']; ?></span>
                    </a>
                </li>

            <?php } ?>
        </ul>
    </div>
</header>

<main class="body">
    <div class="wrapper">
        <div class="grid">
            <div class="col large-6 medium-6 box">
                <h3>What Is Toolkit</h3>

                <p>Titon Toolkit is a collection of very powerful user interface components, behaviors, and utility
                    classes for the responsive, mobile, and modern web. Each plugin represents encapsulated HTML,
                    CSS, and JavaScript functionality for role specific page elements.</p>

                <p>Toolkit makes use of the latest and greatest technology. This includes HTML5 for semantics,
                    CSS3 for animations and styles, Sass for CSS pre-processing, Grunt for task and package management,
                    and powerful new browser APIs for the JavaScript layer.</p>

                <p>
                    <a href="<?= $this->url('toolkit.docs', ['version' => $version, 'path' => 'components']); ?>" class="button">
                        View Components
                        <span class="fa fa-arrow-circle-right"></span>
                    </a>
                </p>
            </div>

            <div class="col large-6 medium-6 box">
                <h3>Where To Start</h3>

                <p>Learning a new library can be quite challenging, but in the end the knowledge you gain is worth the time spent.
                    To lower the learning curve, we've documented every little detail about every part of the library.
                    Before you start implementing Toolkit, we suggest learning the ins and outs of the JavaScript and CSS.</p>

                <ul>
                    <li><a href="<?= $this->url('toolkit.docs', ['version' => $version, 'path' => 'development/js']); ?>">JavaScript</a></li>
                    <li>
                        <a href="<?= $this->url('toolkit.docs', ['version' => $version, 'path' => 'development/css']); ?>">CSS</a> and
                        <a href="<?= $this->url('toolkit.docs', ['version' => $version, 'path' => 'development/sass']); ?>">Sass</a>
                    </li>
                </ul>

                <p>If you're ready to move on, or just want to skip ahead, we suggest the following articles.</p>

                <ul>
                    <li><a href="<?= $this->url('toolkit.docs', ['version' => $version, 'path' => 'setup/getting-started']); ?>">Getting Started</a></li>
                    <li><a href="<?= $this->url('toolkit.docs', ['version' => $version, 'path' => 'setup/installing']); ?>">Downloading &amp; Installing</a></li>
                </ul>
            </div>
        </div>
    </div>
</main>

<?= $this->fetch('partials/footer'); ?>
