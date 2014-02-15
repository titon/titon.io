<?php $this->useLayout('modal');

$block->start('modal-actions');
    echo $html->anchor('View Docs', 'https://github.com/titon/toolkit/tree/master/docs', ['class' => 'button is-success']);
$block->stop(); ?>

<p>Fully fledged documentation currently does not exist for Toolkit packages.
However, there is a <code>docs</code> folder located within the git repository that is currently being worked on.</p>