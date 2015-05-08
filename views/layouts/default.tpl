<!DOCTYPE html>
<html xmlns:og="http://ogp.me/ns#" xmlns:fb="http://ogp.me/ns/fb#">
<head>
    <meta name="charset" content="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><?= $pageTitle; ?> - Project Titon</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="msapplication-TileColor" content="#000000">
    <meta name="msapplication-TileImage" content="https://s3.amazonaws.com/titon/logo-144.png">
    <link rel="apple-touch-icon-precomposed" href="https://s3.amazonaws.com/titon/logo-152.png">
    <?= $this->section('open-graph'); ?>
    <link href="//fonts.googleapis.com/css?family=Droid+Sans:400,700" media="screen" rel="stylesheet" type="text/css">
    <link href="<?= $this->asset('/css/style.min.css'); ?>" media="screen" rel="stylesheet" type="text/css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="<?= $this->asset('/js/vendors/toolkit.min.js'); ?>"></script>
    <script src="<?= $this->asset('/js/common.min.js'); ?>"></script>
    <?= $this->section('head'); ?>
</head>
<body>
    <div class="skeleton">
        <?= $this->section('content'); ?>
    </div>

    <?= $this->section('foot'); ?>

    <?php if (APP_ENV !== 'development') { ?>
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
