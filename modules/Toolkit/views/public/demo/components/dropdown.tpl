<?php
$class = '';

if ($mod = $demo->value('modifier')) {
    $class = 'on-' . $mod;
}

if ($pos = $demo->value('align')) {
    $class .= ' ' . $pos;
} ?>

<div class="demo-center">
    <div class="button-group">
        <button type="button" class="button js-dropdown" data-dropdown="#dropdown-1">
            Open Dropdown
            <span class="caret-down"></span>
        </button>

        <ul class="dropdown <?php echo $class; ?>" id="dropdown-1">
            <li><a href="javascript:;">Some Dropdown</a></li>
            <li><a href="javascript:;">With A Divider</a></li>
            <li class="dropdown-divider"></li>
            <li class="has-children">
                <a href="javascript:;">
                    <span class="caret-right"></span>
                    Contains Children
                </a>
                <ul class="dropdown">
                    <li><a href="javascript:;">Action</a></li>
                    <li><a href="javascript:;">Another Action</a></li>
                    <li><a href="javascript:;">Last Action</a></li>
                </ul>
            </li>
            <li><a href="javascript:;">Last Item</a></li>
        </ul>
    </div>

    <div class="button-group">
        <button type="button" class="button js-dropdown" data-dropdown="#dropdown-2">
            Open Dropdown
            <span class="caret-down"></span>
        </button>

        <ul class="dropdown <?php echo $class; ?>" id="dropdown-2">
            <li class="dropdown-heading">Heading</li>
            <li><a href="javascript:;">Another Dropdown</a></li>
            <li><a href="javascript:;">Contains Headings</a></li>
            <li class="dropdown-heading">Heading</li>
            <li><a href="javascript:;">Last Item</a></li>
        </ul>
    </div>
</div>

<script>
    <?php if ($vendor === 'mootools') { ?>
        window.addEvent('domready', function() {
            $$('.js-dropdown').dropdown({
                mode: <?= $demo->string('mode', 'click'); ?>,
                hideOpened: <?= $demo->bool('hideOpened'); ?>
            });
        });
    <?php } else { ?>
        $(function() {
            $('.js-dropdown').dropdown({
                mode: <?= $demo->string('mode', 'click'); ?>,
                hideOpened: <?= $demo->bool('hideOpened'); ?>
            });
        });
    <?php } ?>
</script>