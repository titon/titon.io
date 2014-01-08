<?php
$count = $demo->value('count', 5);
$state = $demo->value('state');
$classes = array($demo->value('size'), $demo->value('shape'), $demo->value('effect'));

if ($mod = $demo->value('modifier')) {
    $classes[] = 'pagination--' . $mod;
} else {
    $classes[] = 'pagination';
}

$classes = implode(' ', array_filter($classes)); ?>

<nav class="<?php echo $classes; ?>">
    <ul>
        <li><a href="javascript:;" class="button <?php echo $state; ?>">&laquo;</a></li>
        <?php for ($i = 1; $i <= $count; $i++) { ?>
            <li><a href="javascript:;" class="button <?php echo $state; ?>"><?php echo $i; ?></a></li>
        <?php } ?>
        <li><a href="javascript:;" class="button <?php echo $state; ?>">&raquo;</a></li>
    </ul>
</nav>