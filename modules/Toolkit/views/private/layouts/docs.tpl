<?php
$asset->addStylesheet('//fonts.googleapis.com/css?family=Droid+Sans:400,700');
$asset->addStylesheet('/css/vendors/font-awesome.min');
$asset->addStylesheet('/css/style.min');
$asset->addStylesheet('/css/demo.min');
$asset->addStylesheet('/css/debug.min', [], 100, 'dev');
$asset->addScript('//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js', 'header');
$asset->addScript('/js/vendors/titon.min');
$asset->addScript('/js/docs.min');

$breadcrumb->add('Project Titon', '/');

$env = $this->data('env', 'prod');
$og = [];

if (!empty($component)) {
    $og = [
        'description' => $component['description'],
        'url' => url(['route' => 'toolkit.demo.component', 'component' => $component['key']])
    ];
} ?>

<!DOCTYPE html>
<html xmlns:og="http://ogp.me/ns#" xmlns:fb="http://ogp.me/ns/fb#">
<head>
    <meta name="charset" content="UTF-8">
    <title><?= $breadcrumb->title(); ?></title>
    <?= $this->open('meta-tags'); ?>
    <?= $this->open('open-graph', $og); ?>
    <?= $asset->stylesheets($env); ?>
    <?= $asset->scripts('header', $env); ?>
</head>
<body class="<?= $this->config->module . '-' . $this->config->controller . '-' . $this->config->action; ?> <?= $this->data('bodyClass'); ?>">
    <div class="skeleton">
        <?= $this->getContent(); ?>
        <?= $this->open('footer'); ?>
    </div>

    <?= $this->open('toolbar'); ?>
    <?= $asset->scripts('footer', $env); ?>
</body>
</html>