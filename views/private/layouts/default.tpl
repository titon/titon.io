<!DOCTYPE html>
<html>
<head>
    <meta name="charset" content="UTF-8">
    <title><?php echo $html->title(); ?></title>
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
<body<?php if ($bodyClass = $this->data('bodyClass')) { ?> class="<?php echo $bodyClass; ?>" <?php }?>>
    <div class="skeleton">
        <?php echo $this->getContent(); ?>
    </div>

    <?php if (empty($route) || !($route->getParam('module') === 'common' && $route->getParam('controller') === 'index')) {
        echo $this->open('toolbar');
    } ?>

    <?php echo $asset->scripts('footer', $env); ?>
</body>
</html>