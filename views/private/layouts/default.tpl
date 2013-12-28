<!DOCTYPE html>
<html>
<head>
    <meta name="charset" content="UTF-8">
    <title><?php echo $html->title(); ?></title>
    <?php
    $asset->addStylesheet('//fonts.googleapis.com/css?family=Droid+Sans:400,700');
    $asset->addStylesheet('/css/style');
    $asset->addStylesheet('/css/debug', [], 100, 'dev');
    $asset->addScript('//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js', 'header');

    $env = $this->data('env', 'prod');

    echo $asset->stylesheets($env);
    echo $asset->scripts('header', $env); ?>
</head>
<body>
    <?php echo $this->getContent(); ?>
</body>
</html>