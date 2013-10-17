<?php
$type = isset($type) ? $type : 'text';
$attributes = isset($attributes) ? $attributes : []; ?>

<div class="field">
    <?php
    echo $this->form->label($field, \Titon\G11n\Utility\Inflector::titleCase($field), ['class' => 'field-label']);
    echo $this->form->{$type}($field, $attributes + ['class' => 'input']); ?>
</div>