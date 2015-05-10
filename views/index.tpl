<?php $this->layout('layouts/home'); ?>

<div id="home" class="home">
    <div class="wrapper">
        <h1>Titon</h1>

        <div class="grid">
            <div class="go-toolkit col medium-6 large-6">
                <h2>Toolkit</h2>

                <p>A collection of extensible front-end user interface components and behaviors for the responsive, mobile, and modern web.</p>

                <p><a href="<?= $this->url('toolkit'); ?>" class="button">View Plugins</a></p>
            </div>

            <div class="go-framework col medium-6 large-6 end">
                <h2>Framework</h2>

                <p>A collection of modular back-end packages to ease the process of application building by off-loading common tasks.</p>

                <p><button class="button is-disabled" disabled type="button">Temporarily Offline</button></p>
            </div>
        </div>
    </div>
</div>
