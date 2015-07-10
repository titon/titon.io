<!DOCTYPE html>
<html lang="en" dir="ltr" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://ogp.me/ns/fb#">
<head>
    <meta name="charset" content="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Project Titon</title>
    <?= $this->fetch('partials/meta-tags'); ?>
    <?= $this->fetch('partials/open-graph'); ?>
    <link href="//fonts.googleapis.com/css?family=Droid+Sans:400,700" media="screen" rel="stylesheet" type="text/css">
    <link href="<?= $this->asset('/css/style.min.css'); ?>" media="screen" rel="stylesheet" type="text/css">
    <link href="<?= $this->asset('/css/home.min.css'); ?>" media="screen" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="skeleton">
        <?= $this->section('content'); ?>
    </div>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="<?= $this->asset('/js/vendors/toolkit.min.js'); ?>"></script>
    <script src="<?= $this->asset('/js/home.min.js'); ?>"></script>
    <?= $this->fetch('partials/analytics'); ?>
</body>
</html>
