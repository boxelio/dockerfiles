<?php include 'header.php'; ?>

<?php
  $query =  "SELECT * FROM airframes WHERE id = ".$_GET["airframe_id"];
  $airframe = $dbh->query($query)->fetch();
?>

<h1>
  <?php echo $airframe['tail']; ?>
</h1>

<h2>Flights</h2>
<table class="table table-sm table-bordered">
  <tr>
    <th>ID</th>
    <th>Flight</th>
    <th>Created</th>
    <th>Updated</th>
  </tr>
<?php
  $query =  "SELECT * FROM flights WHERE airframe_id = ".$_GET["airframe_id"]." ORDER BY created_at DESC";
  foreach ($dbh->query($query) as $row)
  {
?>
  <tr>
    <td><a href="/flight.php?id=<?php echo $row['id']; ?>"><?php echo $row['id']; ?></a></td>
    <td><?php echo $row['flight']; ?></td>
    <td><?php echo $row['created_at']; ?></td>
    <td><?php echo $row['updated_at']; ?></td>
  </tr>
<?php
  }
  $dbh = null;
?>
</table>

<?php include 'footer.php'; ?>
