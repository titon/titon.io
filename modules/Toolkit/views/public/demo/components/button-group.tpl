<?php
$classes = array($demo->value('size'), $demo->value('shape'), $demo->value('effect'));
$state = $demo->value('state');
$count = (int) $demo->value('count', 3);

if ($mod = $demo->value('modifier')) {
    $classes[] = 'button-group--' . $mod;
} else {
    $classes[] = 'button-group';
}

if ($demo->value('active')) {
    $classes[] = 'is-active';
} else if ($demo->value('disabled')) {
    $classes[] = 'is-disabled';
}

$classes = implode(' ', array_filter($classes)); ?>

<p>Default button group.</p>

<div class="<?php echo $classes; ?>">
    <?php for ($i = 1; $i <= $count; $i++) { ?>
        <button type="button" class="button <?php echo $state; ?>">Button</button>
    <?php } ?>
</div>

<p>With anchor links.</p>

<div class="<?php echo $classes; ?>">
    <?php for ($i = 1; $i <= $count; $i++) { ?>
        <a href="javascript:;" class="button <?php echo $state; ?>">Anchor</a>
    <?php } ?>
</div>

<p>Using an unordered list.</p>

<ul class="<?php echo $classes; ?>">
    <?php for ($i = 1; $i <= $count; $i++) { ?>
        <li><a href="javascript:;" class="button <?php echo $state; ?>">Anchor</a></li>
    <?php } ?>
</ul>