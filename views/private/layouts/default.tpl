<?php
$env = $this->data('env', 'prod');
$module = $this->getConfig('module');
$controller = $this->getConfig('controller');
$action = $this->getConfig('action');

$asset->addStylesheet('//fonts.googleapis.com/css?family=Droid+Sans:400,700');
$asset->addStylesheet('/css/style.min');
$asset->addStylesheet('/css/debug.min', [], 100, 'dev');
$asset->addScript('//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js');
$asset->addScript('/js/vendors/toolkit.min');
$asset->addScript('/js/script.min');

if ($module !== 'main') {
    $asset->addStylesheet('/css/' . $module . '.min');
}

$breadcrumb->add('Project Titon', '/'); ?>

<!DOCTYPE html>
<html xmlns:og="http://ogp.me/ns#" xmlns:fb="http://ogp.me/ns/fb#">
<head>
    <meta name="charset" content="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><?= $breadcrumb->title(); ?></title>
    <?= $this->open('meta-tags'); ?>
    <?= $this->open('open-graph'); ?>
    <?= $asset->stylesheets($env); ?>
    <?= $asset->scripts('header', $env); ?>
</head>
<body class="<?= $module . '-' . $controller . '-' . $action; ?> <?= $this->data('bodyClass'); ?>">
    <?php if (!($module === 'main' && $controller === 'index')) {
        echo $this->open('toolbar');
    } ?>

    <div class="skeleton <?= $this->data('skeletonClass'); ?>">
        <?= $this->getContent(); ?>
    </div>

    <?= $asset->scripts('footer', $env); ?>

    <?php if ($env !== 'dev') { ?>
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-41018071-2', 'titon.io');
            ga('send', 'pageview');
        </script>
    <?php } ?>
</body>
</html>