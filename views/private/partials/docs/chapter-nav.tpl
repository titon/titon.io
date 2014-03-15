<ul>
    <?php foreach ($chapters as $chapter) { ?>

        <li>
            <a href="<?= $chapter['url']; ?>" class="scroll-to">
                <?= $chapter['title']; ?>
            </a>

            <?php if (!empty($chapter['children'])) {
                echo $this->open('docs/chapter-nav', ['chapters' => $chapter['children']]);
            } ?>
        </li>

    <?php } ?>
</ul>