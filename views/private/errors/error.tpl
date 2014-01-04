<?php $this->wrapWith('error'); ?>

<header class="head">
    <div class="wrapper align-center">
        <h1><?= $code; ?></h1>
        <h2><?= $html->title(); ?></h2>
    </div>
</header>

<main class="body">
    <div class="wrapper">
        <p>
            <b>Exception:</b> <?= get_class($error); ?><br>
            <b>Message:</b> <?= $message; ?><br>
            <b>File:</b> <?= $error->getFile(); ?><br>
            <b>Line:</b> <?= $error->getLine(); ?>
        </p>

        <?php backtrace($error); ?>
    </div>
</main>