<!DOCTYPE html>
<html lang="en" dir="ltr" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://ogp.me/ns/fb#">
<head>
    <meta name="charset" content="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><?= $pageTitle; ?> - Project Titon</title>
    <?= $this->fetch('partials/meta-tags'); ?>
    <?= $this->fetch('partials/open-graph', ['pageTitle' => $pageTitle]); ?>
    <link href="//fonts.googleapis.com/css?family=Droid+Sans:400,700" media="screen" rel="stylesheet" type="text/css">
    <link href="<?= $this->asset('/css/style.min.css'); ?>" media="screen" rel="stylesheet" type="text/css">
    <link href="<?= $this->asset('/css/' . $bodyClass . '.min.css'); ?>" media="screen" rel="stylesheet" type="text/css">
    <?= $this->section('head'); ?>
</head>
<body class="<?= $bodyClass; ?>">
    <?= $this->fetch('partials/toolbar'); ?>

    <div class="skeleton <?= $skeletonClass; ?>">
        <?= $this->section('content'); ?>
    </div>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="<?= $this->asset('/js/vendors/toolkit.min.js'); ?>"></script>
    <script src="<?= $this->asset('/js/common.min.js'); ?>"></script>
    <?= $this->section('foot'); ?>
    <?= $this->fetch('partials/analytics'); ?>

    <!-- <?= $env; ?> - <?= $locale; ?> -->
</body>
</html>
