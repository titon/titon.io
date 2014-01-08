<?php
$classes = array($demo->value('size'), $demo->value('state'), $demo->value('shape'), $demo->value('effect'));

if ($demo->value('active')) {
    $classes[] = 'is-active';
} else if ($demo->value('disabled')) {
    $classes[] = 'is-disabled';
}

$classes = implode(' ', array_filter($classes)); ?>

<button type="button" class="button <?php echo $classes; ?>">Button</button>
<a href="javascript:;" class="button <?php echo $classes; ?>">Anchor</a>