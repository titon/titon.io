<?php $this->wrapWith('error'); ?>

<header class="head">
    <div class="wrapper align-center">
        <h1><?php echo $code; ?></h1>
        <h2><?php echo $pageTitle; ?></h2>
    </div>
</header>

<main class="body">
    <div class="wrapper">
        <p>
            <b>Exception:</b> <?php echo get_class($error); ?><br>
            <b>Message:</b> <?php echo $message; ?><br>
            <b>File:</b> <?php echo $error->getFile(); ?><br>
            <b>Line:</b> <?php echo $error->getLine(); ?>
        </p>

        <?php backtrace($error); ?>
    </div>
</main>