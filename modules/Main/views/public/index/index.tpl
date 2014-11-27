<?php
$asset->addStylesheet('/css/home.min', [], 10);
$asset->addScript('/js/home.min', 'footer', 10); ?>

<div id="home" class="home">
    <div class="wrapper">
        <h1>Titon</h1>

        <div class="grid">
            <div class="go-toolkit col medium-6 large-6">
                <h2>Toolkit</h2>

                <p>A collection of extensible front-end user interface components for the responsive and mobile web.</p>

                <p><?php echo $html->anchor('View Components', 'Toolkit\Index@index', ['class' => 'button']); ?></p>
            </div>

            <div class="go-framework col medium-6 large-6 end">
                <h2>Framework</h2>

                <p>A collection of modular back-end packages to ease the process of application building by off-loading common tasks.</p>

                <?php /*<p><?php echo $html->anchor('View Packages', 'Framework\Index@index', ['class' => 'button']); ?></p>*/ ?>

                <p><button class="button is-disabled" disabled type="button">Temporarily Offline</button></p>
            </div>
        </div>
    </div>
</div>