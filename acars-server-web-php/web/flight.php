<?php include 'header.php'; ?>

<?php
  $query =  "SELECT * FROM flights WHERE id = ".$_GET["id"];
  $flight = $dbh->query($query)->fetch();
?>

<h1>
  Flight <?php echo $flight['flight']; ?>
  <small>(Tail <?php echo $flight['airframe_id']; ?>)</small>
</h1>

<h2>Messages</h2>
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
    <th>Text</th>
  </tr>
<?php
  $query = "SELECT * FROM messages WHERE flight_id = ".$_GET["id"]." ORDER BY timestamp DESC";
  foreach ($dbh->query($query) as $row)
  {
?>
  <tr>
    <td><?php echo $row['id']; ?></td>
    <td><?php echo $row['timestamp']; ?></td>
    <td><?php echo $row['station_id']; ?></td>
    <td><?php echo $row['channel']; ?></td>
    <td><?php echo $row['error']; ?></td>
    <td><?php echo $row['signal']; ?></td>
    <td><?php echo $row['mode']; ?></td>
    <td><?php echo $row['ack']; ?></td>
    <td><?php echo $row['label']; ?></td>
    <td><?php echo $row['block_id']; ?></td>
    <td><?php echo $row['message_number']; ?></td>
    <td><?php echo $row['text']; ?></td>
  </tr>
<?php
  }
?>

<?php include 'footer.php'; ?>
