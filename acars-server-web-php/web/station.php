<?php require_once 'layout.php'; ?>

<?php
  $query = "SELECT * FROM Stations WHERE StID = \"{$_GET["id"]}\"";
  $station = $dbh->query($query)->fetch();
?>

<div class="container-fluid">
  <h1><?php echo $station[1]; ?></h1>
  <div><?php
    $bits = explode('.', $station[2]);
    echo "x.x.${bits[2]}.${bits[3]}";
  ?></div>

  <h2 class="mt-4">
    Recent Messages
    <small><a href="messages.php?station_id=<?php echo $station[0]; ?>" class="text-muted">All Messages</a></small>
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
    $query = "SELECT * from Messages WHERE StID = \"{$station[0]}\" ORDER BY Time DESC LIMIT 10";
    foreach ($dbh->query($query) as $row)
    {
  ?>
    <tr>
      <td rowspan="2" class="align-middle"><?php echo $row[0]; ?></td>
      <td rowspan="2" class="align-middle"><?php echo $row[2]; ?></td>
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
      <td colspan="8"><?php echo $row[12]; ?></td>
    </tr>
  <?php
    }
  ?>
  </table>  

</div>
