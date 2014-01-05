<!DOCTYPE html>
<html xmlns:og="http://ogp.me/ns#" xmlns:fb="http://ogp.me/ns/fb#">
<head>
    <meta name="charset" content="UTF-8">
    <title><?= $html->title(); ?></title>
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="https://s3.amazonaws.com/titon/logo-144.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="https://s3.amazonaws.com/titon/logo-144.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="https://s3.amazonaws.com/titon/logo-114.png">
    <link rel="apple-touch-icon-precomposed" href="https://s3.amazonaws.com/titon/logo-114.png">
    <link href="/favicon.ico" type="image/x-icon" rel="icon">
    <link href="/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <meta property="og:type" content="website">
    <meta property="og:url" content="http://titon.io/">
    <meta property="og:site_name" content="Project Titon">
    <meta property="og:locale" content="en_US">
    <meta property="og:image" content="https://s3.amazonaws.com/titon/logo-200.png">
    <?php
    $asset->addStylesheet('//fonts.googleapis.com/css?family=Droid+Sans:400,700');
    $asset->addStylesheet('/css/vendors/font-awesome.min');
    $asset->addStylesheet('/css/style.min');
    $asset->addStylesheet('/css/debug.min', [], 100, 'dev');
    $asset->addScript('//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js', 'header');
    $asset->addScript('/js/vendors/titon.min', 'header');
    $asset->addScript('/js/script.min', 'footer');

    $env = $this->data('env', 'prod');

    echo $asset->stylesheets($env);
    echo $asset->scripts('header', $env); ?>
</head>
<body class="<?= $this->config->module . '-' . $this->config->controller . '-' . $this->config->action; ?> <?= $this->data('bodyClass'); ?>">
    <div class="skeleton">
        <?= $this->getContent(); ?>
    </div>

    <?php if (!($this->config->module === 'common' && $this->config->controller === 'index')) {
        echo $this->open('toolbar');
    } ?>

    <?= $asset->scripts('footer', $env); ?>
</body>
</html>