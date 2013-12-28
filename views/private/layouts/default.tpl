<!DOCTYPE html>
<html>
<head>
    <meta name="charset" content="UTF-8">
    <title><?php echo $this->html->title(); ?></title>
    <?php
    $this->asset->addStylesheet('//fonts.googleapis.com/css?family=Droid+Sans:400,700');
    $this->asset->addStylesheet('/css/style.css', 'screen');
    $this->asset->addStylesheet('/css/debug.css', 'screen', 100, 'dev');
    $this->asset->addScript('//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js');

    echo $this->asset->stylesheets(isset($env) ? $env : 'dev');
    echo $this->asset->scripts(isset($env) ? $env : 'dev'); ?>
</head>
<body>
    <?php
    echo $this->getContent();
    echo $this->open('query_logs'); ?>
</body>
</html>