<?php include 'header.php'; ?>

<?php
  if (isset($_GET["station_id"])) {
    $query = "SELECT * FROM messages WHERE station_id = ".$_GET["station_id"]." ORDER BY timestamp DESC";
  } else {
    $query = "SELECT * FROM messages ORDER BY timestamp Desc";
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
    <td rowspan="2" class="align-middle"><?php echo $row['id']; ?></td>
    <td rowspan="2" class="align-middle"><?php echo $row['timestamp']; ?></td>
    <td><?php echo $row['station_id']; ?></td>
    <td><?php echo round($row['channel'] / 1000000, 3); ?>&nbsp;MHz</td>
    <td><?php echo $row['error']; ?></td>
    <td><?php echo $row['signal']; ?></td>
    <td><?php echo $row['mode']; ?></td>
    <td><?php echo $row['ack']; ?></td>
    <td><?php echo $row['label']; ?></td>
    <td><?php echo $row['block_id']; ?></td>
    <td><?php echo $row['message_number']; ?></td>
  </tr>
  <tr>
    <td colspan="9"><?php echo $row['text']; ?></td>
  </tr>
<?php
  }
?>
</table>

<?php include 'footer.php'; ?>
