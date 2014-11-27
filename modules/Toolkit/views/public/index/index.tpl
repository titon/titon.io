<?php
$breadcrumb->add('Toolkit', 'toolkit');

$filterComponents = function($type) use ($components) {
    $clean = [];

    foreach ($components as $key => $component) {
        if (isset($component['type']) && $component['type'] === $type) {
            $clean[] = $key;
        } else if (isset($component['category']) && $component['category'] === $type) {
            $clean[] = $key;
        }
    }

    return $clean;
}; ?>

<header class="head">
    <div class="wrapper">
        <h1>Toolkit</h1>

        <h6>Extensible front-end HTML, CSS, and JavaScript user interface components for the responsive, mobile, and modern web.</h6>

        <div class="hexagons hide-small">
            <div class="hexagon">
                <span class="center-vertical">
                    HTML5
                </span>
            </div>

            <div class="hexagon">
                <span class="center-vertical">
                    CSS3
                    <small>Sass</small>
                </span>
            </div>

            <div class="hexagon">
                <span class="center-vertical">
                    <span class="hide-mobile">JavaScript</span>
                    <span class="show-mobile">JS</span>
                    <small>Gulp</small>
                </span>
            </div>

            <div class="hexagon">
                <span class="center-vertical">
                    jQuery
                </span>
            </div>
        </div>

        <div class="button-toolbar">
            <a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => 'setup/getting-started']); ?>" class="button large">
                Install
            </a>

            <a href="https://github.com/titon/toolkit/archive/<?= $version; ?>.zip" class="button large is-success hide-mobile">
                Download
                <span class="button-suffix"><?= $version; ?></span>
            </a>

            <a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => 'releases/2.0']); ?>" class="button large">
                Release Notes
            </a>
        </div>
    </div>
</header>

<main class="body">
    <section class="segment features" id="features">
        <div class="wrapper">
            <h2>Feature rich for modern applications.</h2>
            <h5>Engineered for both developers and designers.</h5>

            <hr>

            <ul>
                <li>
                    <span class="hexagon-32"><span class="icon-16-mobile"></span></span>
                    <h6>Mobile First</h6>
                    <p>Optimized for mobile and touch devices by designated them as first-class priorities.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-responsive"></span></span>
                    <h6>Responsive Design</h6>
                    <p>Fluid by design to work seamlessly in all resolutions. No more pixel perfect designs &mdash; unless that's your thing.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-semantic"></span></span>
                    <h6>Semantic Markup</h6>
                    <p>Structured using semantically valid HTML tags to relay information alongside presentation.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-flexible"></span></span>
                    <h6>Flexible Styles</h6>
                    <p>Provides no visual CSS styles allowing for easier integration and customization. No more tedious style overriding!</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-accelerated"></span></span>
                    <h6>Accelerated Animations</h6>
                    <p>Improves animations and transitions with CSS3 and the GPU. Older browsers will fall back to simple display toggling.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-extensible"></span></span>
                    <h6>Extensible Configuration</h6>
                    <p>Encourages a configuration over convention approach. Customizable options, templates, builds, and more.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-scalable"></span></span>
                    <h6>Scalable Spacing</h6>
                    <p>Fonts, margins, and padding scaled with <var>em</var> and <var>rem</var> measurements. Eases responsive rendering.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-reusable"></span></span>
                    <h6>Reusable Code</h6>
                    <p>Easier code re-use through the CSS block-element-modifier (BEM) methodology, and an advanced JavaScript component system.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-accessible"></span></span>
                    <h6>Progressive Enhancement</h6>
                    <p>Enables shiny new features if a users device supports it. Further increases accessibility and portability.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-adaptable"></span></span>
                    <h6>Graceful Degradation</h6>
                    <p>Increases adaptability of legacy browsers by disabling or removing advanced features and providing bare bones functionality.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-stable"></span></span>
                    <h6>Stable Codebase</h6>
                    <p>Tested in a wide array of browsers, operating systems, and devices. Primed and ready for the modern age.</p>
                </li>
            </ul>
        </div>
    </section>

    <section class="segment components" id="components">
        <div class="wrapper">
            <h2>Powerful user interface components.</h2>
            <h5>Continually growing with every release.</h5>

            <hr>

            <div class="grid">
                <div class="col medium-4 large-4">
                    <h6>Layout</h6>

                    <p>Helper classes, mixins, functions, and visual styles for built-in HTML tags.</p>

                    <ul>
                        <?php foreach ($filterComponents('layout') as $key) {
                            echo $this->open('component-item', ['component' => $components[$key], 'key' => $key]);
                        } ?>
                    </ul>
                </div>

                <div class="col medium-4 large-4">
                    <h6>Elements</h6>

                    <p>Common user interface concepts packaged as static HTML elements.</p>

                    <ul>
                        <?php foreach ($filterComponents('element') as $key) {
                            echo $this->open('component-item', ['component' => $components[$key], 'key' => $key]);
                        } ?>
                    </ul>
                </div>

                <div class="col medium-4 large-4">
                    <h6>Modules</h6>

                    <p>Element components empowered with JavaScript for advanced functionality.</p>

                    <ul>
                        <?php foreach ($filterComponents('module') as $key) {
                            echo $this->open('component-item', ['component' => $components[$key], 'key' => $key]);
                        } ?>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="segment examples" id="examples">
        <div class="wrapper">
            <h2>Easy to integrate.</h2>
            <h5>Even easier to understand.</h5>

            <hr>

            <div class="grid">
                <div class="col medium-6 large-6">
                    <p>Define your own markup or roll with the suggested Toolkit structure.</p>

                    <pre><code class="lang-html">&lt;div class="carousel" data-carousel&gt;
    &lt;div class="carousel-items"&gt;
        &lt;ul data-carousel-items&gt;
            &lt;li&gt;&lt;a href=""&gt;&lt;img src="slide-1.jpg"&gt;&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href=""&gt;&lt;img src="slide-2.jpg"&gt;&lt;/a&gt;&lt;/li&gt;
        &lt;/ul&gt;
    &lt;/div&gt;

    &lt;button type="button" class="carousel-prev" data-carousel-prev&gt;&lt;/button&gt;
    &lt;button type="button" class="carousel-next" data-carousel-next&gt;&lt;/button&gt;
&lt;/div&gt;</code></pre>
                </div>

                <div class="col medium-6 large-6 end">
                    <p>Initialize JavaScript functionality for components using familiar plugin syntax.</p>

                    <pre id="example-jquery" class="tabs-section"><code class="lang-javascript">$('.carousel').carousel({
    animation: 'slide-up',
    autoCycle: true,
    stopOnHover: true,
    onCycle: function() {
        // Trigger logic
    }
});</code></pre>

                    <p>
                        <a href="<?= url(['route' => 'toolkit.docs', 'version' => $version, 'path' => 'components/carousel']); ?>" class="button">
                            View Carousel Component
                            <span class="fa fa-arrow-circle-right"></span>
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </section>
</main>

<?= $this->open('footer'); ?>