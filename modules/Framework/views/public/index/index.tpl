<?php
$breadcrumb->add('Framework', 'framework'); ?>

<header class="head">
    <div class="wrapper">
        <h1>Framework</h1>

        <h6>Ease the process of application development by off-loading common tasks with these lightweight modular back-end packages.</h6>

        <div class="hexagons hide-small">
            <div class="hexagon">
                <span class="center-vertical">
                    PHP
                    <small>5.3, 5.4</small>
                </span>
            </div>

            <div class="hexagon">
                <span class="center-vertical">
                    Composer
                    <small>Packagist</small>
                </span>
            </div>

            <div class="hexagon">
                <span class="center-vertical">
                    MySQL
                </span>
            </div>

            <div class="hexagon">
                <span class="center-vertical">
                    PostgreSQL
                </span>
            </div>

            <div class="hexagon">
                <span class="center-vertical">
                    SQLite
                </span>
            </div>

            <div class="hexagon">
                <span class="center-vertical">
                    MongoDB
                </span>
            </div>
        </div>

        <div class="button-toolbar">
            <a href="#packages" class="button large is-success scroll-to">
                View Packages
            </a>

            <a href="#install" class="button large hide-xsmall scroll-to">
                Install
            </a>
        </div>
    </div>
</header>

<main class="body">
    <section class="segment features" id="features">
        <div class="wrapper">
            <h2>Engineered for web applications.</h2>
            <h5>By following the latest in standards and techniques.</h5>

            <hr>

            <ul>
                <li>
                    <span class="hexagon-32"><span class="icon-16-abstract"></span></span>
                    <h6>Abstraction</h6>
                    <p>Provides an architecture for easier code implementation and reduction, through interfaces, traits, and abstract classes.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-interoperable"></span></span>
                    <h6>Interoperability</h6>
                    <p>Works seamlessly with external libraries, vendors, and third-parties. Even smoother through Composer.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-coupling"></span></span>
                    <h6>Low Coupling</h6>
                    <p>Requires minimal internal and external dependencies with low cross-package requirements.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-cohesion"></span></span>
                    <h6>High Cohesion</h6>
                    <p>Supplies focused classes, and their sub-classes, for easier manageability and understanding.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-di"></span></span>
                    <h6>Dependency Inversion</h6>
                    <p>Wide array of dependency support through registries, factories, containers, service locators, and more.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-polymorph"></span></span>
                    <h6>Polymorphism</h6>
                    <p>Supports diverse type and relational functionality through a common interface.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-database"></span></span>
                    <h6>Database Modeling</h6>
                    <p>Provides a powerful database abstraction layer and object relational mapper for popular database drivers &mdash; even MongoDB.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-responsible"></span></span>
                    <h6>Single Responsibility</h6>
                    <p>Classes are designed and encapsulated for a single purpose. Why increase class complexity?</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-extensible"></span></span>
                    <h6>Configurable</h6>
                    <p>Encourages a configuration over convention approach. Further enhanced by powerful traits and base classes.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-principles"></span></span>
                    <h6>Software Principles</h6>
                    <p>Encourages the practice of <a href="http://en.wikipedia.org/wiki/Don%27t_repeat_yourself" target="_blank">DRY</a>,
                    <a href="http://en.wikipedia.org/wiki/KISS_principle" target="_blank">KISS</a>,
                    <a href="http://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it" target="_blank">YAGNI</a>,
                    <a href="http://en.wikipedia.org/wiki/GRASP_%28object-oriented_design%29" target="_blank">GRASP</a>,
                    and <a href="http://en.wikipedia.org/wiki/SOLID_%28object-oriented_design%29" target="_blank">SOLID</a> design principles.</p>
                </li>
                <li>
                    <span class="hexagon-32"><span class="icon-16-patterns"></span></span>
                    <h6>Design Patterns</h6>
                    <p>Makes use of popular design patterns like
                    <a href="http://en.wikipedia.org/wiki/Factory_pattern" target="_blank">Factory</a>,
                    <a href="http://en.wikipedia.org/wiki/Observer_pattern" target="_blank">Observer</a>,
                    <a href="http://en.wikipedia.org/wiki/Adapter_pattern" target="_blank">Adapter</a>, and
                    <a href="http://en.wikipedia.org/wiki/Decorator_pattern" target="_blank">Decorator</a>.</p>
                </li>
            </ul>
        </div>
    </section>

    <section class="segment packages" id="packages">
        <div class="wrapper">
            <h2>Lightweight modular packages.</h2>
            <h5>For solving common application scenarios.</h5>

            <hr>

            <div class="grid">
                <div class="col medium-4 large-4">
                    <h6>Utilities</h6>

                    <p>Helper and utility classes.</p>

                    <ul>
                        <?php foreach (['common' => 'Common', 'event' => 'Event', 'type' => 'Type', 'utility' => 'Utility'] as $key => $name) {
                            echo $this->open('package-item', ['package' => $packages[$key], 'key' => $key, 'name' => $name]);
                        } ?>
                    </ul>

                    <h6>HTTP</h6>

                    <p>Hooks into the HTTP request and response cycle.</p>

                    <ul>
                        <?php foreach (['http' => 'HTTP', 'route' => 'Route'] as $key => $name) {
                            echo $this->open('package-item', ['package' => $packages[$key], 'key' => $key, 'name' => $name]);
                        } ?>
                    </ul>
                </div>

                <div class="col medium-4 large-4">
                    <h6>Application</h6>

                    <p>Eases application building by offloading common tasks and use cases.</p>

                    <ul>
                        <?php foreach (['app' => 'Application', 'cache' => 'Cache', 'debug' => 'Debug', 'env' => 'Environment', 'g11n' => 'Globalization', 'io' => 'I/O'] as $key => $name) {
                            echo $this->open('package-item', ['package' => $packages[$key], 'key' => $key, 'name' => $name]);
                        } ?>
                    </ul>
                </div>

                <div class="col medium-4 large-4">
                    <h6>MVC</h6>

                    <p>Separate or combined support for the MVC software pattern.</p>

                    <ul>
                        <?php foreach (['mvc' => 'MVC', 'model' => 'Model', 'view' => 'View', 'controller' => 'Controller'] as $key => $name) {
                            echo $this->open('package-item', ['package' => $packages[$key], 'key' => $key, 'name' => $name]);
                        } ?>
                    </ul>

                    <h6>Database</h6>

                    <p>Database layer with support for popular engines.</p>

                    <ul>
                        <?php foreach (['db' => 'Database', 'db-mysql' => 'MySQL', 'db-postgresql' => 'PostgreSQL', 'db-sqlite' => 'SQLite', 'db-mongodb' => 'MongoDB'] as $key => $name) {
                            echo $this->open('package-item', ['package' => $packages[$key], 'key' => $key, 'name' => $name]);
                        } ?>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="segment install" id="install">
        <div class="wrapper">
            <h2>Easy installation through Composer.</h2>
            <h5>Provides built-in autoloading and dependency management.</h5>

            <hr>

            <div class="grid">
                <div class="col medium-4 large-4">
                    <p>Add a package to <code>composer.json</code>.</p>

                    <pre><code class="lang-json">"require": {
    "titon/common": "*",
    "titon/event": "*"
}</code></pre>
                </div>

                <div class="col medium-4 large-4">
                    <p>Install the packages from the command line.</p>

                    <pre><code class="lang-bash">composer install</code></pre>
                </div>

                <div class="col medium-4 large-4">
                    <p>Include the Composer autoloader.</p>

                    <pre><code class="lang-php">require 'vendor/autoload.php';</code></pre>
                </div>
            </div>
        </div>
    </section>
</main>

<?= $this->open('footer'); ?>