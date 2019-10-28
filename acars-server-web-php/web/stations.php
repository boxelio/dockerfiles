<?php include 'header.php'; ?>

<h1>Stations</h1>

<table class="table table-sm table-bordered">
  <tr>
    <th>ID</th>
    <th>Station</th>
    <th>IP Address</th>
    <th># of Messages</th>
  </tr>
<?php
  $query = "SELECT a.id, a.ident, a.ip_address, count(b.id) message_count FROM stations a INNER JOIN messages b ON a.id = b.station_id GROUP BY a.id ORDER BY message_count DESC";
  foreach ($dbh->query($query) as $row):
?>
  <tr>
    <td><a href="station.php?id=<?php echo $row["id"]; ?>"><?php echo $row["id"]; ?></a></td>
    <td><?php echo $row["ident"]; ?></td>
    <td><?php
      // $ip = explode(':', $row['ip_address'])[0];
      $bits = explode('.', $row['ip_address']);
      echo $bits[0].".x.x.".$bits[3];
    ?></td>
    <td><?php echo $row["message_count"]; ?></td>
  </tr>
<?php
  endforeach;
?>
</table>

<?php include 'footer.php'; ?>
