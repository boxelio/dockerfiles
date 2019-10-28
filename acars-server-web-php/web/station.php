<?php include 'header.php'; ?>

<?php
  $query = "SELECT * FROM stations WHERE id = ".$_GET["id"];
  $station = $dbh->query($query)->fetch();
?>

<div class="container-fluid">
  <h1><?php echo $station['ident']; ?></h1>
  <div><?php
    $bits = explode('.', $station['ip_address']);
    echo $bits[0].".x.x.".$bits[3];
  ?></div>

  <h2 class="mt-4">
    Recent Messages
    <small><a href="messages.php?station_id=<?php echo $station['id']; ?>" class="text-muted">All Messages</a></small>
  </h2>
  <table class="table table-sm table-bordered">
    <tr>
      <th>Message ID</th>
      <th>Time</th>
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
    $query = "SELECT * from messages WHERE station_id = ".$station['id']." ORDER BY timestamp DESC LIMIT 20";
    foreach ($dbh->query($query) as $row)
    {
  ?>
    <tr>
      <td rowspan="2" class="align-middle"><?php echo $row['id']; ?></td>
      <td rowspan="2" class="align-middle"><?php echo $row['timestamp']; ?></td>
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
      <td colspan="8"><?php echo $row['text']; ?></td>
    </tr>
  <?php
    }
  ?>
  </table>  

</div>

<?php include 'footer.php'; ?>
