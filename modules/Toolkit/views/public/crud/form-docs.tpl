<?php if ($doc) { ?>
    <h2>Edit Doc</h2>
<?php } else { ?>
    <h2>Add Doc</h2>
<?php } ?>

<?php
echo $this->form->open('Doc');
echo $this->open('form/select', ['field' => 'parent_id', 'options' => $docs]);
echo $this->open('form/input', ['field' => 'title']);
echo $this->open('form/input', ['field' => 'slug']);
echo $this->open('form/textarea', ['field' => 'content']);
//echo $this->open('form/input', ['field' => 'left']);
//echo $this->open('form/input', ['field' => 'right']);
//echo $this->open('form/input', ['field' => 'version']);
//echo $this->open('form/input', ['field' => 'created', 'type' => 'datetime']);
//echo $this->open('form/input', ['field' => 'updated', 'type' => 'datetime']);
echo $this->open('form/submit');
echo $this->form->close(); ?>