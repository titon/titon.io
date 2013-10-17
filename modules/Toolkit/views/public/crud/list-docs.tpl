<h2>Docs</h2>

<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Parent ID</th>
            <th>Title</th>
            <th>Slug</th>
            <th>Content</th>
            <th>Left</th>
            <th>Right</th>
            <th>Version</th>
            <th>Created</th>
            <th>Updated</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($docs as $doc) { ?>
            <tr>
                <td><?php echo $doc->id; ?></td>
                <td><?php echo $doc->parent_id; ?></td>
                <td>
                    <?php echo $this->html->anchor($doc->title, ['action' => 'form_docs', $doc->id]); ?>
                </td>
                <td><?php echo $doc->slug; ?></td>
                <td><?php echo $doc->content; ?></td>
                <td><?php echo $doc->left; ?></td>
                <td><?php echo $doc->right; ?></td>
                <td><?php echo $doc->version; ?></td>
                <td><?php echo $doc->created; ?></td>
                <td><?php echo $doc->updated; ?></td>
            </tr>
        <?php } ?>
    </tbody>
</table>