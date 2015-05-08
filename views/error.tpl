<?php $this->layout('layouts/default', ['pageTitle' => 'Error']); ?>

<div class="error">
    <header class="head">
        <div class="wrapper align-center">
            <h1><?= $code; ?></h1>
            <h2><?= ($code === 404) ? 'Not Found' : 'Internal Error'; ?></h2>
        </div>
    </header>

    <main class="body">
        <div class="wrapper align-center">
            An unexpected error has occurred. Please be patient while we analyze the problem.
        </div>
    </main>

    <?= $this->fetch('partials/footer'); ?>
</div>
