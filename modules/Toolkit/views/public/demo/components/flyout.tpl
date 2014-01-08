
<a href="/" class="button js-flyout">Display Root Menu</a>
<br><br>
<a href="/3/0" class="button js-flyout">Display 3>0 Menu</a>
<br><br>
<a href="/0/0/1" class="button js-flyout">Display 0>0>1 Menu</a>

<script>
    <?php if ($vendor === 'mootools') { ?>
        window.addEvent('domready', function() {
            $$('.button').addEvent('click', function(e) {
                e.preventDefault();
            });

            $$('.js-flyout').flyout('ajax/flyout.php', {
                delegate: '.js-flyout',
                className: <?= $demo->string('className'); ?>,
                mode: <?= $demo->string('mode', 'hover'); ?>,
                getUrl: <?= $demo->string('getUrl', 'href'); ?>,
                xOffset: <?= $demo->number('xOffset'); ?>,
                yOffset: <?= $demo->number('yOffset'); ?>,
                showDelay: <?= $demo->number('showDelay', 350); ?>,
                hideDelay: <?= $demo->number('hideDelay', 500); ?>,
                itemLimit: <?= $demo->number('itemLimit', 15); ?>
            });
        });
    <?php } else { ?>
        $(function() {
            $('.button').on('click', function(e) {
                e.preventDefault();
            });

            $('.js-flyout').flyout('ajax/flyout.php', {
                className: <?= $demo->string('className'); ?>,
                mode: <?= $demo->string('mode', 'hover'); ?>,
                getUrl: <?= $demo->string('getUrl', 'href'); ?>,
                xOffset: <?= $demo->number('xOffset'); ?>,
                yOffset: <?= $demo->number('yOffset'); ?>,
                showDelay: <?= $demo->number('showDelay', 350); ?>,
                hideDelay: <?= $demo->number('hideDelay', 500); ?>,
                itemLimit: <?= $demo->number('itemLimit', 15); ?>
            });
        });
    <?php } ?>
</script>