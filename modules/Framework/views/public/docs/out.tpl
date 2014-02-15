<?php $this->useLayout('modal');

$block->start('modal-actions');
    echo $html->anchor('View GitHub', 'https://github.com/titon', ['class' => 'button is-success']);
$block->stop(); ?>

<p>Fully fledged documentation currently does not exist for Framework packages.
However, within each git repository is a <code>docs</code> folder with basic instructions on how to use the package.</p>