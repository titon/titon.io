<?php
$this->useLayout('docs');

$breadcrumb->add($component['name'], ['route' => 'toolkit.demo.component', 'component' => $component['key']]);
$breadcrumb->add('Demo', 'toolkit.demo');
$breadcrumb->add('Toolkit', 'toolkit'); ?>

<?= $form->open('Demo', ['method' => 'get']); ?>

<header class="head">
    <div class="wrapper">
        <h1><?= $component['name']; ?></h1>
    </div>
</header>

<main class="body">
    <div class="wrapper demo">
        <?php if (!empty($component['filters'])) { ?>
            <ul class="demo-filters">
                <?php foreach ($component['filters'] as $name => $filter) {
                    $default = isset($filter['default']) ? $filter['default'] : ''; ?>

                    <li>
                        <?= $form->label($name, $filter['title']);

                        if (!empty($filter['data'])) {
                            echo $form->select($name, $filter['data']);

                        } else if ($filter['type'] === 'text') {
                            echo $form->text($name);

                        } else if ($filter['type'] === 'number') {
                            echo $form->text($name, ['type' => 'number', 'pattern' => '\d+']);

                        } else if ($filter['type'] === 'boolean') {
                            echo $form->hidden($name, ['id' => 'demo-' . strtolower($name) . '-hidden']);
                            echo $form->checkbox($name, null);
                        } ?>
                    </li>
                <?php } ?>

                <li>
                    <?= $form->submit('Filter', ['class' => 'button small is-info']); ?>
                </li>
            </ul>
        <?php }

        // Include the individual template
        include_once sprintf('%s/components/%s.tpl', __DIR__, $component['key']); ?>
    </div>
</main>

<?= $form->close(); ?>