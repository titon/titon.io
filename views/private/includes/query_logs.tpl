<?php
/** @type \Titon\Model\Connection $conn */
$conn = \Titon\Common\Registry::factory('Titon\Model\Connection');
$drivers = $conn->getDrivers(); ?>

<table class="table">
    <thead>
        <tr>
            <td>Query</td>
            <td>Affected</td>
            <td>Time</td>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($drivers as $name => $driver) { ?>
            <tr class="divider">
                <td colspan="3" class="align-center">
                    <b><?php echo $name; ?></b>
                </td>
            </tr>
            <?php foreach ($driver->getLoggedQueries() as $query) { ?>
                <tr>
                    <td><?php echo $query->getStatement(); ?></td>
                    <td><?php echo $query->getRowCount(); ?></td>
                    <td><?php echo $query->getExecutionTime(); ?></td>
                </tr>
            <?php }
        } ?>
    </tbody>
</table>