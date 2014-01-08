<?php
$asset->addStylesheet('//fonts.googleapis.com/css?family=Droid+Sans:400,700');
$asset->addStylesheet('/css/vendors/font-awesome.min');
$asset->addStylesheet('/css/style.min');
$asset->addStylesheet('/css/debug.min', [], 100, 'dev');
$asset->addScript('//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js');
$asset->addScript('/js/vendors/titon.min');
$asset->addScript('/js/script.min');

$breadcrumb->add('Project Titon', '/');

$env = $this->data('env', 'prod'); ?>

<!DOCTYPE html>
<html xmlns:og="http://ogp.me/ns#" xmlns:fb="http://ogp.me/ns/fb#">
<head>
    <meta name="charset" content="UTF-8">
    <title><?= $breadcrumb->title(); ?></title>
    <?= $this->open('meta-tags'); ?>
    <?= $this->open('open-graph'); ?>
    <?= $asset->stylesheets($env); ?>
    <?= $asset->scripts('header', $env); ?>
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