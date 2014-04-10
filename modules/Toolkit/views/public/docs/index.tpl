<?php $asset->addScript('/js/docs.min', 'footer', 100); ?>

<header class="head">
    <div class="wrapper">
        <ul class="docs-nav" id="nav">
            <li>
                <a href="<?= url(['route' => 'toolkit.docs', 'version' => $version]); ?>" class="is-active">
                    <span class="fa fa-book"></span>
                    <span class="title">Docs</span>
                </a>
            </li>

            <?php foreach ($toc['children'] as $i => $nav) { ?>

                <li>
                    <a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => trim($nav['url'], '/')]); ?>">
                        <span class="fa <?= $navIcons[$i]; ?>"></span>
                        <span class="title"><?= $nav['title']; ?></span>
                    </a>
                </li>

            <?php } ?>
        </ul>
    </div>
</header>

<main class="body">
    <div class="wrapper">
        <div class="grid">
            <div class="col desktop-6 box">
                <h3>What Is Toolkit</h3>

                <p>Titon Toolkit is a collection of very powerful user interface components and utility
                    classes for the responsive, mobile, and modern web. Each component represents encapsulated HTML,
                    CSS, and JavaScript functionality for role specific page elements.</p>

                <p>Toolkit makes use of the latest and greatest technology. This includes HTML5 for semantics,
                    CSS3 for animations and styles, Sass for CSS pre-processing, Grunt for task and package management,
                    and powerful new browser APIs for the JavaScript layer.</p>

                <p>
                    <a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => 'components']); ?>" class="button">
                        View Components
                        <span class="fa fa-arrow-circle-right"></span>
                    </a>

                    <a href="/slides/what-is-toolkit.pdf" target="_blank" class="button is-info">
                        View Slides (v1.1)
                        <span class="fa fa-arrow-circle-right"></span>
                    </a>
                </p>
            </div>

            <div class="col desktop-6 box">
                <h3>Where To Start</h3>

                <p>Learning a new library can be quite challenging, but in the end the knowledge you gain is worth the time spent.
                    To lower the learning curve, we've documented every little detail about every part of the library.
                    Before you start implementing Toolkit, we suggest learning the ins and outs of the JavaScript and CSS.</p>

                <ul>
                    <li><a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => 'development/js']); ?>">JavaScript component system</a></li>
                    <li><a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => 'development/css']); ?>">CSS modules with Sass</a></li>
                </ul>

                <p>If you're ready to move on, or just want to skip ahead, we suggest the following articles.</p>

                <ul>
                    <li><a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => 'setup/getting-started']); ?>">Getting Started</a></li>
                    <li><a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => 'setup/installing']); ?>">Downloading &amp; Installing</a></li>
                </ul>
            </div>
        </div>
    </div>
</main>

<?= $this->open('footer'); ?>