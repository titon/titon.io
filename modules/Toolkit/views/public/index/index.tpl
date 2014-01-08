<?php
$this->wrapWith('landing');

$breadcrumb->add('Toolkit', 'toolkit'); ?>

<header class="head">
    <div class="wrapper">
        <h1>Toolkit</h1>

        <h6>Extensible front-end HTML, CSS, and JavaScript user interface components for the responsive, mobile, and modern web.</h6>

        <div class="hexagons hide-small">
            <a href="https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5" target="_blank" class="hexagon">
                <span class="center-vertical">
                    HTML5
                </span>
            </a>

            <a href="http://sass-lang.com/" target="_blank" class="hexagon">
                <span class="center-vertical">
                    CSS3
                    <small>Sass</small>
                </span>
            </a>

            <a href="http://gruntjs.com/" target="_blank" class="hexagon">
                <span class="center-vertical">
                    <span class="hide-mobile">JavaScript</span>
                    <span class="show-mobile">JS</span>
                    <small>Grunt</small>
                </span>
            </a>

            <a href="http://jquery.com/" target="_blank" class="hexagon">
                <span class="center-vertical">
                    jQuery
                </span>
            </a>

            <a href="http://mootools.net/" target="_blank" class="hexagon">
                <span class="center-vertical">
                    <span class="hide-mobile">MooTools</span>
                    <span class="show-mobile">Moo</span>
                </span>
            </a>
        </div>

        <div class="button-toolbar">
            <a href="https://github.com/titon/toolkit/releases" class="button large is-success" target="_blank">
                Download
                <span class="button-suffix"><?= $version; ?></span>
            </a>

            <a href="https://github.com/titon/toolkit/blob/master/docs/pages/en/setup/getting-started.md" class="button large hide-mobile" target="_blank">
                Install
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
                <div class="col medium-3 large-4">
                    <h6>Layout</h6>

                    <p>Helper classes, mixins, functions, and visual styles for built-in HTML tags.</p>

                    <ul>
                        <?php foreach (['base', 'code', 'form', 'typography', 'responsive'] as $key) {
                            echo $this->open('component-item', ['component' => $components[$key], 'key' => $key]);
                        } ?>
                    </ul>

                    <h6>Effects</h6>

                    <p>Additional visual aesthetics for other Toolkit components.</p>

                    <ul>
                        <?php foreach (['effect-visual', 'effect-pill', 'effect-oval', 'effect-skew'] as $key) {
                            echo $this->open('component-item', ['component' => $components[$key], 'key' => $key]);
                        } ?>
                    </ul>
                </div>

                <div class="col medium-3 large-4">
                    <h6>Elements</h6>

                    <p>Common user interface concepts packaged as static HTML elements.</p>

                    <ul>
                        <?php foreach (['breadcrumb', 'button', 'button-group', 'grid', 'icon', 'input-group', 'label', 'notice', 'pagination', 'progress', 'table'] as $key) {
                            echo $this->open('component-item', ['component' => $components[$key], 'key' => $key]);
                        } ?>
                    </ul>

                    <h6>Classes</h6>

                    <p>MooTools classes to solve specific use cases.</p>

                    <ul>
                        <?php foreach (['cache', 'timers'] as $key) {
                            echo $this->open('component-item', ['component' => $components[$key], 'key' => $key]);
                        } ?>
                    </ul>
                </div>

                <div class="col medium-3 large-4">
                    <h6>Modules</h6>

                    <p>Element components empowered with JavaScript for advanced functionality.</p>

                    <ul>
                        <?php foreach ([
                           'accordion', 'blackout', 'carousel', 'flyout', 'input', 'lazy-load', 'matrix', 'modal',
                           'pin', 'popover', 'showcase', 'stalker', 'tabs', 'tooltip', 'type-ahead'
                        ] as $key) {
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
                <div class="col medium-4 large-6">
                    <p>Define your own markup or roll with the suggested Toolkit structure.</p>

                    <pre><code class="lang-html">&lt;div class="carousel"&gt;
    &lt;div class="carousel-items"&gt;
        &lt;ul&gt;
            &lt;li&gt;&lt;a href=""&gt;&lt;img src="slide-1.jpg"&gt;&lt;/a&gt;&lt;/li&gt;
            &lt;li&gt;&lt;a href=""&gt;&lt;img src="slide-2.jpg"&gt;&lt;/a&gt;&lt;/li&gt;
        &lt;/ul&gt;
    &lt;/div&gt;

    &lt;a href="javascript:;" class="carousel-prev"&gt;
        &lt;span class="arrow-left"&gt;&lt;/span&gt;
    &lt;/a&gt;

    &lt;a href="javascript:;" class="carousel-next"&gt;
        &lt;span class="arrow-right"&gt;&lt;/span&gt;
    &lt;/a&gt;
&lt;/div&gt;</code></pre>
                </div>

                <div class="col medium-4 large-6 end">
                    <p>Initialize JavaScript functionality for components using familiar plugin syntax.</p>

                    <div class="tabs example-tabs">
                        <nav class="tabs-nav">
                            <ul>
                                <li><a href="#example-jquery">jQuery</a></li>
                                <li><a href="#example-mootools">MooTools</a></li>
                            </ul>
                        </nav>

                        <pre id="example-jquery" class="tabs-section"><code class="lang-javascript">$('.carousel').carousel({
    animation: 'slide-up',
    autoCycle: true,
    stopOnHover: true,
    onCycle: function() {
        // Trigger logic
    }
});</code></pre>

                        <pre id="example-mootools"  class="tabs-section"><code class="lang-javascript">$$('.carousel').carousel({
    animation: 'slide-up',
    autoCycle: true,
    stopOnHover: true,
    onCycle: function() {
        // Trigger logic
    }
});</code></pre>
                    </div>

                    <?php /*<p>
                        <a href="https://github.com/titon/toolkit/tree/master/docs/pages/en/components/carousel.md" class="button">
                            View Carousel Component
                            <span class="fa fa-arrow-circle-right"></span>
                        </a>
                    </p>*/ ?>
                </div>
            </div>
        </div>
    </section>
</main>