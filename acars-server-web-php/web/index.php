<?php require_once 'layout.php'; ?>

<div class="container-fluid">

  <div class="row mt-4">
    <div class="col-sm-6">
  <h2>Stations</h2>

  <table class="table table-sm table-bordered">
    <tr>
      <th>ID</th>
      <th>Station</th>
      <th>IP Address</th>
      <th># of Messages</th>
    </tr>
  <?php
    $query = "SELECT * from Stations ORDER BY IdStation ASC";
    foreach ($dbh->query($query) as $row)
    {
      echo $row;
  ?>
    <tr>
      <td><a href="station.php?id=<?php echo $row[0]; ?>"><?php echo $row[0]; ?></a></td>
      <td><?php echo $row[1]; ?></td>
      <td><?php
        $bits = explode('.', $row[1]);
        echo "x.x.".$bits[2].".".$bits[3];
      ?></td>
      <td>
        <?php
          $query = "SELECT COUNT(*) FROM Messages WHERE StID = \"{$row[0]}\"";
          $count = $dbh->query($query)->fetch()[0];
          echo $count;
        ?>
      </td>
    </tr>
  <?php
    }
  ?>
  </table>
    </div>
  </div>

  <h2 class="mt-4">Recent Messages</h2>
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
    $query = "SELECT * from Messages ORDER BY Time DESC LIMIT 10";
    foreach ($dbh->query($query) as $row)
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

  <div class="row mt-4">
    <div class="col-sm-6">
  <h2>Aircraft</h2>

  <table class="table table-sm table-bordered">
    <tr>
      <th>Tail</th>
      <th># Flights</th>
    </tr>
  <?php
    $query =  "SELECT Registration, count(Registration) FROM Flights GROUP BY Registration ORDER BY Registration ASC";
    foreach ($dbh->query($query) as $row)
    {
  ?>
    <tr>
      <td><a href="/reg.php?registration=<?php echo $row[0]; ?>"><?php echo $row[0]; ?></a></td>
      <td><?php echo $row[1]; ?></td>
    </tr>
  <?php
    }
    $dbh = null;
  ?>
  </table>
    </div>
  </div>

</div>
