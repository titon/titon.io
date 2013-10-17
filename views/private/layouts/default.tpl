<!DOCTYPE html>
<html>
<head>
    <title><?php echo $this->html->title(); ?></title>
    <?php
    $this->asset->addStylesheet('/css/vendor/toolkit.min.css', 'screen');
    $this->asset->addStylesheet('/css/style.min.css', 'screen');
    $this->asset->addStylesheet('/css/debug.css', 'screen', 100, 'dev');

    echo $this->asset->stylesheets(isset($env) ? $env : 'dev'); ?>
</head>
<body>
    <?php
    echo $this->getContent();
    echo $this->open('query_logs'); ?>
</body>
</html>