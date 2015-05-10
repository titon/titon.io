<?php $this->layout('layouts/home', ['pageTitle' => $title]); ?>

<div class="error">
    <header class="head">
        <div class="wrapper align-center">
            <h1><?= $code; ?></h1>
            <h2><?= $title; ?></h2>
        </div>
    </header>

    <main class="body">
        <div class="wrapper align-center">
            <?= $message; ?>
        </div>
    </main>

    <?= $this->fetch('partials/footer'); ?>
</div>
