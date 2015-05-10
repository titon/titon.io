<ul>
    <? foreach ($chapters as $chapter) {
        if (isset($chapter['divider'])) {
            continue;
        }

        if (strpos($chapter['url'], '#') !== false) {
            $url = '#' . explode('#', $chapter['url'])[1];
        } else {
            $url = $this->url('toolkit.docs', ['version' => $version, 'path' => trim($chapter['url'], '/')]);
        } ?>

        <li>
            <a href="<?= $url; ?>"><?= preg_replace_callback('/^\s+/', function($matches) {
                return str_replace(' ', '&nbsp;&nbsp;', $matches[0]);
            }, $chapter['title']); ?></a>
        </li>

    <? } ?>
</ul>
