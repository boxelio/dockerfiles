<?php require_once 'layout.php'; ?>

<?php
  if (isset($_GET["station_id"])) {
    $query = "SELECT * FROM Messages WHERE StID = \"{$_GET["station_id"]}\" ORDER BY Time DESC";
  } else {
    $query = "SELECT * FROM Messages ORDER BY Time Desc";
  }
  $messages = $dbh->query($query);
?>

<h2 class="mt-4">
  All Messages
  <?php if (isset($_GET["station_id"])) { echo "for Station {$_GET["station_id"]}"; } ?>
</h2>
<table class="table table-sm table-bordered">
  <tr>
    <th>Message ID</th>
    <th>Time</th>
    <th>Station ID</th>
    <th>Channel</th>
    <th>Error</th>
    <th>Signal</th>
    <th>Mode</th>
    <th>Ack</th>
    <th>Label</th>
    <th>Block #</th>
    <th>MSG #</th>
  </tr>
<?php
  foreach ($messages as $row)
  {
?>
  <tr>
    <td rowspan="2" class="align-middle"><?php echo $row[0]; ?></td>
    <td rowspan="2" class="align-middle"><?php echo $row[2]; ?></td>
    <td><?php echo $row[3]; ?></td>
    <td><?php echo round($row[4] / 1000000, 3); ?>&nbsp;MHz</td>
    <td><?php echo $row[5]; ?></td>
    <td><?php echo $row[6]; ?></td>
    <td><?php echo $row[7]; ?></td>
    <td><?php echo $row[8]; ?></td>
    <td><?php echo $row[9]; ?></td>
    <td><?php echo $row[10]; ?></td>
    <td><?php echo $row[11]; ?></td>
  </tr>
  <tr>
    <td colspan="9"><?php echo $row[12]; ?></td>
  </tr>
<?php
  }
?>
</table>