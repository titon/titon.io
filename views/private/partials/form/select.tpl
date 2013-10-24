<?php
$options = isset($options) ? $options : [];
$attributes = isset($attributes) ? $attributes : []; ?>

<div class="field">
    <?php
    echo $this->form->label($field, \Titon\G11n\Utility\Inflector::titleCase($field), ['class' => 'field-label']);
    echo $this->form->select($field, $options, $attributes + ['class' => 'input', 'empty' => true]); ?>
</div>