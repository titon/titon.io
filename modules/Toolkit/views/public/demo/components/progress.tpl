<?php
$classes = array($demo->value('size'), $demo->value('state'), $demo->value('shape'));
$classes = implode(' ', array_filter($classes)); ?>

<div class="progress <?php echo $classes; ?>">
    <div class="progress-bar" style="width: <?= $demo->number('width', 55); ?>%"><?= $demo->number('width', 55); ?>%</div>
</div>