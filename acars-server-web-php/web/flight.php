<?php require_once 'layout.php'; ?>

<?php
  $query =  "SELECT * FROM Flights WHERE FlightID = \"{$_GET["id"]}\"";
  $flight = $dbh->query($query)->fetch();
?>

<h1>
  Flight <?php echo $flight[2]; ?>
  <small>(Tail <?php echo $flight[1]; ?>)</small>
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
  $query = "SELECT * FROM Messages WHERE FlightID = \"{$_GET["id"]}\"";
  foreach ($dbh->query($query) as $row)
  {
?>
  <tr>
    <td><?php echo $row[0]; ?></td>
    <td><?php echo $row[2]; ?></td>
    <td><?php echo $row[3]; ?></td>
    <td><?php echo $row[4]; ?></td>
    <td><?php echo $row[5]; ?></td>
    <td><?php echo $row[6]; ?></td>
    <td><?php echo $row[7]; ?></td>
    <td><?php echo $row[8]; ?></td>
    <td><?php echo $row[9]; ?></td>
    <td><?php echo $row[10]; ?></td>
    <td><?php echo $row[11]; ?></td>
    <td><?php echo $row[12]; ?></td>
  </tr>
<?php
  }
  $dbh = null;
?>
